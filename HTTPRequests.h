//
//  HTTPRequests.h
//  GSCoreData
//
//  Created by James Coughlan on 27/01/2015.
//  Copyright (c) 2015 James Coughlan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPRequest.h"

@interface HTTPRequests : NSObject
typedef enum {
    ELDERBERRY_PRODUCTION,
    ELDERBERRY_DEBUG
} HostType;

@property (nonatomic, retain) NSMutableArray* urlRequestQueue;

-(id) initWithType:(HostType) type;
-(void) setNewHost:(HostType)type;

-(void) getRootWithCallback:(OnResponseReceivedBlock)callback andHTTPRequestType:(HTTPRequestType)requestType;

@end
