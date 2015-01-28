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

@class GingersnapActivity, GingersnapAvatar, GingersnapParent, GingersnapEvent, GingersnapActivityTemplate, GingersnapShare, GingersnapGrandparent;

@interface GingersnapChild : IAThreadSafeManagedObject

+(void) initWithIdentifier:(NSNumber*)identifier andCallback:(ObjectAddedCompletionBlock)callback;

@property (nonatomic, retain) NSNumber * identifier;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * nickname;
@property (nonatomic, retain) NSString * postcode;
@property (nonatomic, retain) NSNumber * isMale;
@property (nonatomic, retain) NSDate * dateOfBirth;
@property (nonatomic, retain) NSDate * lastUpdatedEvents;
@property (nonatomic, retain) NSSet *grandparentRelationships;
@property (nonatomic, retain) GingersnapAvatar *profileAvatar;
@property (nonatomic, retain) NSSet *shares;
@property (nonatomic, retain) NSSet *events;
@property (nonatomic, retain) NSSet *activityTemplates;
@property (nonatomic, retain) NSSet *activities;
@property (nonatomic, retain) GingersnapParent *parent;
@end

@interface GingersnapChild (CoreDataGeneratedAccessors)

- (void)addGrandparentRelationshipsObject:(GingersnapGrandparent *)value;
- (void)removeGrandparentRelationshipsObject:(GingersnapGrandparent *)value;
- (void)addGrandparentRelationships:(NSSet *)values;
- (void)removeGrandparentRelationships:(NSSet *)values;

- (void)addSharesObject:(GingersnapShare *)value;
- (void)removeSharesObject:(GingersnapShare *)value;
- (void)addShares:(NSSet *)values;
- (void)removeShares:(NSSet *)values;

- (void)addEventsObject:(GingersnapEvent *)value;
- (void)removeEventsObject:(GingersnapEvent *)value;
- (void)addEvents:(NSSet *)values;
- (void)removeEvents:(NSSet *)values;

- (void)addActivityTemplatesObject:(GingersnapActivityTemplate *)value;
- (void)removeActivityTemplatesObject:(GingersnapActivityTemplate *)value;
- (void)addActivityTemplates:(NSSet *)values;
- (void)removeActivityTemplates:(NSSet *)values;

- (void)addActivitiesObject:(GingersnapActivity *)value;
- (void)removeActivitiesObject:(GingersnapActivity *)value;
- (void)addActivities:(NSSet *)values;
- (void)removeActivities:(NSSet *)values;

@end
