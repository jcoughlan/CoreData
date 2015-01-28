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

@class GingersnapUser, GingersnapAvatar, GingersnapRelationship, GingersnapActivityTemplate, GingersnapParent, GingersnapEvent;

@interface GingersnapGrandparent : IAThreadSafeManagedObject

+(void) initWithIdentifier:(NSNumber*)identifier andCallback:(ObjectAddedCompletionBlock)callback;

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
@property (nonatomic, retain) GingersnapAvatar *profileAvatar;
@property (nonatomic, retain) NSSet *avatars;
@property (nonatomic, retain) NSSet *events;
@property (nonatomic, retain) NSSet *activityTemplates;
@end

@interface GingersnapGrandparent (CoreDataGeneratedAccessors)

- (void)addParentConnectionsObject:(GingersnapParent *)value;
- (void)removeParentConnectionsObject:(GingersnapParent *)value;
- (void)addParentConnections:(NSSet *)values;
- (void)removeParentConnections:(NSSet *)values;

- (void)addChildRelationshipsObject:(GingersnapRelationship *)value;
- (void)removeChildRelationshipsObject:(GingersnapRelationship *)value;
- (void)addChildRelationships:(NSSet *)values;
- (void)removeChildRelationships:(NSSet *)values;

- (void)addAvatarsObject:(GingersnapAvatar *)value;
- (void)removeAvatarsObject:(GingersnapAvatar *)value;
- (void)addAvatars:(NSSet *)values;
- (void)removeAvatars:(NSSet *)values;

- (void)addEventsObject:(GingersnapEvent *)value;
- (void)removeEventsObject:(GingersnapEvent *)value;
- (void)addEvents:(NSSet *)values;
- (void)removeEvents:(NSSet *)values;

- (void)addActivityTemplatesObject:(GingersnapActivityTemplate *)value;
- (void)removeActivityTemplatesObject:(GingersnapActivityTemplate *)value;
- (void)addActivityTemplates:(NSSet *)values;
- (void)removeActivityTemplates:(NSSet *)values;

@end
