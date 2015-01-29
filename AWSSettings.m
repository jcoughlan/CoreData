//
//  AWSSettings.m
//  CoreData
//
//  Created by James Coughlan on 02/09/2014.
//  Copyright (c) 2014 James Coughlan. All rights reserved.
//

#import "AWSSettings.h"
#import "AmazonS3Manager.h"
@implementation AWSSettings
@synthesize  aws_bucket;
@synthesize aws_key;
@synthesize aws_secret;
@synthesize urbanairship_key;
@synthesize urbanairship_secret;

-(id) init
{
    self = [super init];
    return self;
}

+(void) addAWSSettings:(NSDictionary*)rootData
{
    AWSSettings* aws_settings = [[AWSSettings alloc]init];
    if (![[rootData valueForKey:@"aws_key"] isKindOfClass:[NSNull class]])
        aws_settings.aws_key =[rootData valueForKey:@"aws_key"];
    if (![[rootData valueForKey:@"aws_bucket"] isKindOfClass:[NSNull class]])
        aws_settings.aws_bucket =[rootData valueForKey:@"aws_bucket"];
    if (![[rootData valueForKey:@"aws_secret"] isKindOfClass:[NSNull class]])
        aws_settings.aws_secret =[rootData valueForKey:@"aws_secret"];
    if (![[rootData valueForKey:@"urbanairship_secret"] isKindOfClass:[NSNull class]])
        aws_settings.urbanairship_secret =[rootData valueForKey:@"urbanairship_secret"];
    if (![[rootData valueForKey:@"urbanairship_key"] isKindOfClass:[NSNull class]])
        aws_settings.urbanairship_key =[rootData valueForKey:@"urbanairship_key"];
    
    [[AmazonS3Manager sharedManager] setAwsSettingsManually:aws_settings];
}
@end
