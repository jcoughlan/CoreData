//
//  GingersnapEvent.h
//  GSCoreData
//
//  Created by James Coughlan on 28/01/2015.
//  Copyright (c) 2015 James Coughlan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "../GSThreadSafeManagedObject.h"

@class GingersnapChild, GingersnapGrandparent;

@interface GingersnapEvent : IAThreadSafeManagedObject

+(void) initWithIdentifier:(NSNumber*)identifier andCallback:(ObjectAddedCompletionBlock)callback;

@property (nonatomic, retain) NSNumber * identifier;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * status;
@property (nonatomic, retain) NSString * subtitle;
@property (nonatomic, retain) NSDate * time;
@property (nonatomic, retain) NSString * primary_colour;
@property (nonatomic, retain) NSString * secondary_colour;
@property (nonatomic, retain) NSString * header;
@property (nonatomic, retain) NSString * body;
@property (nonatomic, retain) GingersnapChild *child;
@property (nonatomic, retain) GingersnapGrandparent *grandparent;

@end
