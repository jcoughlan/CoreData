//
//  GingersnapActivity.h
//  GSCoreData
//
//  Created by James Coughlan on 28/01/2015.
//  Copyright (c) 2015 James Coughlan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "../GSThreadSafeManagedObject.h"


@interface GingersnapActivity : IAThreadSafeManagedObject

@property (nonatomic, retain) NSNumber * identifier;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * header;
@property (nonatomic, retain) NSString * descriptionString;
@property (nonatomic, retain) NSString * subtitle;
@property (nonatomic, retain) NSDate * time;
@property (nonatomic, retain) NSString * has_output;
@property (nonatomic, retain) NSString * status;
@property (nonatomic, retain) NSString * primary_colour;
@property (nonatomic, retain) NSString * secondary_colour;
@property (nonatomic, retain) NSString * message;
@property (nonatomic, retain) NSString * unityJson;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSString * summary;
@property (nonatomic, retain) NSManagedObject *child;
@property (nonatomic, retain) NSManagedObject *activityTemplate;

@end
