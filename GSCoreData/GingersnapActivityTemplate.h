//
//  GingersnapActivityTemplate.h
//  GSCoreData
//
//  Created by James Coughlan on 28/01/2015.
//  Copyright (c) 2015 James Coughlan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "../GSThreadSafeManagedObject.h"

@class GingersnapActivity, GingersnapChild, GingersnapGrandparent;

@interface GingersnapActivityTemplate : IAThreadSafeManagedObject

+(void) initWithIdentifier:(NSNumber*)identifier andCallback:(ObjectAddedCompletionBlock)callback;

@property (nonatomic, retain) NSNumber * identifier;
@property (nonatomic, retain) NSString * status;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * header;
@property (nonatomic, retain) NSString * subtitle;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSString * primary_colour;
@property (nonatomic, retain) NSString * secondary_colour;
@property (nonatomic, retain) NSString * descriptionString;
@property (nonatomic, retain) NSString * summary;
@property (nonatomic, retain) GingersnapChild *child;
@property (nonatomic, retain) GingersnapGrandparent *grandparent;
@property (nonatomic, retain) NSSet *activities;
@end

@interface GingersnapActivityTemplate (CoreDataGeneratedAccessors)

- (void)addActivitiesObject:(GingersnapActivity *)value;
- (void)removeActivitiesObject:(GingersnapActivity *)value;
- (void)addActivities:(NSSet *)values;
- (void)removeActivities:(NSSet *)values;

@end
