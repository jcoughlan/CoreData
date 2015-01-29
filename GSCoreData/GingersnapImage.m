//
//  GingersnapImage.m
//  GSCoreData
//
//  Created by James Coughlan on 28/01/2015.
//  Copyright (c) 2015 James Coughlan. All rights reserved.
//

#import "GingersnapImage.h"
#import "GSCoreDataManager.h"
#import "GingersnapSession.h"

@implementation GingersnapImage

@dynamic identifier;
@dynamic imageData;
@dynamic lastUsed;
@dynamic iconAvatar;
@dynamic thumbnailAvatar;
@dynamic largeImageAvatar;

+(void) initWithIdentifier:(NSString*)identifier andCallback:(ObjectAddedCompletionBlock)callback
{
    if([NSThread currentThread] == [[[GSCoreDataManager sharedManager] managedObjectContext] getCoreDataThread])
    {
        GingersnapImage* gsImage = (GingersnapImage*)[[GSCoreDataManager sharedManager] fetchSingleObjectWithID:identifier andClass:[GingersnapImage class]];
        
        if(gsImage)
        {
            callback(gsImage);
            return;
        }
        gsImage = (GingersnapImage*)[NSEntityDescription insertNewObjectForEntityForName:@"GingersnapImage" inManagedObjectContext:[[GSCoreDataManager sharedManager] managedObjectContext]];
        gsImage.identifier = identifier;
        
        if ([NSThread currentThread] == [NSThread mainThread])
            callback(gsImage);
        else
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(gsImage);
            });
    }
    else
        dispatch_async([GingersnapSession sharedManager].coreDataQueue, ^{
            [GingersnapImage initWithIdentifier:identifier andCallback:callback];
        });
}

@end
