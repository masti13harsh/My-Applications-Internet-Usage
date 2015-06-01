//
//  CurrentUsageTableViewController.h
//  Internet Usage
//
//  Created by Harsh Sapra on 17/05/15.
//  Copyright (c) 2015 Harsh Sapra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DSLData.h"
#import "MCPercentageDoughnutView.h"

@interface CurrentUsageTableViewController : UITableViewController <MCPercentageDoughnutViewDataSource>

// IBOutlets
@property (strong, nonatomic) IBOutlet UIView *circularPercentageView;
@property (strong, nonatomic) IBOutlet UILabel *dslIdLabel;
@property (strong, nonatomic) IBOutlet UILabel *availableBalanceLabel;
@property (strong, nonatomic) IBOutlet UILabel *daysLeftLabel;

// IBActions
- (IBAction)refreshButtonPressed:(UIBarButtonItem *)sender;

// Properties
@property (strong, nonatomic) DSLData *dslData;
@property (strong, nonatomic) MCPercentageDoughnutView *circularPercentage;

@end
