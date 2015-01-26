//
//  PracticeEntity.h
//  GSCoreData
//
//  Created by James Coughlan on 26/01/2015.
//  Copyright (c) 2015 James Coughlan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#import "../GSThreadSafeManagedObject.h"
@interface PracticeEntity : IAThreadSafeManagedObject

@property (nonatomic, retain) NSNumber * identifier;
@property (nonatomic, retain) NSString * name;

+(void) initWithCallback:(ObjectAddedCompletionBlock)callback;

@end
