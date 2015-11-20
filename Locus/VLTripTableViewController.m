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

@implementation VLTripTableViewController

- (instancetype)init {
    if (self = [super init]) {
        [self.budgetField setDelegate:self];
        [self.numAdultsField setDelegate:self];
        [self.numChildrenField setDelegate:self];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self reloadTextFieldValues];
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
    [user setValue:[self.budgetChoiceField titleForSegmentAtIndex:[self.budgetChoiceField selectedSegmentIndex]] forKey:kBudgetChoiceKey];
    
    [[PFUser currentUser] saveInBackground];
    
    [self reloadTextFieldValues];
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


- (void)reloadTextFieldValues {
    PFUser *user = [PFUser currentUser];
    if ([user objectForKey:kCountryFieldKey] && ![[user objectForKey:kCountryFieldKey] isEqualToString:@""]) {
        [self.countryField setText:[user objectForKey:kCountryFieldKey]];
    } else {
        [self.countryField setPlaceholder:@"United States"];
    }
    if ([user objectForKey:kCityFieldKey] && ![[user objectForKey:kCityFieldKey] isEqualToString:@""]) {
        [self.cityField setText:[user objectForKey:kCityFieldKey]];
    } else {
        [self.cityField setPlaceholder:@"Los Angeles"];
    }
    if ([user objectForKey:kStartDateFieldKey] && ![[user objectForKey:kStartDateFieldKey] isEqualToString:@""]) {
        [self.startDateField setText:[user objectForKey:kStartDateFieldKey]];
    } else {
        [self.startDateField setPlaceholder:@"10/16/2015"];
    }
    if ([user objectForKey:kEndDateFieldKey] && ![[user objectForKey:kEndDateFieldKey] isEqualToString:@""]) {
        [self.endDateField setText:[user objectForKey:kEndDateFieldKey]];
    } else {
        [self.endDateField setPlaceholder:@"1/1/2016"];
    }
    if ([user objectForKey:kBudgetFieldKey] && ![[user objectForKey:kBudgetFieldKey] isEqualToString:@""]) {
        [self.budgetField setText:[user objectForKey:kBudgetFieldKey]];
    } else {
        [self.budgetField setPlaceholder:@"500"];
    }
    if ([user objectForKey:kNumChildrenField] && ![[user objectForKey:kNumChildrenField] isEqualToString:@""]) {
        [self.numChildrenField setText:[user objectForKey:kNumChildrenField]];
    } else {
        [self.numChildrenField setPlaceholder:@"0"];
    }
    if ([user objectForKey:kNumAdultsField] && ![[user objectForKey:kNumAdultsField] isEqualToString:@""]) {
        [self.numAdultsField setText:[user objectForKey:kNumAdultsField]];
    } else {
        [self.numAdultsField setPlaceholder:@"3"];
    }
    
    /*if ([user objectForKey:kCurrencyChoiceFieldKey]) { //not working
        [self.currencyChoiceField setSelectedSegmentIndex:[self segmentIndexForBudgetChoice:[user objectForKey:kCurrencyChoiceFieldKey]]];
    } else {
        [self.currencyChoiceField setSelectedSegmentIndex:0];
    }
    if ([user objectForKey:kBudgetChoiceKey]) { //not working
        [self.budgetChoiceField setSelectedSegmentIndex:[self segmentIndexForCurrency:[user objectForKey:kBudgetChoiceKey]]];
    } else {
        [self.budgetChoiceField setSelectedSegmentIndex:0];
    }*/
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

- (BOOL)textField: (UITextField *)textField shouldChangeCharactersInRange: (NSRange)range replacementString: (NSString *)string {
    NSLog(@"being called");
    if (textField == self.budgetField || textField == self.numChildrenField || textField == self.numAdultsField) {
        unichar c = [string characterAtIndex:0];
        if ([[NSCharacterSet decimalDigitCharacterSet] characterIsMember:c]) {
            return YES;
        } else {
            return NO;
        }
    }
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    NSLog(@"textFieldShouldEndEditing called");
    if (textField == self.startDateField || textField == self.endDateField) {
        NSString *regEx = @"^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$";
        NSRange r = [textField.text rangeOfString:regEx options:NSRegularExpressionSearch];
        if (r.location == NSNotFound) {
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Invalid Date Format"
                                                                           message:@"Please Input Valid Date"
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {}];
            
            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];
            return NO;
        }
    }
    return YES;
}

- (IBAction)useCurrentLocation:(id)sender {
}

- (IBAction)numChildrenStepper:(id)sender {
}

- (IBAction)numAdultsStepper:(id)sender {
}
   
- (NSInteger)segmentIndexForCurrency:(NSString *) currency {
    if ([currency isEqualToString:@"$"]) {
        return 0;
    } else if ([currency isEqualToString:@"€"]) {
        return 1;
    } else if ([currency isEqualToString:@"£"]) {
        return 2;
    } else if ([currency isEqualToString:@"¥"]) {
        return 3;
    } else if ([currency isEqualToString:@"₩"]) {
        return 4;
    } else if ([currency isEqualToString:@"₹"]) {
        return 5;
    }
    return -1;
}

- (NSInteger)segmentIndexForBudgetChoice:(NSString *) budgetChoice {
    NSLog(@"hello");
    if ([budgetChoice isEqualToString:@"Entire Trip"]) {
        return 0;
    } else if ([budgetChoice isEqualToString:@"Per Day"]) {
        return 1;
    }
    return -1;
}

@end
