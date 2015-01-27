//
//  GingersnapUser.m
//  GSCoreData
//
//  Created by James Coughlan on 27/01/2015.
//  Copyright (c) 2015 James Coughlan. All rights reserved.
//

#import "GingersnapUser.h"
#import "GSCoreDataManager.h"

@implementation GingersnapUser

@dynamic user;
@dynamic auth_token;

+(GingersnapUser*)initWithUser:(id)user{
    
    //TODO check user exists
    GingersnapUser* gsUser =   (GingersnapUser*)[NSEntityDescription insertNewObjectForEntityForName:@"GingersnapUser" inManagedObjectContext:[[GSCoreDataManager sharedManager] managedObjectContext]];
    gsUser.user = user;
    return gsUser;
}

@end
