//
//  GingersnapAppManager.h
//  GSCoreData
//
//  Created by James Coughlan on 29/01/2015.
//  Copyright (c) 2015 James Coughlan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPRequests.h"
#import "GingersnapDataParser.h"

@interface GingersnapAppManager : NSObject

+(void)sendProcessCompletedCallback:(ProcessCompletedBlock) callback withObject:(id) object;
+(void)sendObjectAddedCallback:(ObjectAddedCompletionBlock) callback withObject:(id) object;

+(void)getRootWithCallback:(ObjectAddedCompletionBlock)callback;

-(void)loginUserWithEmail:(NSString*)email andPassword:(NSString*)password withCallback:(ObjectAddedCompletionBlock)callback;
-(void)registerUserWithEmail:(NSString*)email andPassword:(NSString *)password firstName:(NSString *)firstName lastName:(NSString *)lastName andPostcode:(NSString *)postcode withAgreedTerms:(BOOL)termsAgreed withProvisionalID:(NSString *)provisionalID withCallback:(ObjectAddedCompletionBlock)callback;

@end
