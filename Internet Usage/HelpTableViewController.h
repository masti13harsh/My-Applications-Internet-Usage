//
//  HelpTableViewController.h
//  Internet Usage
//
//  Created by Harsh Sapra on 17/05/15.
//  Copyright (c) 2015 Harsh Sapra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DSLData.h"
#import "CustomerCareDetails.h"

@interface HelpTableViewController : UITableViewController <UIPickerViewDataSource, UIPickerViewDelegate>

// IBOutlets
@property (strong, nonatomic) IBOutlet UILabel *dslIdLabel;
@property (strong, nonatomic) IBOutlet UILabel *availableBalanceLabel;
@property (strong, nonatomic) IBOutlet UILabel *daysLeftLabel;
@property (strong, nonatomic) IBOutlet UITextField *stateTextField;
@property (strong, nonatomic) IBOutlet UITextField *cityTextField;

// IBActions
- (IBAction)callButtonPressed:(UIButton *)sender;

// Properties
@property (strong, nonatomic) DSLData *dslData;
@property (strong, nonatomic) CustomerCareDetails *customerCareDetails;
@property (strong, nonatomic) NSString *selectedState;
@property (strong, nonatomic) NSString *selectedCity;
@property (strong, nonatomic) UIPickerView *uiPickerViewForState;
@property(strong, nonatomic) UIPickerView *uiPickerViewForCity;
@property (nonatomic) BOOL isStateSelected;
@property (nonatomic) BOOL isCitySelected;
@property (nonatomic) int selectedStateRow;
@property (strong, nonatomic) NSMutableDictionary *cities;

@end
