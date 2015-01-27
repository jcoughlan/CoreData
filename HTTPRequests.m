//
//  HTTPRequests.m
//  GSCoreData
//
//  Created by James Coughlan on 27/01/2015.
//  Copyright (c) 2015 James Coughlan. All rights reserved.
//

#import "HTTPRequests.h"
#import "HTTPConsts.h"
#import "HTTPRequest.h"
@implementation HTTPRequests

//*****constructors*****\\//*****initialises as app delegate singleton*****
-(id) initWithType:(HostType) type;
{
    self = [super init];
    [self setNewHost:type];
    
    return self;
}

-(void) setNewHost:(HostType)type
{
    if (type == ELDERBERRY_PRODUCTION)
    {
        ELDERBERRY_HOST = ELDERBERRY_PRODUCTION_HOST;
        CHILDS_API_KEY = GC_PRODUCTION_KEY;
        GRANDPARENTS_API_KEY = GP_PRODUCTION_KEY;
    }
    else if (type == ELDERBERRY_DEBUG)
    {
        ELDERBERRY_HOST = ELDERBERRY_DEBUG_HOST;
        CHILDS_API_KEY = GC_DEBUG_KEY;
        GRANDPARENTS_API_KEY = GP_DEBUG_KEY;
    }
    //if(isGPApp)
      //  API_KEY = GRANDPARENTS_API_KEY;
    //else
        API_KEY = CHILDS_API_KEY;
}

-(void) getRootWithCallback:(OnResponseReceivedBlock)callback andHTTPRequestType:(HTTPRequestType)requestType
{
    NSArray* params = [[NSArray alloc] initWithObjects: nil];
    
    NSString* url = [NSString stringWithFormat:@"%@%@%@",[NSString stringWithUTF8String:ELDERBERRY_HOST],[NSString stringWithUTF8String:ELDERBERRY_API_PREFIX],[NSString stringWithUTF8String:ELDERBERRY_API_VERSION]  ];
    HTTPRequest* request = [[HTTPRequest alloc] initWithUrl:url params:params body:nil timeout:TIMEOUT callback:callback andHTTPRequestType:requestType];
    
    NSString* authorizationString =  [NSString stringWithFormat:@"Token token=%@",[NSString stringWithUTF8String:API_KEY]];
    [request.urlRequest addValue:authorizationString forHTTPHeaderField:@"Authorization"];
    
    [request runGetRequest:self.urlRequestQueue];
}

@end
