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
    
    //dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (int i = 0; i < 10; i++)
        {
            [GingersnapConnection initWithIdentifier:[NSNumber numberWithInt:i ] andCallback:^(id object) {
                if ([NSThread currentThread] != [NSThread mainThread])
                {
                    abort();
                }
            }];
        }
    //});
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
