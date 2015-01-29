//
//  GingersnapDataParser.h
//  GSCoreData
//
//  Created by James Coughlan on 29/01/2015.
//  Copyright (c) 2015 James Coughlan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GingersnapSession.h"
#import "GingersnapEntities.h"
@interface GingersnapDataParser : NSObject

+(void) parseRootWithData:(NSDictionary*)jsonData andCallback:(ObjectAddedCompletionBlock)callback;

+(void) parseSalutationsWithData:(NSDictionary*)jsonData andCallback:(ObjectAddedCompletionBlock)callback;

+(void) parseUserWithData:(NSDictionary*)jsonData andCallback:(ObjectAddedCompletionBlock)callback;

+(void) parseEventWithData:(NSDictionary*)jsonData andCallback:(ObjectAddedCompletionBlock)callback;
+(void) parseEventsWithData:(NSDictionary*)jsonData andCallback:(ObjectAddedCompletionBlock)objectAddedCallback andProcessCompletedCallback:(ProcessCompletedBlock)processCompletedCallback;

+(void) parseActivityWithData:(NSDictionary*)jsonData andCallback:(ObjectAddedCompletionBlock)callback;
+(void) parseActivitiesWithData:(NSDictionary*)jsonData andCallback:(ObjectAddedCompletionBlock)objectAddedCallback andProcessCompletedCallback:(ProcessCompletedBlock)processCompletedCallback;

+(void) parseActivityTemplateWithData:(NSDictionary*)jsonData andCallback:(ObjectAddedCompletionBlock)callback;
+(void) parseActivityTemplatesWithData:(NSDictionary*)jsonData andCallback:(ObjectAddedCompletionBlock)objectAddedCallback andProcessCompletedCallback:(ProcessCompletedBlock)processCompletedCallback;

+(void) parseConnectionWithData:(NSDictionary*)jsonData andCallback:(ObjectAddedCompletionBlock)callback;
+(void) parseConnectionsWithData:(NSDictionary*)jsonData andCallback:(ObjectAddedCompletionBlock)objectAddedCallback andProcessCompletedCallback:(ProcessCompletedBlock)processCompletedCallback;

+(void) parseRelationshipWithData:(NSDictionary*)jsonData andCallback:(ObjectAddedCompletionBlock)callback;
+(void) parseRelationshipsWithData:(NSDictionary*)jsonData andCallback:(ObjectAddedCompletionBlock)objectAddedCallback andProcessCompletedCallback:(ProcessCompletedBlock)processCompletedCallback;

+(void) parseShareWithData:(NSDictionary*)jsonData andCallback:(ObjectAddedCompletionBlock)callback;
+(void) parseSharesWithData:(NSDictionary*)jsonData andCallback:(ObjectAddedCompletionBlock)objectAddedCallback andProcessCompletedCallback:(ProcessCompletedBlock)processCompletedCallback;

+(void) parseAvatarWithData:(NSDictionary*)jsonData andCallback:(ObjectAddedCompletionBlock)callback;
+(void) parseAvatarsWithData:(NSDictionary*)jsonData andCallback:(ObjectAddedCompletionBlock)objectAddedCallback andProcessCompletedCallback:(ProcessCompletedBlock)processCompletedCallback;

+(void) parseChildWithData:(NSDictionary*)jsonData andCallback:(ObjectAddedCompletionBlock)callback;
+(void) parseChildrenWithData:(NSDictionary*)jsonData andCallback:(ObjectAddedCompletionBlock)objectAddedCallback andProcessCompletedCallback:(ProcessCompletedBlock)processCompletedCallback;

+(void) parseParentWithData:(NSDictionary*)jsonData andCallback:(ObjectAddedCompletionBlock)callback;
+(void) parseParentsWithData:(NSDictionary*)jsonData andCallback:(ObjectAddedCompletionBlock)objectAddedCallback andProcessCompletedCallback:(ProcessCompletedBlock)processCompletedCallback;
@end
