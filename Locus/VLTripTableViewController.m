//
//  VLTripTableViewController.m
//  Locus
//
//  Created by Vicki Lau on 11/19/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import "VLTripTableViewController.h"

NSString * const kCountryFieldKey = @"countryField";
NSString * const kCityFieldKey = @"cityField";
NSString * const kStartDateFieldKey = @"startDateField";
NSString * const kEndDateFieldKey = @"endDateField";
NSString * const kCurrencyChoiceFieldKey = @"currencyChoiceField";
NSString * const kBudgetFieldKey = @"budgetField";
NSString * const kBudgetChoiceKey = @"budgetChoiceField";
NSString * const kNumChildrenField = @"numChildrenField";
NSString * const kNumAdultsField = @"numAdultsField";
//NSString * const kDefaultString = @"";

@implementation VLTripTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self disableTextFields];
}

- (void)saveTripFields {
    PFUser *user = [PFUser currentUser];
    [self disableTextFields];
    
    [user setValue:[self.countryField text] forKey:kCountryFieldKey];
    [user setValue:[self.cityField text] forKey:kCityFieldKey];
    [user setValue:[self.startDateField text] forKey:kStartDateFieldKey];
    [user setValue:[self.endDateField text] forKey:kEndDateFieldKey];
    [user setValue:[self.budgetField text] forKey:kBudgetFieldKey];
    [user setValue:[self.numChildrenField text] forKey:kNumChildrenField];
    [user setValue:[self.numAdultsField text] forKey:kNumAdultsField];

    [user setValue:[self.currencyChoiceField titleForSegmentAtIndex:[self.currencyChoiceField selectedSegmentIndex]] forKey:kCurrencyChoiceFieldKey];
    [user setValue:[self.budgetChoiceField titleForSegmentAtIndex:[self.budgetChoiceField selectedSegmentIndex]] forKey:kCurrencyChoiceFieldKey];
    
    [[PFUser currentUser] saveInBackground];
    [self redisplayTextFields];
}

- (void)editTripFields {
    [self.countryField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.cityField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.startDateField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.endDateField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.budgetField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.numChildrenField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.numAdultsField setBorderStyle:UITextBorderStyleRoundedRect];

    [self.countryField setEnabled:YES];
    [self.cityField setEnabled:YES];
    [self.startDateField setEnabled:YES];
    [self.endDateField setEnabled:YES];
    [self.currencyChoiceField setEnabled:YES];
    [self.budgetField setEnabled:YES];
    [self.budgetChoiceField setEnabled:YES];
    [self.numChildrenField setEnabled:YES];
    [self.numAdultsField setEnabled:YES];    
    
    [self redisplayTextFields];
}

- (void)disableTextFields {
    [self.countryField setBorderStyle:UITextBorderStyleNone];
    [self.cityField setBorderStyle:UITextBorderStyleNone];
    [self.startDateField setBorderStyle:UITextBorderStyleNone];
    [self.endDateField setBorderStyle:UITextBorderStyleNone];
    [self.budgetField setBorderStyle:UITextBorderStyleNone];
    [self.numChildrenField setBorderStyle:UITextBorderStyleNone];
    [self.numAdultsField setBorderStyle:UITextBorderStyleNone];
    
    [self.countryField setEnabled:NO];
    [self.cityField setEnabled:NO];
    [self.startDateField setEnabled:NO];
    [self.endDateField setEnabled:NO];
    [self.currencyChoiceField setEnabled:NO];
    [self.budgetField setEnabled:NO];
    [self.budgetChoiceField setEnabled:NO];
    [self.numChildrenField setEnabled:NO];
    [self.numAdultsField setEnabled:NO];
}

- (void)redisplayTextFields {
    [self.countryField setNeedsDisplay];
    [self.cityField setNeedsDisplay];
    [self.startDateField setNeedsDisplay];
    [self.endDateField setNeedsDisplay];
    [self.currencyChoiceField setNeedsDisplay];
    [self.budgetField setNeedsDisplay];
    [self.budgetChoiceField setNeedsDisplay];
    [self.numChildrenField setNeedsDisplay];
    [self.numAdultsField setNeedsDisplay];
}


- (IBAction)useCurrentLocation:(id)sender {
}

@end
