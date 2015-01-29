//
//  AmazonS3Manager.h
//  CoreData
//
//  Created by James Coughlan on 02/09/2014.
//  Copyright (c) 2014 James Coughlan. All rights reserved.
//
//███████╗ ██████╗ ██████╗ ██╗      ██████╗  ██████╗ ██████╗ ███████╗
//██╔════╝██╔═══██╗██╔══██╗██║     ██╔═══██╗██╔═══██╗██╔══██╗██╔════╝
//█████╗  ██║   ██║██████╔╝██║     ██║   ██║██║   ██║██████╔╝███████╗
//██╔══╝  ██║   ██║██╔══██╗██║     ██║   ██║██║   ██║██╔═══╝ ╚════██║
//██║     ╚██████╔╝██║  ██║███████╗╚██████╔╝╚██████╔╝██║     ███████║
//╚═╝      ╚═════╝ ╚═╝  ╚═╝╚══════╝ ╚═════╝  ╚═════╝ ╚═╝     ╚══════╝



#import <UIKit/UIKit.h>
#import <AWSS3/AWSS3.h>
#import "AWSSettings.h"


@interface AmazonS3Manager : NSObject <AmazonServiceRequestDelegate, UIAlertViewDelegate>
{
    int imagesUploaded;
    NSMutableArray* requestArray;
    NSDictionary* requestParams;
    NSMutableDictionary* uploadParams;
}
typedef void (^ImageUploadedBlock)(BOOL success, NSString* filename);

@property(weak, nonatomic) IBOutlet UIProgressView* progressView;
@property(weak, nonatomic) IBOutlet UILabel* progressLabel;
@property(nonatomic, retain) IBOutlet AWSSettings* awsSettings;
@property(nonatomic, retain)IBOutlet AmazonS3Client* amazonClient;
@property(nonatomic, retain) NSMutableArray* fileNameQueue;
@property(nonatomic, copy)ImageUploadedBlock callback;
@property (nonatomic, retain)NSString* filename;
+ (id)sharedManager;

- (void)uploadImages:(NSDictionary *)images withParams:(NSDictionary*) params toBucket:(NSString*)bucket;
- (void)uploadImageData:(NSData *)data forKey:(NSString*)key withParams:(NSDictionary*) params toBucket:(NSString*)bucket withCallback:(ImageUploadedBlock)callback;
-(void)setAwsSettingsManually:(AWSSettings *)aws_settings;
-(NSData*)downloadImageWithFileName:(NSString*)filename andBucket:(NSString*)bucket;
@end



