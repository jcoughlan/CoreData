//
//  MyEntity.m
//  GSCoreData
//
//  Created by James Coughlan on 26/01/2015.
//  Copyright (c) 2015 James Coughlan. All rights reserved.
//

#import "MyEntity.h"
#import "GSCoreDataManager.h"

@implementation MyEntity

@dynamic attributeA;
@dynamic attributeB;
@dynamic attributeC;
@dynamic identifier;
+(MyEntity*) initWithIdentifier:(NSNumber*)identifier
{
    MyEntity* entity = (MyEntity*)[[GSCoreDataManager sharedManager] fetchSingleObjectWithID:identifier andClass:[self class]];
    if(entity)
        return entity;
    entity = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([self class]) inManagedObjectContext:[[GSCoreDataManager sharedManager] managedObjectContext]];
    entity.identifier = identifier;
    return entity;
}
@end
