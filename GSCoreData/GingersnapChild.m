//
//  GingersnapChild.m
//  GSCoreData
//
//  Created by James Coughlan on 28/01/2015.
//  Copyright (c) 2015 James Coughlan. All rights reserved.
//

#import "GingersnapChild.h"
#import "GingersnapActivity.h"
#import "GSCoreDataManager.h"
#import "GingersnapSession.h"

@implementation GingersnapChild

@dynamic identifier;
@dynamic firstName;
@dynamic nickname;
@dynamic postcode;
@dynamic isMale;
@dynamic dateOfBirth;
@dynamic lastUpdatedEvents;
@dynamic grandparentRelationships;
@dynamic profileAvatar;
@dynamic shares;
@dynamic events;
@dynamic activityTemplates;
@dynamic activities;
@dynamic parent;

+(void) initWithIdentifier:(NSNumber*)identifier andCallback:(ObjectAddedCompletionBlock)callback
{
    if([NSThread currentThread] == [[[GSCoreDataManager sharedManager] managedObjectContext] getCoreDataThread])
    {
        GingersnapChild* gsChild = (GingersnapChild*)[[GSCoreDataManager sharedManager] fetchSingleObjectWithID:identifier andClass:[GingersnapChild class]];
        
        if(gsChild)
            return;
        
        gsChild = (GingersnapChild*)[NSEntityDescription insertNewObjectForEntityForName:@"GingersnapChild" inManagedObjectContext:[[GSCoreDataManager sharedManager] managedObjectContext]];
        gsChild.identifier = identifier;
        
        if ([NSThread currentThread] == [NSThread mainThread])
            callback(gsChild);
        else
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(gsChild);
            });
    }
    else
        dispatch_async([GingersnapSession sharedManager].coreDataQueue, ^{
            [GingersnapChild initWithIdentifier:identifier andCallback:callback];
        });
}

@end
