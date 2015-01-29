//
//  AmazonS3Manager.m
//  CoreData
//
//  Created by James Coughlan on 02/09/2014.
//  Copyright (c) 2014 James Coughlan. All rights reserved.
//

#import "AmazonS3Manager.h"
#import "GingersnapSession.h"

@implementation AmazonS3Manager

@synthesize awsSettings;
@synthesize amazonClient;
@synthesize fileNameQueue;
- (NSString*) bucketName
{
    return self.awsSettings.aws_bucket;
}

#pragma mark Singleton Methods

+ (id)sharedManager
{
    static AmazonS3Manager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
        if(!sharedMyManager.fileNameQueue)
            sharedMyManager.fileNameQueue = [[NSMutableArray alloc] initWithObjects: nil];
    });
    return sharedMyManager;
}

-(id) init{
    if (self = [super init])
    {
    }
    return self;
}

-(void)setAwsSettingsManually:(AWSSettings *)aws_settings
{
    //AmazonS3 client setup
    self.awsSettings = aws_settings;
    
    [AmazonErrorHandler  shouldNotThrowExceptions];
    
    dispatch_async(dispatch_get_main_queue()
                   , ^{
                       self.amazonClient =  [[AmazonS3Client alloc] initWithAccessKey:aws_settings.aws_key withSecretKey:aws_settings.aws_secret];
                   });
}

-(NSData*)downloadImageWithFileName:(NSString*)filename andBucket:(NSString*)bucket
{
    if([fileNameQueue containsObject:filename])
    {
        NSLog(@"Aborting attempt to download %@", filename);
        // return nil;
        
    }else
        [fileNameQueue addObject:filename];
    
    @try{
        //        NSString* imageName = [filename stringByAppendingPathExtension:@"jpg"];
        //
        NSString* imageKey = @"";
        if ([filename rangeOfString:@"uploads"].location == NSNotFound) {
            NSString* append = [NSString stringWithFormat:@"uploads/%@/", bucket];
            imageKey = append;
        }
        imageKey = [imageKey stringByAppendingString:filename];
        
        NSLog(@"Request imageKey: %@", imageKey);
        NSLog(@"Request filename: %@", filename);
        NSLog(@"Request bucket: %@", bucket);
        NSLog(@"AWSSettings bucket: %@", awsSettings.aws_bucket);
        
        AmazonS3Client *_s3Client = self.amazonClient;
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
        
        S3GetObjectRequest *getObjectRequest = [[S3GetObjectRequest alloc]initWithKey:imageKey withBucket:awsSettings.aws_bucket];
        S3GetObjectResponse *response = [_s3Client getObject:getObjectRequest];
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        
        if (response.error == nil)
        {
            if (response.body != nil)
            {
                NSData* imageData = response.body;
                return imageData;
            }
            else{
                NSLog(@"There was no value in the response body");
                [fileNameQueue removeObject:filename];
                
                return nil;
            }
        }
        else if (response.error != nil)
        {
            [fileNameQueue removeObject:filename];
            
            NSLog(@"There was an error in the response while getting image: %@",response.error.description);
            return nil;
        }
    }
    @catch (AmazonServiceException *exception) {
        [fileNameQueue removeObject:filename];
        
        NSLog(@"There was an exception when connecting to s3: %@",exception.description);
        return nil;
    }
}
- (void)uploadImages:(NSDictionary *)images withParams:(NSDictionary*) params toBucket:(NSString*) bucket
{
    imagesUploaded = 0;
    requestParams = images;
    uploadParams = [params mutableCopy];
    
    if(requestArray == nil)
    {
        requestArray = [NSMutableArray arrayWithCapacity:images.count];
    }
    
    NSString* imageName = [[self generateUuidString] stringByAppendingPathExtension:@"jpg"];
    imageName = [NSString stringWithFormat:@"ios_%@", imageName];
    self.filename = imageName;
    self.amazonClient.timeout = 30;
    self.amazonClient.connectionTimeout = 30;
    S3TransferManager* s3TransferManager = [[S3TransferManager alloc] init];
    
    [s3TransferManager setS3:[[AmazonS3Manager sharedManager] amazonClient]];
    [s3TransferManager setDelegate:self];
    
    for(NSString* key in images) {
        
        NSString* imageKey = [NSString stringWithFormat: @"uploads/%@/", bucket];
        NSData* imageData = [images objectForKey:key];
        
        if([key rangeOfString:@"image" options:NSCaseInsensitiveSearch].location != NSNotFound)
        {
            [uploadParams setObject:imageName forKey:key];
            imageKey = [imageKey stringByAppendingString:imageName];
        }
        else
        {
            imageKey = [imageKey stringByAppendingString:[NSString stringWithFormat:@"%@%@", key ,imageName]];
        }
        
        [self createRequest:imageData withKey:imageKey forTransferManger:s3TransferManager];
    }
}

