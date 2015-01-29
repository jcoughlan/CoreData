//
//  HTTPRequests.h
//  GSCoreData
//
//  Created by James Coughlan on 27/01/2015.
//  Copyright (c) 2015 James Coughlan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPRequest.h"

@interface HTTPRequests : NSObject
typedef enum {
    ELDERBERRY_PRODUCTION,
    ELDERBERRY_DEBUG
} HostType;

@property (nonatomic, retain) NSMutableArray* urlRequestQueue;

-(id) initWithType:(HostType) type;
-(void) setNewHost:(HostType)type;

-(void) getRootWithAuthToken:(NSString*)auth_token andEmail:(NSString*)email withCallback:(OnResponseReceivedBlock)callback andHTTPRequestType:(HTTPRequestType)requestType;
-(void) getSalutationswithCallback:(OnResponseReceivedBlock)callback andHTTPRequestType:(HTTPRequestType)requestType;

-(void) loginWithEmail: (NSString*) email andPassword: (NSString*) password withCallback:(OnResponseReceivedBlock)callback andHTTPRequestType:(HTTPRequestType)requestType;
-(void) registerUserWithEmail: (NSString*) email andPassword: (NSString*) password firstName: (NSString*) firstName lastName:(NSString*)lastName andPostcode:(NSString*)postcode withAgreedTerms:(BOOL)termsAgreed withProvisionalID:(NSString*)provisionalID  withCallback:(OnResponseReceivedBlock)callback andHTTPRequestType:(HTTPRequestType)requestType;
-(void) provisionUserWithEmail:(NSString*) email andFirstName: (NSString*)firstName andLastName:(NSString*)lastName andPostcode:(NSString*)postcode andTermsAgreed:(BOOL)termsAgreed withCallback:(OnResponseReceivedBlock)callback andHTTPRequestType:(HTTPRequestType)requestType;


@end
