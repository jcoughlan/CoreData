//
//  GingersnapRelationship.m
//  GSCoreData
//
//  Created by James Coughlan on 28/01/2015.
//  Copyright (c) 2015 James Coughlan. All rights reserved.
//

#import "GingersnapRelationship.h"
#import "GingersnapChild.h"
#import "GingersnapGrandparent.h"
#import "GSCoreDataManager.h"
#import "GingersnapSession.h"

@implementation GingersnapRelationship

@dynamic identifier;
@dynamic child;
@dynamic grandparent;

+(void) initWithIdentifier:(NSNumber*)identifier andCallback:(ObjectAddedCompletionBlock)callback
{
    if([NSThread currentThread] == [[[GSCoreDataManager sharedManager] managedObjectContext] getCoreDataThread])
    {
        GingersnapRelationship* gsRelationship = (GingersnapRelationship*)[[GSCoreDataManager sharedManager] fetchSingleObjectWithID:identifier andClass:[GingersnapRelationship class]];
        
        if(gsRelationship)
        {
            callback(gsRelationship);
            return;
        }
        
        gsRelationship = (GingersnapRelationship*)[NSEntityDescription insertNewObjectForEntityForName:@"GingersnapRelationship" inManagedObjectContext:[[GSCoreDataManager sharedManager] managedObjectContext]];
        gsRelationship.identifier = identifier;
        
        if ([NSThread currentThread] == [NSThread mainThread])
            callback(gsRelationship);
        else
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(gsRelationship);
            });
    }
    else
        dispatch_async([GingersnapSession sharedManager].coreDataQueue, ^{
            [GingersnapRelationship initWithIdentifier:identifier andCallback:callback];
        });
}

@end
