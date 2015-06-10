//
//  ScheduleNotificationsTableViewController.m
//  Internet Usage
//
//  Created by Harsh Sapra on 10/05/15.
//  Copyright (c) 2015 Harsh Sapra. All rights reserved.
//

#import "ScheduleNotificationsTableViewController.h"

@interface ScheduleNotificationsTableViewController ()

@end

@implementation ScheduleNotificationsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    if([[[NSUserDefaults standardUserDefaults] stringForKey:@"isNotificationOn"] isEqualToString:@"True"]) {
        [self.notificationSwitch setOn:YES];
        [self notificationSwitchChanged:self.notificationSwitch];
    }
 
    self.saveButton.layer.cornerRadius = 2;
    self.saveButton.layer.borderWidth = 2;
    self.saveButton.layer.borderColor = [UIColor whiteColor].CGColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}
*/
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)notificationSwitchChanged:(UISwitch *)sender {
    if(sender.isOn) {
        [UIView transitionWithView:self.notificationView
                          duration:1.0
                           options:UIViewAnimationOptionTransitionCrossDissolve
                        animations:NULL
                        completion:NULL];
        self.notificationView.hidden = NO;
    }
    else {
        [UIView transitionWithView:self.notificationView
                          duration:1.0
                           options:UIViewAnimationOptionTransitionCrossDissolve
                        animations:NULL
                        completion:NULL];
        self.notificationView.hidden = YES;
        [[UIApplication sharedApplication] cancelAllLocalNotifications];
        [[NSUserDefaults standardUserDefaults] setObject:@"False" forKey:@"isNotificationOn"];
    }
}

- (IBAction)saveButtonPressed:(UIButton *)sender {
    // To get date from timePicker
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    NSDate *dateFromTimePicker = self.timePicker.date;
    
    NSDateComponents *dateComponents = [calendar components:( NSCalendarUnitYear| NSCalendarUnitMonth |  NSCalendarUnitDay ) fromDate:dateFromTimePicker];
    NSDateComponents *timeComponents = [calendar components:( NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond) fromDate:dateFromTimePicker];
    
    NSDateComponents *dateComps = [[NSDateComponents alloc] init];
    [dateComps setDay:[dateComponents day]];
    [dateComps setMonth:[dateComponents month]];
    [dateComps setYear:[dateComponents year]];
    [dateComps setHour:[timeComponents hour]];
    [dateComps setMinute:[timeComponents minute]];
    [dateComps setSecond:0];
    NSDate *itemDate = [calendar dateFromComponents:dateComps];
    NSLog(@"itemDate: %@", itemDate);

    NSString *notificationString = [NSString stringWithFormat:@"%ld:%ld", (long)timeComponents.hour, (long)timeComponents.minute];
    NSLog(@"%@", notificationString);
    
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    
    localNotification.fireDate = itemDate;
    localNotification.timeZone = [NSTimeZone localTimeZone];
    localNotification.alertBody = @"Time to check your internet usage!";
    localNotification.alertAction = @"View";
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    localNotification.applicationIconBadgeNumber = 1;
    localNotification.repeatInterval = NSWeekCalendarUnit;
    //localNotification.repeatInterval = NSCalendarUnitDay;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    
    [[NSUserDefaults standardUserDefaults] setObject:@"True" forKey:@"isNotificationOn"];
}

@end
