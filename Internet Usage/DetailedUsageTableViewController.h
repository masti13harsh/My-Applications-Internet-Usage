//
//  DetailedUsageTableViewController.h
//  Internet Usage
//
//  Created by Harsh Sapra on 10/05/15.
//  Copyright (c) 2015 Harsh Sapra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DSLData.h"

@interface DetailedUsageTableViewController : UITableViewController

// IBOutlets
@property (strong, nonatomic) IBOutlet UILabel *dslIdLabel;
@property (strong, nonatomic) IBOutlet UILabel *dataLimitLabel;
@property (strong, nonatomic) IBOutlet UILabel *availableBalanceLabel;
@property (strong, nonatomic) IBOutlet UILabel *daysLeftLabel;
@property (strong, nonatomic) IBOutlet UILabel *averageBalanceLabel;
@property (strong, nonatomic) IBOutlet UILabel *cycleDateLabel;

// IBActions
- (IBAction)refreshButtonPressed:(UIBarButtonItem *)sender;

// Properties
@property (strong, nonatomic) DSLData *dslData;

@end
