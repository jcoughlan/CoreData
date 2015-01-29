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
        [sharedMyManager deleteOldImages];
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

-(void)deleteOldImages
{
    NSArray* array = [[GSCoreDataManager sharedManager] fetchObjectsWithClass:[GingersnapImage class]];
    NSMutableArray* images = [[NSMutableArray alloc] initWithArray:array];
    //
    //            for(EBImage* image in images)
    //            {
    //                if(!image.time || !image.data)
    //                    [images removeObject:image];
    //            }
    NSSortDescriptor *sortDescriptor;
    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"time"
                                                 ascending:NO];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    NSArray *sortedArray;
    sortedArray = [images sortedArrayUsingDescriptors:sortDescriptors];
    
    if([sortedArray count] > IMAGE_CACHE_LIMIT)
    {
        for(int i = IMAGE_CACHE_LIMIT-50; i < [sortedArray count]; i++)
            [[GSCoreDataManager sharedManager] deleteObject:[sortedArray objectAtIndex:i]];
    }
    
    [self refreshImageArray];
    
}

@end
