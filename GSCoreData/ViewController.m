//
//  ViewController.m
//  GSCoreData
//
//  Created by James Coughlan on 26/01/2015.
//  Copyright (c) 2015 James Coughlan. All rights reserved.
//

#import "ViewController.h"

#import "GingersnapEntities.h"
#import "GingersnapSession.h"
#import "GSCoreDataManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //just need to initialise this
    [GingersnapSession sharedManager];
    
   // CoreDataLog(user.auth_token, nil);
    [[GCRequests sharedManager] getRootWithCallback:^(NSDictionary *jsonData, NSError *error, NSString *rawData) {
        GingersnapUser* user = [GingersnapUser initWithUser:nil];
        user.auth_token = @"YOLO";
        CoreDataLog(user.auth_token, nil);
    } andHTTPRequestType:AUTOMATED];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
