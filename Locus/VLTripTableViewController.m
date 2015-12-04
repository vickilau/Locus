//
//  VLTripTableViewController.m
//  Locus
//
//  Created by Vicki Lau on 11/19/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import "VLTripTableViewController.h"

@implementation VLTripTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.budgetChoiceField setCenter:CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2)];
    
    self.currentUser = [PFUser currentUser];
    [self.budgetField setDelegate:self];
    [self.numAdultsField setDelegate:self];
    [self.numChildrenField setDelegate:self];
    [self.currentLocation setEnabled:NO];
    [self.childrenStepper setEnabled:NO];
    [self.adultStepper setEnabled:NO];
    [self.startDateField setUserInteractionEnabled:NO];
    [self.endDateField setUserInteractionEnabled:NO];
    [self.currentLocation setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    [self.startDateField setMinimumDate:[NSDate date]];
    self.oldAdultsValue = 0;
    self.oldChildrenValue = 0;
    
    [self reloadTextFieldValues];
    [self disableTextFields];
}

- (void)saveTripFields {
    [self disableTextFields];
    
    [self.currentUser setValue:[self.countryField text] forKey:[VLConstants kCountryFieldKey]];
    [self.currentUser setValue:[self.cityField text] forKey:[VLConstants kCityFieldKey]];
    [self.currentUser setValue:[self.startDateField date] forKey:[VLConstants kStartDateFieldKey]];
    [self.currentUser setValue:[self.endDateField date] forKey:[VLConstants kEndDateFieldKey]];
    [self.currentUser setValue:[self.budgetField text] forKey:[VLConstants kBudgetFieldKey]];
    [self.currentUser setValue:[self.numChildrenField text] forKey:[VLConstants kNumChildrenField]];
    [self.currentUser setValue:[self.numAdultsField text] forKey:[VLConstants kNumAdultsField]];

    [self.currentUser setValue:[self.currencyChoiceField titleForSegmentAtIndex:[self.currencyChoiceField selectedSegmentIndex]] forKey:[VLConstants kCurrencyChoiceFieldKey]];
    [self.currentUser setValue:[self.budgetChoiceField titleForSegmentAtIndex:[self.budgetChoiceField selectedSegmentIndex]] forKey:[VLConstants kBudgetChoiceKey]];
    
    [self.currentUser saveInBackground];
    
    [self reloadTextFieldValues];
    [self redisplayTextFields];
}

- (void)editTripFields {
    [self.countryField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.cityField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.budgetField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.numChildrenField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.numAdultsField setBorderStyle:UITextBorderStyleRoundedRect];

    [self.countryField setEnabled:YES];
    [self.cityField setEnabled:YES];
    [self.currencyChoiceField setEnabled:YES];
    [self.budgetField setEnabled:YES];
    [self.budgetChoiceField setEnabled:YES];
    [self.numChildrenField setEnabled:YES];
    [self.numAdultsField setEnabled:YES];    
    [self.currentLocation setEnabled:YES];
    [self.childrenStepper setEnabled:YES];
    [self.adultStepper setEnabled:YES];
    [self.startDateField setUserInteractionEnabled:YES];
    [self.endDateField setUserInteractionEnabled:YES];

    [self redisplayTextFields];
}


