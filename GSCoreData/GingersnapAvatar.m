//
//  GingersnapAvatar.m
//  GSCoreData
//
//  Created by James Coughlan on 28/01/2015.
//  Copyright (c) 2015 James Coughlan. All rights reserved.
//

#import "GingersnapAvatar.h"
#import "GingersnapChild.h"
#import "GingersnapGrandparent.h"
#import "GingersnapImage.h"
#import "GSCoreDataManager.h"
#import "GingersnapSession.h"

@implementation GingersnapAvatar

@dynamic identifier;
@dynamic child;
@dynamic icon;
@dynamic thumbnail;
@dynamic largeImage;
@dynamic grandparentAvatar;
@dynamic grandparentAvatarList;


+(void) initWithIdentifier:(NSNumber*)identifier andCallback:(ObjectAddedCompletionBlock)callback
{
    if([NSThread currentThread] == [[[GSCoreDataManager sharedManager] managedObjectContext] getCoreDataThread])
    {
        GingersnapAvatar* gsAvatar = (GingersnapAvatar*)[[GSCoreDataManager sharedManager] fetchSingleObjectWithID:identifier andClass:[GingersnapAvatar class]];
        
        if(gsAvatar)
            return;
        
        gsAvatar = (GingersnapAvatar*)[NSEntityDescription insertNewObjectForEntityForName:@"GingersnapAvatar" inManagedObjectContext:[[GSCoreDataManager sharedManager] managedObjectContext]];
        gsAvatar.identifier = identifier;
        
        if ([NSThread currentThread] == [NSThread mainThread])
            callback(gsAvatar);
        else
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(gsAvatar);
            });
    }
    else
        dispatch_async([GingersnapSession sharedManager].coreDataQueue, ^{
            [GingersnapAvatar initWithIdentifier:identifier andCallback:callback];
        });
}

@end
