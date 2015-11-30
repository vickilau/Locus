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

#import "VLConstants.h"

@interface VLTripTableViewController : UITableViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIDatePicker *startDateField;
@property (weak, nonatomic) IBOutlet UIDatePicker *endDateField;

@property (weak, nonatomic) IBOutlet UITextField *countryField;
@property (weak, nonatomic) IBOutlet UITextField *cityField;
@property (weak, nonatomic) IBOutlet UITextField *budgetField;
@property (weak, nonatomic) IBOutlet UITextField *numChildrenField;
@property (weak, nonatomic) IBOutlet UITextField *numAdultsField;

@property (weak, nonatomic) IBOutlet UISegmentedControl *currencyChoiceField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *budgetChoiceField;

@property (weak, nonatomic) IBOutlet UIButton *currentLocation;

@property (weak, nonatomic) PFUser *currentUser;

@property (weak, nonatomic) IBOutlet UIStepper *childrenStepper;
@property (weak, nonatomic) IBOutlet UIStepper *adultStepper;
@property (nonatomic) double oldChildrenValue;
@property (nonatomic) double oldAdultsValue;

- (IBAction)useCurrentLocation:(id)sender;
- (IBAction)numChildrenStepper:(id)sender;
- (IBAction)numAdultsStepper:(id)sender;

- (void)saveTripFields;

- (void)editTripFields;

- (void)disableTextFields;

- (void)redisplayTextFields;

- (NSInteger)segmentIndexForCurrency:(NSString *) currency;


@end
