//
//  GingersnapAppManager.m
//  GSCoreData
//
//  Created by James Coughlan on 29/01/2015.
//  Copyright (c) 2015 James Coughlan. All rights reserved.
//

#import "GingersnapAppManager.h"
#import "GCRequests.h"
#import "GPRequests.h"
@implementation GingersnapAppManager

+(void)sendObjectAddedCallback:(ObjectAddedCompletionBlock) callback withObject:(id) object{
    dispatch_async(dispatch_get_main_queue(), ^{
        callback(object);
    });
}

+(void)sendProcessCompletedCallback:(ProcessCompletedBlock) callback withObject:(id) object{
    dispatch_async(dispatch_get_main_queue(), ^{
        callback(object);
    });
}

+(void)getRootWithCallback:(ObjectAddedCompletionBlock)callback
{
    HTTPRequests* requestManager = [GCRequests sharedManager] ? [GCRequests sharedManager] : [GPRequests sharedManager];
    
    NSString* email = [GingersnapSession sharedManager].user.grandparent.email ? [GingersnapSession sharedManager].user.grandparent.email : [GingersnapSession sharedManager].user.parent.email ;
    NSString* token = [GingersnapSession sharedManager].user.auth_token;
    
    [requestManager getRootWithAuthToken:token andEmail:email withCallback:^(NSDictionary *jsonData, NSError *error, NSString* rawData) {
        if (!error)
        {
            [GingersnapDataParser parseRootWithData:jsonData andCallback:^(id object) {
                [GingersnapAppManager sendObjectAddedCallback:callback withObject:object];
                
            }];
        }
        else
        {
            [GingersnapAppManager sendObjectAddedCallback:callback withObject:error];
        }
    }andHTTPRequestType:AUTOMATED];
}

-(void)loginUserWithEmail:(NSString*)email andPassword:(NSString*)password withCallback:(ObjectAddedCompletionBlock)callback
{
    HTTPRequests* requestManager = [GCRequests sharedManager] ? [GCRequests sharedManager] : [GPRequests sharedManager];
    
    [requestManager loginWithEmail:email andPassword:password withCallback:^(NSDictionary *jsonData, NSError *error, NSString *rawData) {
        if(!error)
        {
            [GingersnapDataParser parseUserWithData:jsonData andCallback:^(id object) {
                [GingersnapAppManager sendObjectAddedCallback:callback withObject:object];
            }];
        }
        else
        {
            [GingersnapAppManager sendObjectAddedCallback:callback withObject:error];
        }
    } andHTTPRequestType:AUTOMATED];
}

-(void)registerUserWithEmail:(NSString*)email andPassword:(NSString *)password firstName:(NSString *)firstName lastName:(NSString *)lastName andPostcode:(NSString *)postcode withAgreedTerms:(BOOL)termsAgreed withProvisionalID:(NSString *)provisionalID withCallback:(ObjectAddedCompletionBlock)callback
{
    HTTPRequests* requestManager = [GCRequests sharedManager] ? [GCRequests sharedManager] : [GPRequests sharedManager];

    [requestManager registerUserWithEmail:email andPassword:password firstName:firstName lastName:@"" andPostcode:postcode withAgreedTerms:termsAgreed withProvisionalID:provisionalID withCallback:^(NSDictionary *jsonData, NSError *error, NSString *rawData) {
        //TODO implement
    } andHTTPRequestType:AUTOMATED];
}


-(void)getSalutationsWithCallback:(ObjectAddedCompletionBlock)callback
{
    HTTPRequests* requestManager = [GCRequests sharedManager] ? [GCRequests sharedManager] : [GPRequests sharedManager];

    [requestManager getSalutationswithCallback:^(NSDictionary *jsonData, NSError *error, NSString *rawData) {
        if(!error)
        {
            [GingersnapDataParser parseSalutationsWithData:jsonData andCallback:^(id object) {
                [GingersnapAppManager sendObjectAddedCallback:callback withObject:object];
            }];
        }
        else
            [GingersnapAppManager sendObjectAddedCallback:callback withObject:error];
    } andHTTPRequestType:AUTOMATED];
}

//TODO Implement if needed
//-(void)registerProvisionalUserWithEmail:(NSString*)email a



@end
