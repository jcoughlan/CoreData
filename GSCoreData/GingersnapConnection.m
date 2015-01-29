//
//  GingersnapConnection.m
//  GSCoreData
//
//  Created by James Coughlan on 28/01/2015.
//  Copyright (c) 2015 James Coughlan. All rights reserved.
//

#import "GingersnapConnection.h"
#import "GingersnapGrandparent.h"
#import "GSCoreDataManager.h"
#import "GingersnapSession.h"

@implementation GingersnapConnection

@dynamic identifier;
@dynamic parent;
@dynamic grandparent;

+(void) initWithIdentifier:(NSNumber*)identifier andCallback:(ObjectAddedCompletionBlock)callback
{
    if([NSThread currentThread] == [[[GSCoreDataManager sharedManager] managedObjectContext] getCoreDataThread])
    {
        GingersnapConnection* gsConnection = (GingersnapConnection*)[[GSCoreDataManager sharedManager] fetchSingleObjectWithID:identifier andClass:[GingersnapConnection class]];
        
        if(gsConnection)
        {
            callback(gsConnection);
            return;
        }
        gsConnection = (GingersnapConnection*)[NSEntityDescription insertNewObjectForEntityForName:@"GingersnapConnection" inManagedObjectContext:[[GSCoreDataManager sharedManager] managedObjectContext]];
        gsConnection.identifier = identifier;
        
        if ([NSThread currentThread] == [NSThread mainThread])
            callback(gsConnection);
        else
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(gsConnection);
            });
    }
    else
        dispatch_async([GingersnapSession sharedManager].coreDataQueue, ^{
            [GingersnapConnection initWithIdentifier:identifier andCallback:callback];
        });
}

@end
