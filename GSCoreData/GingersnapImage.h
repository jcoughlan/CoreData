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

@class GingersnapAvatar;

@interface GingersnapImage : IAThreadSafeManagedObject

+(void) initWithIdentifier:(NSString*)identifier andCallback:(ObjectAddedCompletionBlock)callback;

@property (nonatomic, retain) NSString * identifier;
@property (nonatomic, retain) NSData * imageData;
@property (nonatomic, retain) NSDate * lastUsed;
@property (nonatomic, retain) GingersnapAvatar *iconAvatar;
@property (nonatomic, retain) GingersnapAvatar *thumbnailAvatar;
@property (nonatomic, retain) GingersnapAvatar *largeImageAvatar;

@end
