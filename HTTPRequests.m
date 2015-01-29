//
//  HTTPRequests.m
//  GSCoreData
//
//  Created by James Coughlan on 27/01/2015.
//  Copyright (c) 2015 James Coughlan. All rights reserved.
//

#import "HTTPRequests.h"
#import "HTTPConsts.h"
#import "HTTPRequest.h"
#import "GingersnapSession.h"
@implementation HTTPRequests

//*****constructors*****\\//*****initialises as app delegate singleton*****
-(id) initWithType:(HostType) type;
{
    self = [super init];
    [self setNewHost:type];
    
    return self;
}

-(void) setNewHost:(HostType)type
{
    if (type == ELDERBERRY_PRODUCTION)
    {
        ELDERBERRY_HOST = ELDERBERRY_PRODUCTION_HOST;
        CHILDS_API_KEY = GC_PRODUCTION_KEY;
        GRANDPARENTS_API_KEY = GP_PRODUCTION_KEY;
    }
    else if (type == ELDERBERRY_DEBUG)
    {
        ELDERBERRY_HOST = ELDERBERRY_DEBUG_HOST;
        CHILDS_API_KEY = GC_DEBUG_KEY;
        GRANDPARENTS_API_KEY = GP_DEBUG_KEY;
    }
    //if(isGPApp)
    //  API_KEY = GRANDPARENTS_API_KEY;
    //else
    API_KEY = CHILDS_API_KEY;
}

-(void) getRootWithAuthToken:(NSString*)auth_token andEmail:(NSString*)email withCallback:(OnResponseReceivedBlock)callback andHTTPRequestType:(HTTPRequestType)requestType
{
    NSArray* params = [[NSArray alloc] initWithObjects: nil];
    
    NSString* url = [NSString stringWithFormat:@"%@%@%@",[NSString stringWithUTF8String:ELDERBERRY_HOST],[NSString stringWithUTF8String:ELDERBERRY_API_PREFIX],[NSString stringWithUTF8String:ELDERBERRY_API_VERSION]  ];
    HTTPRequest* request = [[HTTPRequest alloc] initWithUrl:url params:params body:nil timeout:TIMEOUT callback:callback andHTTPRequestType:requestType];
    
    //add headers
    if(email)
        [request.urlRequest addValue:email forHTTPHeaderField:@"X-User-Email"];
    if(auth_token)
        [request.urlRequest addValue:auth_token forHTTPHeaderField:@"X-User-Token"];
    NSString* authorizationString =  [NSString stringWithFormat:@"Token token=%@",[NSString stringWithUTF8String:API_KEY]];
    [request.urlRequest addValue:authorizationString forHTTPHeaderField:@"Authorization"];
    
    [request runGetRequest:self.urlRequestQueue];
}

//*****requests*****\\//
-(void) loginWithEmail: (NSString*) email andPassword: (NSString*) password withCallback:(OnResponseReceivedBlock)callback andHTTPRequestType:(HTTPRequestType)requestType
{
    //TODO reimplemtent
    NSString* deviceID  = [NSString stringWithFormat:@"%@%@&", @"device[id]=", [GingersnapSession sharedManager].deviceToken];
    NSString* deviceOS  = [NSString stringWithFormat:@"%@%@&", @"device[os]=", @"ios"];
    
    email  = [NSString stringWithFormat:@"%@%@&", @"user[email]=", email];
    password= [NSString stringWithFormat:@"%@%@", @"user[password]=", password];
    
    NSArray* params = [[NSArray alloc] initWithObjects:deviceID, deviceOS, email, password, nil];
    
    NSString* url = [NSString stringWithFormat:@"%@%@%@%@",[NSString stringWithUTF8String:ELDERBERRY_HOST],[NSString stringWithUTF8String:ELDERBERRY_API_PREFIX],[NSString stringWithUTF8String:ELDERBERRY_API_VERSION] , [NSString stringWithUTF8String:LOGIN_USER_SUFFIX] ];
    HTTPRequest* request = [[HTTPRequest alloc] initWithUrl:url params:params body:nil timeout:TIMEOUT callback:callback andHTTPRequestType:requestType] ;
    
    //add headers
    NSString* authorizationString =  [NSString stringWithFormat:@"Token token=%@",[NSString stringWithUTF8String:API_KEY]];
    [request.urlRequest addValue:authorizationString forHTTPHeaderField:@"Authorization"];
    [request runPostRequest:self.urlRequestQueue];
}

