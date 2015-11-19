//
//  VLTripTableViewController.h
//  Locus
//
//  Created by Vicki Lau on 11/19/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <UIKit/UIKit.h>

@interface VLTripTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UITextField *countryField;
@property (weak, nonatomic) IBOutlet UITextField *cityField;
@property (weak, nonatomic) IBOutlet UITextField *startDateField;
@property (weak, nonatomic) IBOutlet UITextField *endDateField;
@property (weak, nonatomic) IBOutlet UITextField *budgetField;
@property (weak, nonatomic) IBOutlet UITextField *numChildrenField;
@property (weak, nonatomic) IBOutlet UITextField *numAdultsField;

@property (weak, nonatomic) IBOutlet UISegmentedControl *currencyChoiceField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *budgetChoiceField;

- (IBAction)useCurrentLocation:(id)sender;

- (void)saveTripFields;

- (void)editTripFields;

- (void)disableTextFields;

- (void)redisplayTextFields;

@end
