//
//  DetailedUsageTableViewController.m
//  Internet Usage
//
//  Created by Harsh Sapra on 10/05/15.
//  Copyright (c) 2015 Harsh Sapra. All rights reserved.
//

#import "DetailedUsageTableViewController.h"

@interface DetailedUsageTableViewController ()

@end

@implementation DetailedUsageTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;    
    self.dslData = [[DSLData alloc] init];
    [self.dslData refreshData];
    
    [self connectingForData];
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

- (IBAction)refreshButtonPressed:(UIBarButtonItem *)sender {
    self.dslData = [[DSLData alloc] init];
    [self.dslData refreshData];
    [self connectingForData];
}

#pragma mark - Helper Methods

- (void)updateUI {
    self.dslIdLabel.text = self.dslData.dslId;
    self.dataLimitLabel.text = [NSString stringWithFormat:@"%.2f GB", self.dslData.dataLimit];
    self.availableBalanceLabel.text = [NSString stringWithFormat:@"%.2f GB", self.dslData.availableBalance];
    self.daysLeftLabel.text = [NSString stringWithFormat:@"%d days", self.dslData.numberOfDays];
    self.averageBalanceLabel.text = [NSString stringWithFormat:@"%.2f GB/day", self.dslData.averageBalance];
    self.cycleDateLabel.text = self.dslData.nextBillingCycle;
}

- (void)receivedDataNotification:(id)sender {
    //NSLog(@"receivedDataNotification called");
    if(self.dslData.transactionStatus == 0) {
        [self updateUI];
    }
    else if(self.dslData.transactionStatus == 2) {
        [self updateUI];
        [self showUIAlertWithMessage:self.dslData.transactionStatusString];
    }
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"ReceivedData" object:nil];
}

- (void)connectionFailedNotification:(id)sender {
    //NSLog(@"connectionFailedNotification called");
    [self updateUI];
    [self showUIAlertWithMessage:self.dslData.transactionStatusString];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"ConnectionFailed" object:nil];
}

- (void)connectingForData {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receivedDataNotification:) name:@"ReceivedData"
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(connectionFailedNotification:)
                                                 name:@"ConnectionFailed"
                                               object:nil];
    //NSLog(@"connectingForData called");
}

- (void)showUIAlertWithMessage:(NSString *)message {
    //NSLog(@"showUIAlertWithMessage called");
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Something went wrong!😕😕"
                                                    message:message
                                                   delegate:self
                                          cancelButtonTitle:@"Ok"
                                          otherButtonTitles:nil];
    [alert show];
}

@end
