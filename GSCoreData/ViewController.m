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
    
    
    dispatch_async([GingersnapSession sharedManager].coreDataQueue, ^{
        for (int i = 0; i < 1; i++)
        {
            [GingersnapActivity initWithIdentifier:[NSNumber numberWithInt:i ] andCallback:^(id object) {
                
            }];
        }
    });
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
