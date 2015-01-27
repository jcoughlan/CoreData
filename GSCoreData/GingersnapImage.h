//
//  GingersnapImage.h
//  GSCoreData
//
//  Created by James Coughlan on 27/01/2015.
//  Copyright (c) 2015 James Coughlan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "../GSThreadSafeManagedObject.h"


@interface GingersnapImage : GSThreadSafeManagedObject

@property (nonatomic, retain) NSDate * lastUsed;
@property (nonatomic, retain) NSData * imageData;
@property (nonatomic, retain) NSString * identifier;

+(GingersnapImage*)initWithUser:(id)user;

@end
