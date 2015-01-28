//
//  GingersnapActivityTemplate.m
//  GSCoreData
//
//  Created by James Coughlan on 28/01/2015.
//  Copyright (c) 2015 James Coughlan. All rights reserved.
//

#import "GingersnapActivityTemplate.h"
#import "GingersnapActivity.h"
#import "GingersnapChild.h"
#import "GingersnapGrandparent.h"
#import "GSCoreDataManager.h"
#import "GingersnapSession.h"

@implementation GingersnapActivityTemplate

@dynamic identifier;
@dynamic status;
@dynamic title;
@dynamic header;
@dynamic subtitle;
@dynamic type;
@dynamic primary_colour;
@dynamic secondary_colour;
@dynamic descriptionString;
@dynamic summary;
@dynamic child;
@dynamic grandparent;
@dynamic activities;


+(void) initWithIdentifier:(NSNumber*)identifier andCallback:(ObjectAddedCompletionBlock)callback
{
    if([NSThread currentThread] == [[[GSCoreDataManager sharedManager] managedObjectContext] getCoreDataThread])
    {
        GingersnapActivityTemplate* gsActTem = (GingersnapActivityTemplate*)[[GSCoreDataManager sharedManager] fetchSingleObjectWithID:identifier andClass:[GingersnapActivityTemplate class]];
        
        if(gsActTem)
            return;
        
        gsActTem = (GingersnapActivityTemplate*)[NSEntityDescription insertNewObjectForEntityForName:@"GingersnapActivityTemplate" inManagedObjectContext:[[GSCoreDataManager sharedManager] managedObjectContext]];
        gsActTem.identifier = identifier;
        
        if ([NSThread currentThread] == [NSThread mainThread])
            callback(gsActTem);
        else
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(gsActTem);
            });
    }
    else
        dispatch_async([GingersnapSession sharedManager].coreDataQueue, ^{
            [GingersnapActivityTemplate initWithIdentifier:identifier andCallback:callback];
        });
}

@end
