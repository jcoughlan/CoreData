//
//  GingersnapAvatar.h
//  GSCoreData
//
//  Created by James Coughlan on 28/01/2015.
//  Copyright (c) 2015 James Coughlan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "../GSThreadSafeManagedObject.h"

@class GingersnapChild, GingersnapGrandparent, GingersnapImage;

@interface GingersnapAvatar : IAThreadSafeManagedObject

+(void) initWithIdentifier:(NSNumber*)identifier andCallback:(ObjectAddedCompletionBlock)callback;

@property (nonatomic, retain) NSNumber * identifier;
@property (nonatomic, retain) GingersnapChild *child;
@property (nonatomic, retain) GingersnapImage *icon;
@property (nonatomic, retain) GingersnapImage *thumbnail;
@property (nonatomic, retain) GingersnapImage *largeImage;
@property (nonatomic, retain) GingersnapGrandparent *grandparentAvatar;
@property (nonatomic, retain) GingersnapGrandparent *grandparentAvatarList;

@end
