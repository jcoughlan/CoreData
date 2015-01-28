//
//  GingersnapRelationship.h
//  GSCoreData
//
//  Created by James Coughlan on 28/01/2015.
//  Copyright (c) 2015 James Coughlan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "../GSThreadSafeManagedObject.h"

@class GingersnapChild, GingersnapGrandparent;

@interface GingersnapRelationship : IAThreadSafeManagedObject

@property (nonatomic, retain) NSNumber * identifier;
@property (nonatomic, retain) GingersnapChild *child;
@property (nonatomic, retain) GingersnapGrandparent *grandparent;

@end
