//
//  GCRequests.m
//  GSCoreData
//
//  Created by James Coughlan on 27/01/2015.
//  Copyright (c) 2015 James Coughlan. All rights reserved.
//

#import "GCRequests.h"

@implementation GCRequests

+ (GCRequests*)sharedManager {
    
    //TODO check if we are in gc or gp app, in which case done initialiase either this or gpRequests
    static GCRequests *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
       // if([[ElderberrySession sharedManager] redirectToStaging])
            sharedMyManager = [[self alloc] initWithType:ELDERBERRY_DEBUG];
//        else
//            sharedMyManager = [[self alloc] initWithType:ELDERBERRY_PRODUCTION];
//        
        if(!sharedMyManager.urlRequestQueue)
            sharedMyManager.urlRequestQueue = [[NSMutableArray alloc]initWithObjects: nil];
//        if(!sharedMyManager.httpDisplayErrorHandler)
//            sharedMyManager.httpDisplayErrorHandler = [HTTPDisplayErrors sharedManager];
    });
    return sharedMyManager;
}

@end
