//
//  DSLData.h
//  Internet Usage
//
//  Created by Harsh Sapra on 04/05/15.
//  Copyright (c) 2015 Harsh Sapra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DSLData : NSObject <NSURLConnectionDataDelegate>
{
    NSMutableData *_responseData;
}

// Internal Properties
@property (strong, nonatomic) NSString *responseString;

// Properties
@property (strong, nonatomic) NSString *dslId;
@property (nonatomic) float dataLimit;
@property (nonatomic) float availableBalance;
@property (nonatomic) int numberOfDays;
@property (nonatomic) float averageBalance;
@property (nonatomic) float percentageOfDataConsumed;
@property (strong, nonatomic) NSString *nextBillingCycle;
@property (strong, nonatomic) NSString *transactionStatusString;
@property (nonatomic) int transactionStatus;

// Methods
- (void)refreshData;

@end
