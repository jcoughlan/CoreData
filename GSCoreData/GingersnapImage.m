//
//  GingersnapImage.m
//  GSCoreData
//
//  Created by James Coughlan on 27/01/2015.
//  Copyright (c) 2015 James Coughlan. All rights reserved.
//

#import "GingersnapImage.h"
#import "GSCoreDataManager.h"

@implementation GingersnapImage

@dynamic lastUsed;
@dynamic imageData;
@dynamic identifier;

+(GingersnapImage*)initWithUser:(id)user{
    
    //TODO check image exists
    GingersnapImage* gsImage =   (GingersnapImage*)[NSEntityDescription insertNewObjectForEntityForName:@"GingersnapImage" inManagedObjectContext:[[GSCoreDataManager sharedManager] managedObjectContext]];
    return gsImage;
}
@end
