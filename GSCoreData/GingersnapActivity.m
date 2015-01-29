//
//  GingersnapActivity.m
//  GSCoreData
//
//  Created by James Coughlan on 28/01/2015.
//  Copyright (c) 2015 James Coughlan. All rights reserved.
//

#import "GingersnapActivity.h"
#import "GSCoreDataManager.h"
#import "GingersnapSession.h"

@implementation GingersnapActivity

@dynamic identifier;
@dynamic title;
@dynamic header;
@dynamic descriptionString;
@dynamic subtitle;
@dynamic time;
@dynamic has_output;
@dynamic status;
@dynamic primary_colour;
@dynamic secondary_colour;
@dynamic message;
@dynamic unityJson;
@dynamic type;
@dynamic summary;
@dynamic child;
@dynamic activityTemplate;

+(void) initWithIdentifier:(NSNumber*)identifier andCallback:(ObjectAddedCompletionBlock)callback
{
    if([NSThread currentThread] == [[[GSCoreDataManager sharedManager] managedObjectContext] getCoreDataThread])
    {
        GingersnapActivity* gsActivity = (GingersnapActivity*)[[GSCoreDataManager sharedManager] fetchSingleObjectWithID:identifier andClass:[GingersnapActivity class]];
        
        if(gsActivity)
        {
            callback(gsActivity);
            return;
        }
        
        gsActivity = (GingersnapActivity*)[NSEntityDescription insertNewObjectForEntityForName:@"GingersnapActivity" inManagedObjectContext:[[GSCoreDataManager sharedManager] managedObjectContext]];
      
        gsActivity.identifier = identifier;
        
        if ([NSThread currentThread] == [NSThread mainThread])
            callback(gsActivity);
        else
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(gsActivity);
            });
    }
    else
        dispatch_async([GingersnapSession sharedManager].coreDataQueue, ^{
            [GingersnapActivity initWithIdentifier:identifier andCallback:callback];
        });
}
@end
