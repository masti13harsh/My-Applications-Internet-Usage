//
//  ViewController.m
//  Internet Usage
//
//  Created by Harsh Sapra on 04/05/15.
//  Copyright (c) 2015 Harsh Sapra. All rights reserved.
//

#import "ViewController.h"
#import "DSLData.h"
#import "CustomerCareDetails.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    DSLData *dslData = [[DSLData alloc] init];
    [dslData refreshData];
    
    CustomerCareDetails *customerCareDetails = [[CustomerCareDetails alloc] init];
    NSLog(@"***States***\n%@", customerCareDetails.states);
    NSLog(@"***Cities***\n%@", customerCareDetails.cities);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
