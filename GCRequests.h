//
//  GCRequests.h
//  GSCoreData
//
//  Created by James Coughlan on 27/01/2015.
//  Copyright (c) 2015 James Coughlan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPRequests.h"

@interface GCRequests : HTTPRequests
+ (GCRequests*)sharedManager;

@end
