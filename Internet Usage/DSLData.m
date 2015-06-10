//
//  DSLData.m
//  Internet Usage
//
//  Created by Harsh Sapra on 04/05/15.
//  Copyright (c) 2015 Harsh Sapra. All rights reserved.
//

#import "DSLData.h"

@implementation DSLData 

- (id)init {
    self = [super init];
    
    if(self) {
        self.dslId = [NSString stringWithFormat:@""];
        self.dataLimit = 0.0;
        self.availableBalance = 0.0;
        self.numberOfDays = 0;
        self.averageBalance = 0.0;
        self.percentageOfDataConsumed = 0.0;
        self.nextBillingCycle = [NSString stringWithFormat:@""];
        self.transactionStatusString = [NSString stringWithFormat:@""];
        self.transactionStatus = 0;
    }
    
    return self;
}

- (void)refreshData {
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://122.160.230.125:8080/planupdate/"]];
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
}


#pragma mark - NSURLConnectionDataDelegate Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    _responseData = [[NSMutableData alloc]init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [_responseData appendData:data];
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection willCacheResponse:(NSCachedURLResponse *)cachedResponse {
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    self.responseString = [[NSString alloc] initWithData:_responseData encoding:NSUTF8StringEncoding];
    
    if([self isRequestCompleted]) {
        [self setAllTheProperties];
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ReceivedData" object:nil];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    self.transactionStatus = 1;
    self.transactionStatusString = [NSString stringWithFormat:@"Connection Failed! \nPlease make sure you are connected to airtel broadband network!"];
    
    
    // Testing purposes... Remove in prod
    [self testingSetAllTheProperties];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ConnectionFailed" object:nil];
    //NSLog(@"Connection failed in DSLData");
}

#pragma mark - Helper Methods

- (BOOL)isRequestCompleted {
    BOOL isRequestCompleted = TRUE;
    
    NSString *checkForTransactionError = [DSLData scanString:self.responseString startTag:@"Your request" endTag:@"some time!"];
    if([checkForTransactionError length] > 0) {
        isRequestCompleted = FALSE;
        self.transactionStatus = 2;
        self.transactionStatusString = [NSString stringWithFormat:@"Your request cannot be completed. Please try after some time!"];
        
        // Testing purposes... Remove in prod
        [self testingSetAllTheProperties];
    }
    
    return isRequestCompleted;
}

- (void)testingSetAllTheProperties {
    self.dslId = [NSString stringWithFormat:@"01141003552_d"];
    self.dataLimit = 125.00;
    self.availableBalance = 54.00;
    self.numberOfDays = 12;
    self.averageBalance = self.availableBalance / (self.numberOfDays + 1);
    self.percentageOfDataConsumed = ((self.dataLimit - self.availableBalance) / self.dataLimit) * 100;
    self.nextBillingCycle = [NSString stringWithFormat:@"15-JAN"];
}

- (void)setAllTheProperties {
    // DSL ID
    NSString *dslIdSpan = [DSLData scanString:self.responseString startTag:@"<div class=\"box-data-text\">DSL number: <br />" endTag:@"/div>"];
    self.dslId = [DSLData scanString:dslIdSpan startTag:@"<span>" endTag:@"</span>"];
    //NSLog(@"DSL ID: %@", self.dslId);
    
    // Data Limit
    NSString *dataLimitSpan = [DSLData scanString:self.responseString startTag:@"<div class=\"box-data-text\">High speed data limit:<br />" endTag:@"</div>"];
    self.dataLimit = [[DSLData scanString:dataLimitSpan startTag:@"<span>" endTag:@"GB"] floatValue];
    //NSLog(@"Data Limit: %f GB", self.dataLimit);
    
    // Available Balance
    NSString *availableBalanceSpan = [DSLData scanString:self.responseString startTag:@"<div class=\"box-data-text-first\">Available balance<br />" endTag:@"</span>"];
    self.availableBalance = [[DSLData scanString:availableBalanceSpan startTag:@"<span>" endTag:@" GB"] floatValue];
    //NSLog(@"Available Balance: %f GB", self.availableBalance);
    
    // Number of Days
    NSString *numberOfDaysSpan = [DSLData scanString:self.responseString startTag:@"<div class=\"box-data-text\">No. of days left in the current bill cycle:<br />" endTag:@"</div>"];
    self.numberOfDays = [[DSLData scanString:numberOfDaysSpan startTag:@"<span>" endTag:@" days</span>"] intValue];
    //NSLog(@"Number of Days: %d days", self.numberOfDays);
    
    // Average Balance
    self.averageBalance = self.availableBalance / (self.numberOfDays + 1);
    //NSLog(@"Average Balance: %f GB/day", self.averageBalance);
    
    // Percentage of Data Consumed
    self.percentageOfDataConsumed = ((self.dataLimit - self.availableBalance) / self.dataLimit) * 100;
    //NSLog(@"Percentage of Data Consumed: %f", self.percentageOfDataConsumed);
    
    // Next Billing Cycle Date
    NSDate *nextBillingCycleDate = [[NSDate alloc] initWithTimeIntervalSinceNow:86400 * (self.numberOfDays + 1)];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"dd-MMMM";
    self.nextBillingCycle = [formatter stringFromDate:nextBillingCycleDate];
}

+ (NSString *)scanString:(NSString *)string startTag:(NSString *)startTag endTag:(NSString *)endTag {
    NSString *scanString = @"";
    
    if(string.length > 0) {
        NSScanner *scanner = [[NSScanner alloc] initWithString:string];
        
        @try {
            [scanner scanUpToString:startTag intoString:nil];
            scanner.scanLocation += [startTag length];
            [scanner scanUpToString:endTag intoString:&scanString];
        }
        @catch (NSException *exception) {
            return nil;
        }
        @finally {
            return scanString;
        }
    }
    return scanString;
}


@end
