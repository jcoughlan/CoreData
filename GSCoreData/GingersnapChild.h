//
//  GingersnapChild.h
//  GSCoreData
//
//  Created by James Coughlan on 28/01/2015.
//  Copyright (c) 2015 James Coughlan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "../GSThreadSafeManagedObject.h"

@class GingersnapActivity;

@interface GingersnapChild : IAThreadSafeManagedObject

@property (nonatomic, retain) NSNumber * identifier;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * nickname;
@property (nonatomic, retain) NSString * postcode;
@property (nonatomic, retain) NSNumber * isMale;
@property (nonatomic, retain) NSDate * dateOfBirth;
@property (nonatomic, retain) NSDate * lastUpdatedEvents;
@property (nonatomic, retain) NSSet *grandparentRelationships;
@property (nonatomic, retain) NSManagedObject *profileAvatar;
@property (nonatomic, retain) NSSet *shares;
@property (nonatomic, retain) NSSet *events;
@property (nonatomic, retain) NSSet *activityTemplates;
@property (nonatomic, retain) NSSet *activities;
@property (nonatomic, retain) NSManagedObject *parent;
@end

@interface GingersnapChild (CoreDataGeneratedAccessors)

- (void)addGrandparentRelationshipsObject:(NSManagedObject *)value;
- (void)removeGrandparentRelationshipsObject:(NSManagedObject *)value;
- (void)addGrandparentRelationships:(NSSet *)values;
- (void)removeGrandparentRelationships:(NSSet *)values;

- (void)addSharesObject:(NSManagedObject *)value;
- (void)removeSharesObject:(NSManagedObject *)value;
- (void)addShares:(NSSet *)values;
- (void)removeShares:(NSSet *)values;

- (void)addEventsObject:(NSManagedObject *)value;
- (void)removeEventsObject:(NSManagedObject *)value;
- (void)addEvents:(NSSet *)values;
- (void)removeEvents:(NSSet *)values;

- (void)addActivityTemplatesObject:(NSManagedObject *)value;
- (void)removeActivityTemplatesObject:(NSManagedObject *)value;
- (void)addActivityTemplates:(NSSet *)values;
- (void)removeActivityTemplates:(NSSet *)values;

- (void)addActivitiesObject:(GingersnapActivity *)value;
- (void)removeActivitiesObject:(GingersnapActivity *)value;
- (void)addActivities:(NSSet *)values;
- (void)removeActivities:(NSSet *)values;

@end
