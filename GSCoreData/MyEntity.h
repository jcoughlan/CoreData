//
//  MyEntity.h
//  GSCoreData
//
//  Created by James Coughlan on 26/01/2015.
//  Copyright (c) 2015 James Coughlan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#import <CoreData/CoreData.h>

#import "../GSThreadSafeManagedObject.h"

@interface MyEntity : GSThreadSafeManagedObject
+(MyEntity*) initWithIdentifier:(NSNumber*)identifier;
@property (nonatomic, retain) NSNumber * identifier;
@property (nonatomic, retain) NSNumber * attributeA;
@property (nonatomic, retain) NSDate * attributeB;
@property (nonatomic, retain) NSString * attributeC;

@end
