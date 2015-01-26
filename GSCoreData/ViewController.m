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
    [GingersnapSession sharedManager];
    //calling this implements some stuff on the main thread
    NSLog(@"main thread: %@", [NSThread mainThread]);
//    dispatch_async([GingersnapSession sharedManager].coreDataQueue, ^{
//            [MyEntity initWithCallback:^(IAThreadSafeManagedObject *object) {
//            NSLog(@"coredataQueueThread: %@", [NSThread currentThread]);
//
//            MyEntity* entity  = (MyEntity*)object;
//            entity.attributeA = [NSNumber numberWithDouble:0.12];
//            entity.attributeB = [NSDate date];
//            entity.attributeC = @"WINNY";
//            NSLog(@"currentAfterSetterThread: %@", [NSThread currentThread]);
//
//            NSLog(@"a: %@", entity.attributeA);
//            NSLog(@"b: %@", entity.attributeB);
//            NSLog(@"c: %@", entity.attributeC);
//            NSLog(@"currentAfterGetterThread: %@", [NSThread currentThread]);
//        }];
//    });
    
    
    
        NSLog(@"coredataQueueThread: %@", [NSThread currentThread]);
    
        NSNumber* identifier = [NSNumber numberWithInt:7];
        MyEntity* entity  = [MyEntity initWithIdentifier:identifier];
        entity.attributeB = [NSDate date];
        entity.attributeC = @"WINNY";
        NSLog(@"currentAfterSetterThread: %@", [NSThread currentThread]);
        dispatch_async([GingersnapSession sharedManager].coreDataQueue, ^{

        NSLog(@"a: %@", entity.identifier);
        NSLog(@"b: %@", entity.attributeB);
        NSLog(@"c: %@", entity.attributeC);
        NSLog(@"currentAfterGetterThread: %@", [NSThread currentThread]);
        });
   

    NSLog(@"endThread: %@", [NSThread currentThread]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
