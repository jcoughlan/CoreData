//
//  GingersnapGrandparent.m
//  GSCoreData
//
//  Created by James Coughlan on 28/01/2015.
//  Copyright (c) 2015 James Coughlan. All rights reserved.
//

#import "GingersnapGrandparent.h"
#import "GingersnapUser.h"
#import "GSCoreDataManager.h"
#import "GingersnapSession.h"

@implementation GingersnapGrandparent

@dynamic identifier;
@dynamic email;
@dynamic firstName;
@dynamic lastName;
@dynamic postcode;
@dynamic lastUpdatedEvents;
@dynamic dateOfBirth;
@dynamic isMale;
@dynamic gingersnapUser;
@dynamic parentConnections;
@dynamic childRelationships;
@dynamic profileAvatar;
@dynamic avatars;
@dynamic events;
@dynamic activityTemplates;

+(void) initWithIdentifier:(NSNumber*)identifier andCallback:(ObjectAddedCompletionBlock)callback
{
    if([NSThread currentThread] == [[[GSCoreDataManager sharedManager] managedObjectContext] getCoreDataThread])
    {
        GingersnapGrandparent* gsGP = (GingersnapGrandparent*)[[GSCoreDataManager sharedManager] fetchSingleObjectWithID:identifier andClass:[GingersnapGrandparent class]];
        
        if(gsGP)
        {
            callback(gsGP);
            return;
        }
        gsGP = (GingersnapGrandparent*)[NSEntityDescription insertNewObjectForEntityForName:@"GingersnapGrandparent" inManagedObjectContext:[[GSCoreDataManager sharedManager] managedObjectContext]];
        gsGP.identifier = identifier;
        
        if ([NSThread currentThread] == [NSThread mainThread])
            callback(gsGP);
        else
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(gsGP);
            });
    }
    else
        dispatch_async([GingersnapSession sharedManager].coreDataQueue, ^{
            [GingersnapGrandparent initWithIdentifier:identifier andCallback:callback];
        });
}

@end
