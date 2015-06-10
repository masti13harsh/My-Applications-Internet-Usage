//
//  ScheduleNotificationsTableViewController.h
//  Internet Usage
//
//  Created by Harsh Sapra on 10/05/15.
//  Copyright (c) 2015 Harsh Sapra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScheduleNotificationsTableViewController : UITableViewController

// IBActions
- (IBAction)notificationSwitchChanged:(UISwitch *)sender;
- (IBAction)saveButtonPressed:(UIButton *)sender;

// IBOutlets
@property (strong, nonatomic) IBOutlet UISegmentedControl *dailyOrWeeklySegment;
@property (strong, nonatomic) IBOutlet UIView *notificationView;
@property (strong, nonatomic) IBOutlet UIDatePicker *timePicker;
@property (strong, nonatomic) IBOutlet UISwitch *notificationSwitch;
@property (strong, nonatomic) IBOutlet UIButton *saveButton;

@end
