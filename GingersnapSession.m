//
//  GingersnapSession.m
//  GSCoreData
//
//  Created by James Coughlan on 26/01/2015.
//  Copyright (c) 2015 James Coughlan. All rights reserved.
//

#import "GingersnapSession.h"
#import "GSCoreDataManager.h"

@implementation GingersnapSession
+ (GingersnapSession*)sharedManager {
    static GingersnapSession *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        assert([NSThread isMainThread]);
        sharedMyManager = [[self alloc] init];
        sharedMyManager.coreDataQueue = dispatch_queue_create("com.gingersnap.cdQ", NULL);
        sharedMyManager.apiQueue = dispatch_queue_create("com.gingersnap.apiQ", NULL);
        __block BOOL loaded = false;
       // dispatch_async(sharedMyManager.coreDataQueue, ^{
        [GSCoreDataManager sharedManager];
            loaded = true;
        //});
//        while (!loaded)
//        {
//            
//        }
    });
    return sharedMyManager;
}
@end
