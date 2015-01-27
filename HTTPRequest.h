//
//  HTTPPutRequest.h
//  CoreData
//
//  Created by James Coughlan on 27/08/2014.
//  Copyright (c) 2014 James Coughlan. All rights reserved.
//
//███████╗ ██████╗ ██████╗ ██╗      ██████╗  ██████╗ ██████╗ ███████╗
//██╔════╝██╔═══██╗██╔══██╗██║     ██╔═══██╗██╔═══██╗██╔══██╗██╔════╝
//█████╗  ██║   ██║██████╔╝██║     ██║   ██║██║   ██║██████╔╝███████╗
//██╔══╝  ██║   ██║██╔══██╗██║     ██║   ██║██║   ██║██╔═══╝ ╚════██║
//██║     ╚██████╔╝██║  ██║███████╗╚██████╔╝╚██████╔╝██║     ███████║
//╚═╝      ╚═════╝ ╚═╝  ╚═╝╚══════╝ ╚═════╝  ╚═════╝ ╚═╝     ╚══════╝

#import <Foundation/Foundation.h>
typedef enum
{
    USER_INPUT,
    AUTOMATED
}HTTPRequestType;

@interface HTTPRequest : NSObject <NSURLConnectionDelegate>
{
    NSMutableData *_responseData;
    NSMutableArray *_requestQueue;
    NSString* _urlIdentifier;
    HTTPRequestType _requestType;
}
//*****Callbacks*****\\//
typedef void (^OnResponseReceivedBlock)(NSDictionary* jsonData, NSError* error, NSString* rawData);

//*****Properties*****\\//
@property (nonatomic, strong) NSMutableURLRequest *urlRequest;
@property (nonatomic, strong) OnResponseReceivedBlock callback;
//*****Constructors*****\\//
-(id) initWithUrl: (NSString*) url params: (NSArray*) params body:(NSString*)body timeout:(double) timeout callback:(OnResponseReceivedBlock) response andHTTPRequestType:(HTTPRequestType) httpRequestType;

-(id) initWithUrl: (NSString*) url onCompletion:(OnResponseReceivedBlock)onResponseReceived andHTTPRequestType:(HTTPRequestType) httpRequestType;

//*****Request Start*****\\//
-(void) runPutRequest:(NSMutableArray*)urlRequestQueue;
-(void) runGetRequest:(NSMutableArray*)urlRequestQueue;
-(void) runPostRequest:(NSMutableArray*)urlRequestQueue;
-(void) runDeleteRequest:(NSMutableArray*)urlRequestQueue;
-(void) runPatchRequest:(NSMutableArray*)urlRequestQueue;

@end
