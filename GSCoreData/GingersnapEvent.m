//
//  GingersnapEvent.m
//  GSCoreData
//
//  Created by James Coughlan on 28/01/2015.
//  Copyright (c) 2015 James Coughlan. All rights reserved.
//

#import "GingersnapEvent.h"
#import "GingersnapChild.h"
#import "GingersnapGrandparent.h"
#import "GSCoreDataManager.h"
#import "GingersnapSession.h"

@implementation GingersnapEvent

@dynamic identifier;
@dynamic title;
@dynamic status;
@dynamic subtitle;
@dynamic time;
@dynamic primary_colour;
@dynamic secondary_colour;
@dynamic header;
@dynamic body;
@dynamic child;
@dynamic grandparent;

+(void) initWithIdentifier:(NSNumber*)identifier andCallback:(ObjectAddedCompletionBlock)callback
{
    if([NSThread currentThread] == [[[GSCoreDataManager sharedManager] managedObjectContext] getCoreDataThread])
    {
        GingersnapEvent* gsEvent = (GingersnapEvent*)[[GSCoreDataManager sharedManager] fetchSingleObjectWithID:identifier andClass:[GingersnapEvent class]];
        
        if(gsEvent)
            return;
        
        gsEvent = (GingersnapEvent*)[NSEntityDescription insertNewObjectForEntityForName:@"GingersnapEvent" inManagedObjectContext:[[GSCoreDataManager sharedManager] managedObjectContext]];
        gsEvent.identifier = identifier;
        
        if ([NSThread currentThread] == [NSThread mainThread])
            callback(gsEvent);
        else
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(gsEvent);
            });
    }
    else
        dispatch_async([GingersnapSession sharedManager].coreDataQueue, ^{
            [GingersnapEvent initWithIdentifier:identifier andCallback:callback];
        });
}

@end
