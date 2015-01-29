//
//  AWSSettings.h
//  CoreData
//
//  Created by James Coughlan on 02/09/2014.
//  Copyright (c) 2014 James Coughlan. All rights reserved.
//
//███████╗ ██████╗ ██████╗ ██╗      ██████╗  ██████╗ ██████╗ ███████╗
//██╔════╝██╔═══██╗██╔══██╗██║     ██╔═══██╗██╔═══██╗██╔══██╗██╔════╝
//█████╗  ██║   ██║██████╔╝██║     ██║   ██║██║   ██║██████╔╝███████╗
//██╔══╝  ██║   ██║██╔══██╗██║     ██║   ██║██║   ██║██╔═══╝ ╚════██║
//██║     ╚██████╔╝██║  ██║███████╗╚██████╔╝╚██████╔╝██║     ███████║
//╚═╝      ╚═════╝ ╚═╝  ╚═╝╚══════╝ ╚═════╝  ╚═════╝ ╚═╝     ╚══════╝


#import <Foundation/Foundation.h>
#
@interface AWSSettings : NSObject

//"ok": true,
//"aws_key": "AKIAIYUL3DMHSL5C6JYA",
//"aws_secret": "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",
//"aws_bucket": "elderberry-server",
//"urbanairship_key": "QU1Z3X01RFyXEZT69Clr9g",
//"urbanairship_secret": "N98zxA55T3OJeH-lIXnJRg"

@property(nonatomic, retain) NSString* aws_key;
@property(nonatomic, retain) NSString* aws_secret;
@property(nonatomic, retain) NSString* aws_bucket;
@property(nonatomic, retain) NSString* urbanairship_key;
@property(nonatomic, retain) NSString* urbanairship_secret;

+(void) addAWSSettings:(NSDictionary*)rootData;

-(id) init;
@end
