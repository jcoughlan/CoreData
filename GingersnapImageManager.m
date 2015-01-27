//
//  GingersnapImageManager.m
//  GSCoreData
//
//  Created by James Coughlan on 27/01/2015.
//  Copyright (c) 2015 James Coughlan. All rights reserved.
//

#import "GingersnapImageManager.h"
#import "GSCoreDataManager.h"

@implementation GingersnapImageManager
@synthesize imageArray;

+ (GingersnapImageManager*)sharedManager {
    static GingersnapImageManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        assert([NSThread isMainThread]);
        sharedMyManager = [[self alloc] init];
        [sharedMyManager refreshImageArray];
    });
    return sharedMyManager;
}

-(void) addImage:(GingersnapImage*)image
{
    if(!imageArray)
       [self refreshImageArray];
    else if (![imageArray containsObject:image])
        [imageArray addObject:image];
}

-(GingersnapImage*) findImageWithIdentifier:(NSString*) identifier
{
    for (GingersnapImage* image in imageArray)
    {
        if([image.identifier isEqualToString:identifier])
            return image;
    }
    
    //refresh and try again
    [self refreshImageArray];
    
    for (GingersnapImage* image in imageArray)
    {
        if([image.identifier isEqualToString:identifier])
            return image;
    }
    
    return nil;
}

-(void) refreshImageArray
{
    if(imageArray)
       [imageArray removeAllObjects];
    
    imageArray =[[NSMutableArray alloc] initWithArray: [[GSCoreDataManager sharedManager] fetchObjectsWithClass:[GingersnapImage class]]];
}

@end
