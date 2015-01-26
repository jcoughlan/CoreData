//
//  PracticeEntity.m
//  GSCoreData
//
//  Created by James Coughlan on 26/01/2015.
//  Copyright (c) 2015 James Coughlan. All rights reserved.
//

#import "PracticeEntity.h"
#import "GSCoreDataManager.h"

@implementation PracticeEntity

@dynamic identifier;
@dynamic name;


+(void) initWithCallback:(ObjectAddedCompletionBlock)callback
{
    NSLog(@"Initialising class name %@", NSStringFromClass([self class]));
    PracticeEntity* entity = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([self class]) inManagedObjectContext:[[GSCoreDataManager sharedManager] managedObjectContext]];
        callback(entity);
}
@end
