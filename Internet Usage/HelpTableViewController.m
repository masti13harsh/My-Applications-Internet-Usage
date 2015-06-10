//
//  HelpTableViewController.m
//  Internet Usage
//
//  Created by Harsh Sapra on 17/05/15.
//  Copyright (c) 2015 Harsh Sapra. All rights reserved.
//

#import "HelpTableViewController.h"

@interface HelpTableViewController ()

@end

@implementation HelpTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.customerCareDetails = [[CustomerCareDetails alloc] init];
    
    self.dslData = [[DSLData alloc] init];
    [self.dslData refreshData];
    
    [self connectingForData];
    
    self.stateTextField.tintColor = [UIColor clearColor];
    [self initializeStatePicker];
    self.cityTextField.tintColor = [UIColor clearColor];
    [self initializeCityPicker];
    
    self.selectedState = @"Select State";
    self.selectedCity = @"Select City";
    
    self.callButton.layer.cornerRadius = 2;
    self.callButton.layer.borderWidth = 2;
    self.callButton.layer.borderColor = [UIColor whiteColor].CGColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 2) {
        if(indexPath.row == 0) {
            [self.stateTextField becomeFirstResponder];
        }
        else if(indexPath.row == 1) {
            [self.cityTextField becomeFirstResponder];
        }
    }
}

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

- (IBAction)callButtonPressed:(UIButton *)sender {
    if(!([self.selectedState isEqualToString:@"Select State"] && [self.selectedCity isEqualToString:@"Select City"]))
    {
        //NSLog(@"%@", [self.cities objectForKey:self.selectedCity]);
        NSString *phNo = [self.cities objectForKey:self.selectedCity];
        NSURL *phoneUrl = [NSURL URLWithString:[NSString  stringWithFormat:@"telprompt:%@",phNo]];
        
        if ([[UIApplication sharedApplication] canOpenURL:phoneUrl]) {
            [[UIApplication sharedApplication] openURL:phoneUrl];
        } else
        {
            UIAlertView *calert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Call facility is not available!!!" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
            [calert show];
        }
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert"
                                                        message:@"Please select the state and city"
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
        [alert show];
    }
}

#pragma mark - Picker View Delegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if(pickerView.tag == 0) {
        return self.customerCareDetails.states[row];
    }
    else if(pickerView.tag == 1 && ![self.stateTextField.text isEqualToString:@"Select State"]) {
        NSArray *keys = [[self.cities allKeys] sortedArrayUsingComparator:
            ^NSComparisonResult(id obj1, id obj2){
            return [obj1 compare:obj2];
        }];
        return keys[row];
    }
    else
        return @"Please select the state";
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if(pickerView.tag == 0) {
        self.selectedState = self.customerCareDetails.states[row];
        self.selectedStateRow = row;
    }
    else if(pickerView.tag == 1 && ![self.stateTextField.text isEqualToString:@"Select State"]){
        NSArray *keys = [[self.cities allKeys] sortedArrayUsingComparator:
                         ^NSComparisonResult(id obj1, id obj2){
                             return [obj1 compare:obj2];
                         }];
        self.selectedCity = keys[row];
    }
}

#pragma mark - Picker View Delegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if(pickerView.tag == 0)
        return [self.customerCareDetails.states count];
    else if(pickerView.tag == 1 && ![self.stateTextField.text isEqualToString:@"Select State"]) {
        self.cities = self.customerCareDetails.cities[self.selectedStateRow];
        //NSLog(@"%@", self.cities);
        return [self.cities count];
    }
    else {
        return 1;
    }
}

#pragma mark - Helper Methods

- (void)updateUI {
    self.dslIdLabel.text = self.dslData.dslId;
    self.availableBalanceLabel.text = [NSString stringWithFormat:@"%.2f GB", self.dslData.availableBalance];
    self.daysLeftLabel.text = [NSString stringWithFormat:@"%d days", self.dslData.numberOfDays];
}

- (void)receivedDataNotification:(id)sender {
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
}

