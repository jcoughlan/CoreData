//
//  GingersnapParent.m
//  GSCoreData
//
//  Created by James Coughlan on 28/01/2015.
//  Copyright (c) 2015 James Coughlan. All rights reserved.
//

#import "GingersnapParent.h"
#import "GingersnapChild.h"
#import "GingersnapConnection.h"
#import "GingersnapUser.h"
#import "GSCoreDataManager.h"
#import "GingersnapSession.h"

@implementation GingersnapParent

@dynamic identifier;
@dynamic email;
@dynamic postcode;
@dynamic firstName;
@dynamic secondName;
@dynamic gingersnapUser;
@dynamic grandparentConnections;
@dynamic children;


+(void) initWithIdentifier:(NSNumber*)identifier andCallback:(ObjectAddedCompletionBlock)callback
{
    if([NSThread currentThread] == [[[GSCoreDataManager sharedManager] managedObjectContext] getCoreDataThread])
    {
        GingersnapParent* gsParent = (GingersnapParent*)[[GSCoreDataManager sharedManager] fetchSingleObjectWithID:identifier andClass:[GingersnapParent class]];
        
        if(gsParent)
        {
            callback(gsParent);
            return;
        }
        gsParent = (GingersnapParent*)[NSEntityDescription insertNewObjectForEntityForName:@"GingersnapParent" inManagedObjectContext:[[GSCoreDataManager sharedManager] managedObjectContext]];
        gsParent.identifier = identifier;
        
        if ([NSThread currentThread] == [NSThread mainThread])
            callback(gsParent);
        else
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(gsParent);
            });
    }
    else
        dispatch_async([GingersnapSession sharedManager].coreDataQueue, ^{
            [GingersnapParent initWithIdentifier:identifier andCallback:callback];
        });
}

@end
