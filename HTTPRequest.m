
//
//  HTTPPutRequest.m
//  CoreData
//
//  Created by James Coughlan on 27/08/2014.
//  Copyright (c) 2014 James Coughlan. All rights reserved.
//

#import "HTTPRequest.h"
#import "GingersnapSession.h"

@implementation HTTPRequest
#pragma mark - Sythesizers

@synthesize urlRequest = _urlRequest;
@synthesize callback = _callback;
#pragma mark - Constructors
- (NSString *) timeInMiliSeconds
{
    NSDate *date = [NSDate date];
    NSString * timeInMS = [NSString stringWithFormat:@"%lld", [@(floor([date timeIntervalSince1970] * 1000)) longLongValue]];
    return timeInMS;
}
//*****Constructors*****\\//*****Initialise request with url, params, body, timeout*****
-(id) initWithUrl: (NSString*) url params: (NSArray*) params body:(NSString*)body timeout:(double) timeout callback:(OnResponseReceivedBlock) response andHTTPRequestType:(HTTPRequestType) httpRequestType
{
    
    self = [super init];
    NSString *urlAsString = [url copy];
    
    if([params count] > 0)
    {
        for (int i = 0; i < params.count;i ++)
        {
            NSString* string = ((NSString*)[params objectAtIndex:i]);
            string = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(
                                                                                           NULL,
                                                                                           (__bridge CFStringRef) string,
                                                                                           NULL,
                                                                                           CFSTR("!*'();:+$,/?%#[]\" "),
                                                                                           kCFStringEncodingUTF8));
            urlAsString = [urlAsString stringByAppendingString:string];
        }
    }
    
    NSURL* finalUrl = [NSURL URLWithString:urlAsString];
    
    _urlRequest = [NSMutableURLRequest requestWithURL:finalUrl];
    
    [_urlRequest setTimeoutInterval:timeout];
    
    if (body)
        [_urlRequest setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
    
    _callback = response;
    
    NSLog(@"Request Set up as: %@", finalUrl);
    
    
    return self;
}

-(NSCachedURLResponse*)connection:(NSURLConnection *)connection willCacheResponse:(NSCachedURLResponse *)cachedResponse {
    return nil;
}

-(void)logoutUser
{
//    dispatch_async(dispatch_get_main_queue(), ^{
//        
//        ElderberryAppController *appDelegate = (ElderberryAppController *)[[UIApplication sharedApplication] delegate];
//        [appDelegate logoutParent];
//    });
//    
//    if(isGPApp)
//    {
//        [GrandparentAppManager LogoutGrandparentWithEmail:[[ElderberrySession sharedManager] userExists].grandparent.email andToken:[[ElderberrySession sharedManager] userExists].auth_token withCallback:^(NSError *error) {
//            
//        }];
//    } else {
//        
//        [GrandchildAppManager logoutParentUser:[[ElderberrySession sharedManager] userExists] withCallback:^(NSError *error) {
//            if(!error) {
//                
//            }
//        }];
//        
//    }
}

//*****Constructors*****\\//*****Initialise request with simple url*****
-(id) initWithUrl: (NSString*) url onCompletion:(OnResponseReceivedBlock)onResponseReceived andHTTPRequestType:(HTTPRequestType) httpRequestType
{
    self = [super init];
    
    NSString *urlString = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]];
    
    self.urlRequest = [NSMutableURLRequest requestWithURL:
                       [NSURL URLWithString:urlString]];
    //  NSLog(@"%@", urlString);
    self.callback = onResponseReceived;
    return self;
}

#pragma mark - Request Specific