- (void)reloadTextFieldValues {
    if ([self.currentUser objectForKey:[VLConstants kCountryFieldKey]] && ![[self.currentUser objectForKey:[VLConstants kCountryFieldKey]] isEqualToString:@""]) {
        [self.countryField setText:[self.currentUser objectForKey:[VLConstants kCountryFieldKey]]];
    } else {
        [self.countryField setPlaceholder:@"United States"];
    }
    if ([self.currentUser objectForKey:[VLConstants kCityFieldKey]] && ![[self.currentUser objectForKey:[VLConstants kCityFieldKey]] isEqualToString:@""]) {
        [self.cityField setText:[self.currentUser objectForKey:[VLConstants kCityFieldKey]]];
    } else {
        [self.cityField setPlaceholder:@"Los Angeles"];
    }
    if ([self.currentUser objectForKey:[VLConstants kStartDateFieldKey]]) {
        [self.startDateField setDate:[self.currentUser objectForKey:[VLConstants kStartDateFieldKey]]];
    }
    if ([self.currentUser objectForKey:[VLConstants kEndDateFieldKey]]) {
        [self.endDateField setDate:[self.currentUser objectForKey:[VLConstants kEndDateFieldKey]]];
    }
    if ([self.currentUser objectForKey:[VLConstants kBudgetFieldKey]] && ![[self.currentUser objectForKey:[VLConstants kBudgetFieldKey]] isEqualToString:@""]) {
        [self.budgetField setText:[self.currentUser objectForKey:[VLConstants kBudgetFieldKey]]];
    } else {
        [self.budgetField setPlaceholder:@"500"];
    }
    if ([self.currentUser objectForKey:[VLConstants kNumChildrenField]] && ![[self.currentUser objectForKey:[VLConstants kNumChildrenField]] isEqualToString:@""]) {
        [self.numChildrenField setText:[self.currentUser objectForKey:[VLConstants kNumChildrenField]]];
    } else {
        [self.numChildrenField setPlaceholder:@"0"];
    }
    if ([self.currentUser objectForKey:[VLConstants kNumAdultsField]] && ![[self.currentUser objectForKey:[VLConstants kNumAdultsField]] isEqualToString:@""]) {
        [self.numAdultsField setText:[self.currentUser objectForKey:[VLConstants kNumAdultsField]]];
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
    [self.budgetField setBorderStyle:UITextBorderStyleNone];
    [self.numChildrenField setBorderStyle:UITextBorderStyleNone];
    [self.numAdultsField setBorderStyle:UITextBorderStyleNone];
    
    [self.countryField setEnabled:NO];
    [self.cityField setEnabled:NO];
    [self.currentLocation setEnabled:NO];
    [self.currencyChoiceField setEnabled:NO];
    [self.budgetField setEnabled:NO];
    [self.budgetChoiceField setEnabled:NO];
    [self.numChildrenField setEnabled:NO];
    [self.numAdultsField setEnabled:NO];
    [self.childrenStepper setEnabled:NO];
    [self.adultStepper setEnabled:NO];
    [self.startDateField setUserInteractionEnabled:NO];
    [self.endDateField setUserInteractionEnabled:NO];
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

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    if (textField == self.budgetField || textField == self.numChildrenField || textField == self.numAdultsField) {
        NSCharacterSet *alphaNums = [NSCharacterSet decimalDigitCharacterSet];
        NSCharacterSet *inStringSet = [NSCharacterSet characterSetWithCharactersInString:textField.text];
        if ([alphaNums isSupersetOfSet:inStringSet]) {
            return YES;
        } else {
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Invalid Number Format"
                                                                           message:@"Please input valid number"
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
    NSLog(@"useCurrentLocation");
    if (self.currentLocation.selected) {
        [self.currentLocation setSelected:NO];
    } else {
        [PFGeoPoint geoPointForCurrentLocationInBackground:^(PFGeoPoint *geoPoint, NSError *error) {
            if (!error) {
                NSLog(@"User's trip location is at %f, %f", geoPoint.latitude, geoPoint.longitude);
                
                [self.currentUser setObject:geoPoint forKey:[VLConstants kTripLocationKey]];
                [self.currentUser saveInBackground];
                [self.currentLocation setSelected:YES];
            }
        }];
    }
}

- (IBAction)numChildrenStepper:(id)sender {
    UIStepper *stepper = (UIStepper *)sender;
    NSInteger numChildren = [self.numChildrenField.text integerValue];
    if (stepper.value > self.oldChildrenValue) {
        self.numChildrenField.text =  [NSString stringWithFormat: @"%ld", (long)(numChildren + 1)];
        self.oldChildrenValue = stepper.value;
    } else {
        if (numChildren != 0) {
            self.numChildrenField.text =  [NSString stringWithFormat: @"%ld", (long)(numChildren - 1)];
            self.oldChildrenValue = stepper.value;
        }
    }
}

- (IBAction)numAdultsStepper:(id)sender {
    UIStepper *stepper = (UIStepper *)sender;
    NSInteger numAdults = [self.numAdultsField.text integerValue];
    if (stepper.value > self.oldAdultsValue) {
        self.numAdultsField.text =  [NSString stringWithFormat: @"%ld", (long)(numAdults + 1)];
        self.oldAdultsValue = stepper.value;
    } else {
        if (numAdults != 0) {
            self.numAdultsField.text =  [NSString stringWithFormat: @"%ld", (long)(numAdults - 1)];
            self.oldAdultsValue = stepper.value;
        }
    }
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
