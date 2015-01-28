//
//  GingersnapShare.h
//  GSCoreData
//
//  Created by James Coughlan on 28/01/2015.
//  Copyright (c) 2015 James Coughlan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "../GSThreadSafeManagedObject.h"

@class GingersnapChild;

@interface GingersnapShare : IAThreadSafeManagedObject

@property (nonatomic, retain) NSNumber * identifier;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * subtitle;
@property (nonatomic, retain) NSString * message;
@property (nonatomic, retain) NSString * response;
@property (nonatomic, retain) NSString * status;
@property (nonatomic, retain) GingersnapChild *child;

@end
