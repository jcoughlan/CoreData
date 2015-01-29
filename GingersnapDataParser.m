//
//  GingersnapDataParser.m
//  GSCoreData
//
//  Created by James Coughlan on 29/01/2015.
//  Copyright (c) 2015 James Coughlan. All rights reserved.
//

#import "GingersnapDataParser.h"
#import "AWSSettings.h"
@implementation GingersnapDataParser

+(void) parseRootWithData:(NSDictionary*)jsonData andCallback:(ObjectAddedCompletionBlock)callback
{
    dispatch_async([GingersnapSession sharedManager].backgroundQueue, ^{
        
        GingersnapRootData* rootData = [GingersnapSession sharedManager].rootData;
        if (![jsonData valueForKey:@"ok"] || ([jsonData valueForKey:@"ok"] == NO))
        {
            callback(nil);
            return;
        }
        
        [[GingersnapSession sharedManager] testAppVersion:jsonData];
        
        [AWSSettings addAWSSettings:jsonData];
        
        //	if (![[jsonData valueForKey:@"redirect_to_staging"] isKindOfClass:[NSNull class]]){
        ////		redirectToStaging = [[jsonData valueForKey:@"redirect_to_staging"] boolValue];
        //		if ([[jsonData valueForKey:@"redirect_to_staging"] isEqual:@1]) {
        //			redirectToStaging = true;
        //		}
        //	}
        
        //    if(redirectToStaging)
        //        [[HTTPRequestHandler sharedManager] setNewHost:ELDERBERRY_DEBUG];
        //    else
        //        [[HTTPRequestHandler sharedManager] setNewHost:ELDERBERRY_PRODUCTION];
        
        if (![[jsonData valueForKey:@"onboarding_adventure_id"] isKindOfClass:[NSNull class]])
            rootData.onboardingAdventureID =[jsonData valueForKey:@"onboarding_adventure_id"];
        
        if (![[jsonData valueForKey:@"user"] isKindOfClass:[NSNull class]])
        {
            NSDictionary* userDict = [jsonData valueForKey:@"user"];
            if([GingersnapSession sharedManager].user)
            {
                if([userDict valueForKey:@"has_sent_adventure"])
                    [ GingersnapSession sharedManager].user.has_sent_adventure =[NSNumber numberWithBool: [[userDict valueForKey:@"has_sent_adventure"] boolValue]];
                if([userDict valueForKey:@"has_avatar"])
                    [GingersnapSession sharedManager].user.has_avatar = [NSNumber numberWithBool:[[userDict valueForKey:@"has_avatar"] boolValue]];
                if([userDict valueForKey:@"has_grandchildren"])
                    [GingersnapSession sharedManager].user.has_grandchildren = [NSNumber numberWithBool:[[userDict valueForKey:@"has_grandchildren"] boolValue]];
            }
        }
        
        callback(rootData);
        
    });
}

+(void) parseSalutationsWithData:(NSDictionary*)jsonData andCallback:(ObjectAddedCompletionBlock)callback
{
    
    dispatch_async([GingersnapSession sharedManager].backgroundQueue, ^{
        
        if (![jsonData valueForKey:@"ok"] || ([jsonData valueForKey:@"ok"] == NO))
        {
            callback(NO);
            return;
        }
        
        [GingersnapSession sharedManager].rootData.grandparentSalutationsFemale = [[NSMutableArray alloc] init];
        [GingersnapSession sharedManager].rootData.grandparentSalutationsMale = [[NSMutableArray alloc] init];
        
        NSArray* male_salutations = [jsonData valueForKey:@"male_salutations"];
        [GingersnapSession sharedManager].rootData.grandparentSalutationsMale = [[NSMutableArray alloc] initWithArray:male_salutations];
        NSArray* female_salutations = [jsonData valueForKey:@"female_salutations"];
        [GingersnapSession sharedManager].rootData.grandparentSalutationsFemale = [[NSMutableArray alloc] initWithArray:female_salutations];
        callback(nil);
        NSLog(@"MALE SALUTATIONS %@", (NSString*)[male_salutations objectAtIndex:0]);
        
        [[NSNotificationCenter defaultCenter]
         postNotificationName:@"salutationsUpdated"
         object:self];
    });
}

