//
//  GingersnapParent.h
//  GSCoreData
//
//  Created by James Coughlan on 28/01/2015.
//  Copyright (c) 2015 James Coughlan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "../GSThreadSafeManagedObject.h"

@class GingersnapChild, GingersnapConnection, GingersnapUser;

@interface GingersnapParent : IAThreadSafeManagedObject

+(void) initWithIdentifier:(NSNumber*)identifier andCallback:(ObjectAddedCompletionBlock)callback;

@property (nonatomic, retain) NSNumber * identifier;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSDate * postcode;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * secondName;
@property (nonatomic, retain) GingersnapUser *gingersnapUser;
@property (nonatomic, retain) NSSet *grandparentConnections;
@property (nonatomic, retain) NSSet *children;
@end

@interface GingersnapParent (CoreDataGeneratedAccessors)

- (void)addGrandparentConnectionsObject:(GingersnapConnection *)value;
- (void)removeGrandparentConnectionsObject:(GingersnapConnection *)value;
- (void)addGrandparentConnections:(NSSet *)values;
- (void)removeGrandparentConnections:(NSSet *)values;

- (void)addChildrenObject:(GingersnapChild *)value;
- (void)removeChildrenObject:(GingersnapChild *)value;
- (void)addChildren:(NSSet *)values;
- (void)removeChildren:(NSSet *)values;

@end