-(void) registerUserWithEmail: (NSString*) email andPassword: (NSString*) password firstName: (NSString*) firstName lastName:(NSString*)lastName andPostcode:(NSString*)postcode withAgreedTerms:(BOOL)termsAgreed withProvisionalID:(NSString*)provisionalID  withCallback:(OnResponseReceivedBlock)callback andHTTPRequestType:(HTTPRequestType)requestType
{
    email  = [NSString stringWithFormat:@"%@%@&", @"email=", email];
    firstName= [NSString stringWithFormat:@"%@%@&", @"first_name=", firstName];
    lastName= [NSString stringWithFormat:@"%@%@&", @"last_name=", lastName];
    password= [NSString stringWithFormat:@"%@%@&", @"password=", password];
    postcode= [NSString stringWithFormat:@"%@%@&", @"postcode=", postcode];
    provisionalID= [NSString stringWithFormat:@"%@%@&", @"provisional_id=", provisionalID];
    NSString* termsAgreedStatus = nil;
    if (termsAgreed)
        termsAgreedStatus = @"terms_agreed=true";
    else
        termsAgreedStatus = @"terms_agreed=false";
    
    NSArray* params = [[NSArray alloc] initWithObjects:email, firstName, lastName, password,postcode, provisionalID, termsAgreedStatus, nil];
    NSString* url = [NSString stringWithFormat:@"%@%@%@%@",[NSString stringWithUTF8String:ELDERBERRY_HOST],[NSString stringWithUTF8String:ELDERBERRY_API_PREFIX],[NSString stringWithUTF8String:ELDERBERRY_API_VERSION] , [NSString stringWithUTF8String:REGISTER_USER_SUFFIX] ];
    HTTPRequest* request = [[HTTPRequest alloc] initWithUrl:url params:params body:nil timeout:TIMEOUT callback:callback andHTTPRequestType:requestType];
    
    //add headers
    NSString* authorizationString =  [NSString stringWithFormat:@"Token token=%@",[NSString stringWithUTF8String:API_KEY]];
    [request.urlRequest addValue:authorizationString forHTTPHeaderField:@"Authorization"];
    
    [request runPostRequest:self.urlRequestQueue];
}

-(void) provisionUserWithEmail:(NSString*) email andFirstName: (NSString*)firstName andLastName:(NSString*)lastName andPostcode:(NSString*)postcode andTermsAgreed:(BOOL)termsAgreed withCallback:(OnResponseReceivedBlock)callback andHTTPRequestType:(HTTPRequestType)requestType
{
    email  = [NSString stringWithFormat:@"%@%@&", @"email=", email];
    firstName= [NSString stringWithFormat:@"%@%@&", @"first_name=", firstName];
    lastName= [NSString stringWithFormat:@"%@%@&", @"last_name=", lastName];
    postcode= [NSString stringWithFormat:@"%@%@&", @"postcode=", postcode];
    
    NSString* termsAgreedStatus = nil;
    if (termsAgreed)
        termsAgreedStatus = @"terms_agreed=true";
    else
        termsAgreedStatus = @"terms_agreed=false";
    NSArray* params = [[NSArray alloc] initWithObjects:email, firstName, lastName,postcode, termsAgreedStatus, nil];
    NSString* url = [NSString stringWithFormat:@"%@%@%@%@",[NSString stringWithUTF8String:ELDERBERRY_HOST],[NSString stringWithUTF8String:ELDERBERRY_API_PREFIX],[NSString stringWithUTF8String:ELDERBERRY_API_VERSION] , [NSString stringWithUTF8String:PROVISIONAL_USER_SUFFIX] ];
    HTTPRequest* request = [[HTTPRequest alloc] initWithUrl:url params:params body:nil timeout:TIMEOUT callback:callback andHTTPRequestType:requestType];
    
    //add headers
    NSString* authorizationString =  [NSString stringWithFormat:@"Token token=%@",[NSString stringWithUTF8String:API_KEY]];
    [request.urlRequest addValue:authorizationString forHTTPHeaderField:@"Authorization"];
    [request runPostRequest:self.urlRequestQueue];
}

-(void) getSalutationswithCallback:(OnResponseReceivedBlock)callback andHTTPRequestType:(HTTPRequestType)requestType
{
    NSArray* params = [[NSArray alloc] initWithObjects: nil];
    
    NSString* url = [NSString stringWithFormat:@"%@%@%@/constants/grandparents",[NSString stringWithUTF8String:ELDERBERRY_HOST],[NSString stringWithUTF8String:ELDERBERRY_API_PREFIX],[NSString stringWithUTF8String:ELDERBERRY_API_VERSION]  ];
    HTTPRequest* request = [[HTTPRequest alloc] initWithUrl:url params:params body:nil timeout:TIMEOUT callback:callback andHTTPRequestType:requestType];
    
    //add headers
    NSString* authorizationString =  [NSString stringWithFormat:@"Token token=%@",[NSString stringWithUTF8String:API_KEY]];
    [request.urlRequest addValue:authorizationString forHTTPHeaderField:@"Authorization"];
    
    [request runGetRequest:self.urlRequestQueue];
}

@end
