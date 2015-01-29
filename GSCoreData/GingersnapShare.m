//
//  GingersnapShare.m
//  GSCoreData
//
//  Created by James Coughlan on 28/01/2015.
//  Copyright (c) 2015 James Coughlan. All rights reserved.
//

#import "GingersnapShare.h"
#import "GingersnapChild.h"
#import "GSCoreDataManager.h"
#import "GingersnapSession.h"

@implementation GingersnapShare

@dynamic identifier;
@dynamic title;
@dynamic subtitle;
@dynamic message;
@dynamic response;
@dynamic status;
@dynamic child;

+(void) initWithIdentifier:(NSNumber*)identifier andCallback:(ObjectAddedCompletionBlock)callback
{
    if([NSThread currentThread] == [[[GSCoreDataManager sharedManager] managedObjectContext] getCoreDataThread])
    {
        GingersnapShare* gsShare = (GingersnapShare*)[[GSCoreDataManager sharedManager] fetchSingleObjectWithID:identifier andClass:[GingersnapShare class]];
        
        if(gsShare)
        {
            callback(gsShare);
            return;
        }
        
        gsShare = (GingersnapShare*)[NSEntityDescription insertNewObjectForEntityForName:@"GingersnapShare" inManagedObjectContext:[[GSCoreDataManager sharedManager] managedObjectContext]];
        gsShare.identifier = identifier;
        
        if ([NSThread currentThread] == [NSThread mainThread])
            callback(gsShare);
        else
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(gsShare);
            });
    }
    else
        dispatch_async([GingersnapSession sharedManager].coreDataQueue, ^{
            [GingersnapShare initWithIdentifier:identifier andCallback:callback];
        });
}


@end
