//
//  GingersnapImage.h
//  GSCoreData
//
//  Created by James Coughlan on 28/01/2015.
//  Copyright (c) 2015 James Coughlan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "../GSThreadSafeManagedObject.h"


@interface GingersnapImage : IAThreadSafeManagedObject

@property (nonatomic, retain) NSString * identifier;
@property (nonatomic, retain) NSData * imageData;
@property (nonatomic, retain) NSDate * lastUsed;
@property (nonatomic, retain) NSManagedObject *iconAvatar;
@property (nonatomic, retain) NSManagedObject *thumbnailAvatar;
@property (nonatomic, retain) NSManagedObject *largeImageAvatar;

@end
