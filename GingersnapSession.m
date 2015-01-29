//
//  GingersnapSession.m
//  GSCoreData
//
//  Created by James Coughlan on 26/01/2015.
//  Copyright (c) 2015 James Coughlan. All rights reserved.
//

#import "GingersnapSession.h"
#import "GSCoreDataManager.h"
#import <UIKit/UIKit.h>
@implementation GingersnapSession
+ (GingersnapSession*)sharedManager {
    static GingersnapSession *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        assert([NSThread isMainThread]);
        sharedMyManager = [[self alloc] init];
        sharedMyManager.coreDataQueue = dispatch_get_main_queue();
        sharedMyManager.rootData = [[GingersnapRootData alloc] init];
        //sharedMyManager.coreDataQueue = dispatch_queue_create("com.gingersnap.cdQ", NULL);
        sharedMyManager.apiQueue = dispatch_queue_create("com.gingersnap.apiQ", NULL);
        sharedMyManager.backgroundQueue = dispatch_queue_create("com.gingersnap.backQ", NULL);
        __block BOOL loaded = false;
        
        dispatch_async(sharedMyManager.coreDataQueue, ^{
            [GSCoreDataManager sharedManager];
            loaded = true;
        });
    });
    return sharedMyManager;
}

-(void) testAppVersion:(NSDictionary*)rootData
{
    if (![[rootData valueForKey:@"app_version"] isKindOfClass:[NSNull class]])
    {
        NSString* appReleaseStringRemote =[rootData valueForKey:@"app_version"];
        NSString * appReleaseStringLocal = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
        
        NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
        f.numberStyle = NSNumberFormatterBehavior10_4;
        [f setMaximumFractionDigits:0];
        NSArray* releaseRemoteArray = [appReleaseStringRemote componentsSeparatedByString:@"."];
        NSArray* releaseLocalArray = [appReleaseStringLocal componentsSeparatedByString:@"."];
        
        if([releaseRemoteArray count] ==3)
        {
            int remoteRelease = ([[f numberFromString:[releaseRemoteArray objectAtIndex:0]] intValue]*100 +[[f numberFromString:[releaseRemoteArray objectAtIndex:1]] intValue]*10 + [[f numberFromString:[releaseRemoteArray objectAtIndex:2]] intValue]);
            int localRelease = ([[f numberFromString:[releaseLocalArray objectAtIndex:0]] intValue]*100 +[[f numberFromString:[releaseLocalArray objectAtIndex:1]] intValue]*10 + [[f numberFromString:[releaseLocalArray objectAtIndex:2]] intValue]);
            
            remoteRelease = [[NSNumber numberWithFloat:remoteRelease] intValue];
            localRelease = [[NSNumber numberWithFloat:localRelease] intValue];
            if (remoteRelease > 0)
            {
                if(remoteRelease   > localRelease )
                {
                    dispatch_async( dispatch_get_main_queue(), ^
                                   {
                                       UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Update Available" message:@"You need to update your app to continue. Please click OK to go to the App Store" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
                                       [alert show];
                                   });
                }
            }
        }
    }
}
@end
