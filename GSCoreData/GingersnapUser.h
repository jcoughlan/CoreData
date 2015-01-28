//
//  GingersnapUser.h
//  GSCoreData
//
//  Created by James Coughlan on 28/01/2015.
//  Copyright (c) 2015 James Coughlan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "../GSThreadSafeManagedObject.h"

@class GingersnapGrandparent, GingersnapParent;

@interface GingersnapUser : IAThreadSafeManagedObject

+(void) initWithUser:(id)user andCallback:(ObjectAddedCompletionBlock)callback;

@property (nonatomic, retain) NSString * auth_token;
@property (nonatomic, retain) id user;
@property (nonatomic, retain) NSNumber * has_avatar;
@property (nonatomic, retain) NSNumber * has_grandchildren;
@property (nonatomic, retain) NSNumber * has_sent_adventure;
@property (nonatomic, retain) GingersnapGrandparent *grandparent;
@property (nonatomic, retain) GingersnapParent *parent;

@end