- (void)showUIAlertWithMessage:(NSString *)message {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Something went wrong!😕😕"
                                                    message:message
                                                   delegate:self
                                          cancelButtonTitle:@"Ok"
                                          otherButtonTitles:nil];
    [alert show];
}

#pragma mark - UIPicker initializations and handlers

- (void)initializeStatePicker {
    self.uiPickerViewForState = [[UIPickerView alloc] init];
    [self.uiPickerViewForState setDataSource: self];
    [self.uiPickerViewForState setDelegate: self];
    self.uiPickerViewForState.showsSelectionIndicator = YES;
    self.uiPickerViewForState.tag = 0;
    
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(doneToolbarButtonPressedForState)];
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancelToolbarButtonPressedForState)];
    UIBarButtonItem *flexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem *selectTitle = [[UIBarButtonItem alloc] initWithTitle:@"Select State" style:UIBarButtonItemStylePlain target:self action:nil];
    [selectTitle setTintColor:[UIColor blackColor]];
    [toolBar setItems:[NSArray arrayWithObjects:cancelButton, flexible, selectTitle, flexible, doneButton, nil]];
    
    UIView *pickerParentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 224)];
    [pickerParentView addSubview:self.uiPickerViewForState];
    [pickerParentView addSubview:toolBar];
    self.stateTextField.inputView = pickerParentView;
}

- (void)initializeCityPicker {
    self.uiPickerViewForCity = [[UIPickerView alloc] init];
    [self.uiPickerViewForCity setDataSource: self];
    [self.uiPickerViewForCity setDelegate: self];
    self.uiPickerViewForCity.showsSelectionIndicator = YES;
    self.uiPickerViewForCity.tag = 1;
    
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(doneToolbarButtonPressedForCity)];
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancelToolbarButtonPressedForCity)];
    UIBarButtonItem *flexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem *selectTitle = [[UIBarButtonItem alloc] initWithTitle:@"Select City" style:UIBarButtonItemStylePlain target:self action:nil];
    [selectTitle setTintColor:[UIColor blackColor]];
    [toolBar setItems:[NSArray arrayWithObjects:cancelButton, flexible, selectTitle, flexible, doneButton, nil]];
    
    UIView *pickerParentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 224)];
    [pickerParentView addSubview:self.uiPickerViewForCity];
    [pickerParentView addSubview:toolBar];
    self.cityTextField.inputView = pickerParentView;
}

- (void)doneToolbarButtonPressedForState {
    self.isStateSelected = YES;
    self.stateTextField.text = self.selectedState;
    if([self.selectedState  isEqualToString:@"Select State"]) {
        self.stateTextField.text = self.customerCareDetails.states[0];
    }
    [self.stateTextField resignFirstResponder];
    self.cityTextField.text = @"Select City";
    self.selectedCity = @"Select City";
    [self.uiPickerViewForCity reloadAllComponents];
}

- (void)cancelToolbarButtonPressedForState {
    [self.stateTextField resignFirstResponder];
}

- (void)doneToolbarButtonPressedForCity {
    self.isCitySelected = YES;
    if ([self.stateTextField.text isEqualToString:@"Select State"]) {
        self.cityTextField.text = @"Select City";
        self.selectedCity = @"Select City";
    }
    else {
        if([self.selectedCity isEqualToString:@"Select City"]) {
            NSLog(@"%@", self.cities);
            NSArray *keys = [[self.customerCareDetails.cities[self.selectedStateRow] allKeys] sortedArrayUsingComparator:
                             ^NSComparisonResult(id obj1, id obj2){
                                 return [obj1 compare:obj2];
                             }];
            NSLog(@"%@", keys[0]);
            self.selectedCity = keys[0];
            self.cityTextField.text = self.selectedCity;
        }
        else {
            self.cityTextField.text = self.selectedCity;
        }
    }
    [self.cityTextField resignFirstResponder];
}

- (void)cancelToolbarButtonPressedForCity {
    [self.cityTextField resignFirstResponder];
}

@end
