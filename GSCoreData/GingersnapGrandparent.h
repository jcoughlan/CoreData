//
//  GingersnapGrandparent.h
//  GSCoreData
//
//  Created by James Coughlan on 28/01/2015.
//  Copyright (c) 2015 James Coughlan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "../GSThreadSafeManagedObject.h"

@class GingersnapUser;

@interface GingersnapGrandparent : IAThreadSafeManagedObject

@property (nonatomic, retain) NSNumber * identifier;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSString * postcode;
@property (nonatomic, retain) NSDate * lastUpdatedEvents;
@property (nonatomic, retain) NSDate * dateOfBirth;
@property (nonatomic, retain) NSNumber * isMale;
@property (nonatomic, retain) GingersnapUser *gingersnapUser;
@property (nonatomic, retain) NSSet *parentConnections;
@property (nonatomic, retain) NSSet *childRelationships;
@property (nonatomic, retain) NSManagedObject *profileAvatar;
@property (nonatomic, retain) NSSet *avatars;
@property (nonatomic, retain) NSSet *events;
@property (nonatomic, retain) NSSet *activityTemplates;
@end

@interface GingersnapGrandparent (CoreDataGeneratedAccessors)

- (void)addParentConnectionsObject:(NSManagedObject *)value;
- (void)removeParentConnectionsObject:(NSManagedObject *)value;
- (void)addParentConnections:(NSSet *)values;
- (void)removeParentConnections:(NSSet *)values;

- (void)addChildRelationshipsObject:(NSManagedObject *)value;
- (void)removeChildRelationshipsObject:(NSManagedObject *)value;
- (void)addChildRelationships:(NSSet *)values;
- (void)removeChildRelationships:(NSSet *)values;

- (void)addAvatarsObject:(NSManagedObject *)value;
- (void)removeAvatarsObject:(NSManagedObject *)value;
- (void)addAvatars:(NSSet *)values;
- (void)removeAvatars:(NSSet *)values;

- (void)addEventsObject:(NSManagedObject *)value;
- (void)removeEventsObject:(NSManagedObject *)value;
- (void)addEvents:(NSSet *)values;
- (void)removeEvents:(NSSet *)values;

- (void)addActivityTemplatesObject:(NSManagedObject *)value;
- (void)removeActivityTemplatesObject:(NSManagedObject *)value;
- (void)addActivityTemplates:(NSSet *)values;
- (void)removeActivityTemplates:(NSSet *)values;

@end
