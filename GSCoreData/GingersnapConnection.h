//
//  GingersnapConnection.h
//  GSCoreData
//
//  Created by James Coughlan on 28/01/2015.
//  Copyright (c) 2015 James Coughlan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "../GSThreadSafeManagedObject.h"

@class GingersnapGrandparent;

@interface GingersnapConnection : IAThreadSafeManagedObject

@property (nonatomic, retain) NSNumber * identifier;
@property (nonatomic, retain) GingersnapGrandparent *parent;
@property (nonatomic, retain) NSManagedObject *grandparent;

@end