+(void) parseUserWithData:(NSDictionary*)jsonData andCallback:(ObjectAddedCompletionBlock)callback
{
    
}

+(void) parseEventWithData:(NSDictionary*)jsonData andCallback:(ObjectAddedCompletionBlock)callback
{
    
}
+(void) parseEventsWithData:(NSDictionary*)jsonData andCallback:(ObjectAddedCompletionBlock)objectAddedCallback andProcessCompletedCallback:(ProcessCompletedBlock)processCompletedCallback
{
    
}

+(void) parseActivityWithData:(NSDictionary*)jsonData andCallback:(ObjectAddedCompletionBlock)callback
{
    
}
+(void) parseActivitiesWithData:(NSDictionary*)jsonData andCallback:(ObjectAddedCompletionBlock)objectAddedCallback andProcessCompletedCallback:(ProcessCompletedBlock)processCompletedCallback
{
    
}

+(void) parseActivityTemplateWithData:(NSDictionary*)jsonData andCallback:(ObjectAddedCompletionBlock)callback
{
    
}
+(void) parseActivityTemplatesWithData:(NSDictionary*)jsonData andCallback:(ObjectAddedCompletionBlock)objectAddedCallback andProcessCompletedCallback:(ProcessCompletedBlock)processCompletedCallback
{
    
}

+(void) parseConnectionWithData:(NSDictionary*)jsonData andCallback:(ObjectAddedCompletionBlock)callback
{
    
}
+(void) parseConnectionsWithData:(NSDictionary*)jsonData andCallback:(ObjectAddedCompletionBlock)objectAddedCallback andProcessCompletedCallback:(ProcessCompletedBlock)processCompletedCallback
{
    
}

+(void) parseRelationshipWithData:(NSDictionary*)jsonData andCallback:(ObjectAddedCompletionBlock)callback
{
    
}
+(void) parseRelationshipsWithData:(NSDictionary*)jsonData andCallback:(ObjectAddedCompletionBlock)objectAddedCallback andProcessCompletedCallback:(ProcessCompletedBlock)processCompletedCallback
{
    
}

+(void) parseShareWithData:(NSDictionary*)jsonData andCallback:(ObjectAddedCompletionBlock)callback
{
    
}
+(void) parseSharesWithData:(NSDictionary*)jsonData andCallback:(ObjectAddedCompletionBlock)objectAddedCallback andProcessCompletedCallback:(ProcessCompletedBlock)processCompletedCallback
{
    
}

+(void) parseAvatarWithData:(NSDictionary*)jsonData andCallback:(ObjectAddedCompletionBlock)callback
{
    
}
+(void) parseAvatarsWithData:(NSDictionary*)jsonData andCallback:(ObjectAddedCompletionBlock)objectAddedCallback andProcessCompletedCallback:(ProcessCompletedBlock)processCompletedCallback
{
    
}

+(void) parseChildWithData:(NSDictionary*)jsonData andCallback:(ObjectAddedCompletionBlock)callback
{
    
}
+(void) parseChildrenWithData:(NSDictionary*)jsonData andCallback:(ObjectAddedCompletionBlock)objectAddedCallback andProcessCompletedCallback:(ProcessCompletedBlock)processCompletedCallback
{
    
}

+(void) parseParentWithData:(NSDictionary*)jsonData andCallback:(ObjectAddedCompletionBlock)callback
{
    
}
+(void) parseParentsWithData:(NSDictionary*)jsonData andCallback:(ObjectAddedCompletionBlock)objectAddedCallback andProcessCompletedCallback:(ProcessCompletedBlock)processCompletedCallback
{
    
}
@end
