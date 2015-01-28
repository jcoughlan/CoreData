//
//  GingersnapUser.m
//  GSCoreData
//
//  Created by James Coughlan on 28/01/2015.
//  Copyright (c) 2015 James Coughlan. All rights reserved.
//

#import "GingersnapUser.h"
#import "GingersnapGrandparent.h"
#import "GSCoreDataManager.h"
#import "GingersnapSession.h"

@implementation GingersnapUser

@dynamic auth_token;
@dynamic user;
@dynamic has_avatar;
@dynamic has_grandchildren;
@dynamic has_sent_adventure;
@dynamic grandparent;
@dynamic parent;

+(void) initWithUser:(id)user andCallback:(ObjectAddedCompletionBlock)callback{

    if([NSThread currentThread] == [[[GSCoreDataManager sharedManager] managedObjectContext] getCoreDataThread])
    {
        //TODO check user exists
        GingersnapUser* gsUser =   (GingersnapUser*)[NSEntityDescription insertNewObjectForEntityForName:@"GingersnapUser" inManagedObjectContext:[[GSCoreDataManager sharedManager] managedObjectContext]];
        gsUser.user = user;
        gsUser.auth_token = @"original";
        if ([NSThread currentThread] == [NSThread mainThread])
            callback(gsUser);
        else
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(gsUser);
            });
    }
    else
        dispatch_async([GingersnapSession sharedManager].coreDataQueue, ^{
            [GingersnapUser initWithUser:user andCallback:callback];
        });
}

@end
