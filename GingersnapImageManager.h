//
//  GingersnapImageManager.h
//  GSCoreData
//
//  Created by James Coughlan on 27/01/2015.
//  Copyright (c) 2015 James Coughlan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GingersnapImage.h"

static const int IMAGE_CACHE_LIMIT = 350;

@interface GingersnapImageManager : NSObject

@property(nonatomic, retain) NSMutableArray* imageArray;

+ (GingersnapImageManager*)sharedManager;

-(void) addImage:(GingersnapImage*)image;
-(GingersnapImage*) findImageWithIdentifier:(NSString*) identifier;


@end