- (void)uploadImageData:(NSData *)data forKey:(NSString*)key withParams:(NSDictionary*) params toBucket:(NSString*)bucket withCallback:(ImageUploadedBlock)callback
{
    if(data != nil)
    {
        NSDictionary* image = [NSDictionary dictionaryWithObject:data forKey:key];
        self.callback = callback;
        [self uploadImages:image withParams:params toBucket:bucket];
    }
}

- (void)createRequest:(NSData*)imageData withKey:(NSString*)imageKey forTransferManger:(S3TransferManager*)transferManager
{
    S3PutObjectRequest* putImageRequest = [[S3PutObjectRequest alloc] initWithKey:imageKey inBucket:[[AmazonS3Manager sharedManager] bucketName]];
    [requestArray addObject:putImageRequest];
    [putImageRequest setData:imageData];
    [putImageRequest setContentType:@"image/jpeg"];
    [transferManager upload:putImageRequest];
    [requestArray removeObject:putImageRequest];
    NSLog(@"key: %@", awsSettings.aws_key);
    NSLog(@"secret: %@", awsSettings.aws_secret);
}

#pragma mark AmazonServiceRequest Delegate

// Sent when the request transmitted data, used to get progress feedback.
-(void)request:(AmazonServiceRequest *)request didSendData:(long long)bytesWritten totalBytesWritten:(long long)totalBytesWritten totalBytesExpectedToWrite:(long long)totalBytesExpectedToWrite
{
    float progress = (totalBytesExpectedToWrite/totalBytesWritten);
    progress = progress / (requestArray.count / imagesUploaded);
    
    if(self.progressView != nil)
        [self.progressView setProgress:progress animated:true];
    
    if(self.progressLabel != nil)
        [self.progressLabel setText:[NSString stringWithFormat:@"%u%%", (unsigned int)(progress *  100)]];
}

// Sent when the request completed, does not necessarily indicate that the request was successful.
- (void)request:(AmazonServiceRequest *)request didCompleteWithResponse:(AmazonServiceResponse *)response
{
    imagesUploaded++;
    
    if(response.error != nil) {
        [self showDialogForError:response.error];
        return;
    }
    
    if(imagesUploaded < requestArray.count  )
        return;
    
    if(self.progressView != nil)
        [self.progressView setProgress:1 animated:true];
    
    if(self.progressLabel != nil)
        [self.progressLabel setText:@"100%"];
    
    
    self.callback(YES,self.filename);
}

// Receiving this message indicates that the request failed to complete.
-(void)request:(AmazonServiceRequest *)request didFailWithError:(NSError *)error;
{
    [self showDialogForError:error];
    self.callback(NO,self.filename);
    
}

#pragma mark UIAlertView Delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //if(buttonIndex == 1)
    //  [self uploadImages:requestParams withParams:uploadParams];
}

#pragma mark Helper Methods

- (void)showDialogForError:(NSError*)error
{
    self.callback(NO,nil);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:@"Try Again", nil];
    [alert setDelegate: self];
    [alert show];
}

- (NSString *)generateUuidString
{
    // create a new UUID which you own
    CFUUIDRef uuid = CFUUIDCreate(kCFAllocatorDefault);
    
    // create a new CFStringRef (bridged to NSString) that you own
    NSString *uuidString = (NSString *) CFBridgingRelease(CFUUIDCreateString(kCFAllocatorDefault, uuid));
    
    // release the UUID
    CFRelease(uuid);
    
    return uuidString;
}

@end



