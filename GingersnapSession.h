//
//  GingersnapSession.h
//  GSCoreData
//
//  Created by James Coughlan on 26/01/2015.
//  Copyright (c) 2015 James Coughlan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCRequests.h"
#import "GPRequests.h"
#import "GingersnapRootData.h"
#import "GingersnapUser.h"
@interface GingersnapSession : NSObject

+ (GingersnapSession*)sharedManager;

-(void) testAppVersion:(NSDictionary*)rootData;

@property (readwrite, strong, nonatomic) dispatch_queue_t coreDataQueue;
@property (readwrite, strong, nonatomic) dispatch_queue_t apiQueue;
@property (readwrite, strong, nonatomic) GingersnapRootData* rootData;
@property (readwrite, strong, nonatomic) GingersnapUser* user;

@end