//*****Request Specific*****\\//*****Common request handler for all requests, returns JSON array and error to parent*****
-(void) startRequest:(NSMutableArray*)urlRequestQueue
{
    dispatch_async([GingersnapSession sharedManager].apiQueue, ^{
        
        // NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        [self startNotifier];
        
        NSString* urlIdentifierString = [NSString stringWithFormat:@"%@_ %@",_urlRequest.HTTPMethod, [_urlRequest.URL  absoluteString] ];
        if([urlRequestQueue containsObject:urlIdentifierString])
        {
            NSLog(@"M: %@", urlIdentifierString);
            //  _callback(nil, nil, nil);
            _callback = nil;
            return;
        }
        else
            [urlRequestQueue addObject:urlIdentifierString];
        
        [_urlRequest setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData] ;
        
        //	[NSURLConnection connectionWithRequest:_urlRequest delegate:self];
        
        NSURLSession *session = [NSURLSession sharedSession];
        
        [[session dataTaskWithRequest:_urlRequest
                    completionHandler:^(NSData *data,
                                        NSURLResponse *response,
                                        NSError *error) {
                        [self endNotifier];
                        
                        NSDictionary *res = nil;
                        NSString *html = nil;
                        [urlRequestQueue removeObject:urlIdentifierString];
                        
                        if ([data length] >0  &&
                            error == nil){
                            html = [[NSString alloc] initWithData:data
                                                         encoding:NSUTF8StringEncoding];
                            NSLog(@"HTML = %@", html);
                            
                            if ([html rangeOfString:@"login_failed"].location != NSNotFound)
                                [self logoutUser];
                            
                            res = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
                            
                        }
                        else if ([data length] == 0 &&
                                 error == nil){
                            // NSLog(@"Nothing was downloaded.");
                        }
                        else if (error != nil){
                            //  NSLog(@"Error happened = %@", error);
                        }
                        if (error.code == NSURLErrorTimedOut)         {
                            //[[HTTPDisplayErrors sharedManager] displayTimeoutError];
                            //[Flurry logEvent:@"App_Timeout_error" withParameters:res];
                        }
                        else if (error.code == NSURLErrorNotConnectedToInternet)
                        {
                            //[[HTTPDisplayErrors sharedManager] displayNoInternetError];
                            //[Flurry logEvent:@"App_NoInternet_error" withParameters:res];
                            
                        }
                        else if (error.code == NSURLErrorUnsupportedURL || error.code == NSURLErrorUnknown)
                        {
                            //[[HTTPDisplayErrors sharedManager] displayAPIError];
                            //[Flurry logEvent:@"App_UnsupportedUrl/Unknown_error" withParameters:res];
                            
                        }
                        
                        _urlRequest = nil;
                        data = nil;
                        _callback(res, error, html);
                        
                        
                        
                    }]resume];
        
    });
    
}

-(void) startNotifier
{
    //[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}
-(void) endNotifier
{
   // [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}
#pragma mark - Request Start

//*****Request Start*****\\//*****starts a get request*****
-(void) runGetRequest:(NSMutableArray*)urlRequestQueue

{
    
    [_urlRequest setHTTPMethod:@"GET"];
    [self startRequest:urlRequestQueue];
}

//*****Request Start*****\\//*****starts a put request*****
-(void) runPutRequest:(NSMutableArray*)urlRequestQueue
{
    
    [_urlRequest setHTTPMethod:@"PUT"];
    [self startRequest:urlRequestQueue];
    
}

//*****Request Start*****\\//*****starts a post request*****
-(void) runPostRequest:(NSMutableArray*)urlRequestQueue
{
    [_urlRequest setHTTPMethod:@"POST"];
    
    [self startRequest:urlRequestQueue];
    
}

//*****Request Start*****\\//*****starts a delete request*****
-(void) runDeleteRequest:(NSMutableArray*)urlRequestQueue
{
    [_urlRequest setHTTPMethod:@"DELETE"];
    
    [self startRequest:urlRequestQueue];
    
}

//*****Request Start*****\\//*****starts a patch request*****
-(void) runPatchRequest:(NSMutableArray*)urlRequestQueue
{
    [_urlRequest setHTTPMethod:@"PATCH"];
    
    [self startRequest:urlRequestQueue];
    
}
@end

