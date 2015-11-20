//
//  VLProfileTableViewController.m
//  Locus
//
//  Created by Vicki Lau on 11/18/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import "VLProfileTableViewController.h"

NSString * const kNameFieldKey = @"nameField";
NSString * const kGenderFieldKey = @"genderField";
NSString * const kAgeFieldKey = @"ageField";
NSString * const kHomeLocationKey = @"homeLocationField";
NSString * const kAboutMeFieldKey = @"aboutMeField";
NSString * const kFavActivitiesFieldKey = @"faveActivitiesField";
NSString * const kFavPlacesFieldKey = @"favePlacesField";
NSString * const kDefaultAboutMeString = @"Tell us about yourself";
NSString * const kDefaultFavPlacesString = @"#hiking #readingInCoffeeShops";
NSString * const kDefaultFavActivitiesString = @"#NicksCafe #EatonCanyon #SFFarmersMarket";


@implementation VLProfileTableViewController

- (instancetype) init {
    if (self = [super init]) {
        [self.aboutMeTextView setDelegate:self];
    }
    [self.aboutMeField setEnabled:NO];
    [self.favActivitiesField setEnabled:NO];
    [self.favPlacesField setEnabled:NO];

    return self;
}

- (void)viewDidLoad {
    [self reloadTextFieldValues];
    [self disableTextFields];
}

- (void)saveProfileFields {
    PFUser *user = [PFUser currentUser];
    [self disableTextFields];
    
    [user setValue:[self.nameField text] forKey:kNameFieldKey];
    [user setValue:[self.genderField text] forKey:kGenderFieldKey];
    [user setValue:[self.ageField text] forKey:kAgeFieldKey];
    [user setValue:[self.homeLocationField text] forKey:kHomeLocationKey];
    [user setValue:[self.aboutMeTextView text] forKey:kAboutMeFieldKey];
    [user setValue:[self.favActivitiesTextView text] forKey:kFavActivitiesFieldKey];
    [user setValue:[self.favPlacesTextView text] forKey:kFavPlacesFieldKey];
    [[PFUser currentUser] saveInBackground];

    [self reloadTextFieldValues];
    [self redisplayTextFields];
}

- (void)editProfileFields {
    [self.nameField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.genderField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.ageField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.homeLocationField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.aboutMeField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.favActivitiesField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.favPlacesField setBorderStyle:UITextBorderStyleRoundedRect];

    [self.nameField setEnabled:YES];
    [self.genderField setEnabled:YES];
    [self.ageField setEnabled:YES];
    [self.homeLocationField setEnabled:YES];
    
    [self.aboutMeTextView setEditable:YES];
    [self.favActivitiesTextView setEditable:YES];
    [self.favPlacesTextView setEditable:YES];
    
    [self redisplayTextFields];
}

- (void)reloadTextFieldValues {
    PFUser *user = [PFUser currentUser];
    if ([user objectForKey:kNameFieldKey] && ![[user objectForKey:kNameFieldKey] isEqualToString:@""]) {
        [self.nameField setText:[user objectForKey:kNameFieldKey]];
    } else {
        [self.nameField setPlaceholder:@"Locus"];
    }
    if ([user objectForKey:kGenderFieldKey] && ![[user objectForKey:kGenderFieldKey] isEqualToString:@""]) {
        [self.genderField setText:[user objectForKey:kGenderFieldKey]];
    } else {
        [self.genderField setPlaceholder:@"Female"];
    }
    if ([user objectForKey:kAgeFieldKey] && ![[user objectForKey:kAgeFieldKey] isEqualToString:@""]) {
        [self.ageField setText:[user objectForKey:kAgeFieldKey]];
    } else {
        [self.ageField setPlaceholder:@"28"];
    }
    if ([user objectForKey:kHomeLocationKey] && ![[user objectForKey:kHomeLocationKey] isEqualToString:@""]) {
        [self.homeLocationField setText:[user objectForKey:kHomeLocationKey]];
    } else {
        [self.homeLocationField setPlaceholder:@"Los Angeles, CA"];
    }
    if ([user objectForKey:kAboutMeFieldKey] && ![[user objectForKey:kAboutMeFieldKey] isEqualToString:@""]) {
        [self.aboutMeTextView setText:[user objectForKey:kAboutMeFieldKey]];
    } else {
        [self.aboutMeTextView setText:kDefaultAboutMeString];
        [self.aboutMeTextView setTextColor:[UIColor lightGrayColor]];
    }
    if ([user objectForKey:kFavActivitiesFieldKey] && ![[user objectForKey:kFavActivitiesFieldKey] isEqualToString:@""]) {
        [self.favActivitiesTextView setText:[user objectForKey:kFavActivitiesFieldKey]];
    } else {
        [self.favActivitiesTextView setText:kDefaultFavActivitiesString];
        [self.favActivitiesTextView setTextColor:[UIColor lightGrayColor]];
    }
    if ([user objectForKey:kFavPlacesFieldKey] && ![[user objectForKey:kFavPlacesFieldKey] isEqualToString:@""]) {
        [self.favPlacesTextView setText:[user objectForKey:kFavPlacesFieldKey]];
    } else {
        [self.favPlacesTextView setText:kDefaultFavPlacesString];
        [self.favPlacesTextView setTextColor:[UIColor lightGrayColor]];
    }
}

- (void)disableTextFields {
    [self.nameField setBorderStyle:UITextBorderStyleNone];
    [self.genderField setBorderStyle:UITextBorderStyleNone];
    [self.ageField setBorderStyle:UITextBorderStyleNone];
    [self.homeLocationField setBorderStyle:UITextBorderStyleNone];
    [self.aboutMeField setBorderStyle:UITextBorderStyleNone];
    [self.favActivitiesField setBorderStyle:UITextBorderStyleNone];
    [self.favPlacesField setBorderStyle:UITextBorderStyleNone];
    
    [self.nameField setEnabled:NO];
    [self.genderField setEnabled:NO];
    [self.ageField setEnabled:NO];
    [self.homeLocationField setEnabled:NO];
    
    [self.aboutMeTextView setEditable:NO];
    [self.favActivitiesTextView setEditable:NO];
    [self.favPlacesTextView setEditable:NO];
}

- (void)redisplayTextFields {
    [self.nameField setNeedsDisplay];
    [self.genderField setNeedsDisplay];
    [self.ageField setNeedsDisplay];
    [self.homeLocationField setNeedsDisplay];
    [self.aboutMeField setNeedsDisplay];
    [self.favActivitiesField setNeedsDisplay];
    [self.favPlacesField setNeedsDisplay];
    
    [self.aboutMeTextView setNeedsDisplay];
    [self.favActivitiesTextView setNeedsDisplay];
    [self.favPlacesTextView setNeedsDisplay];
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    NSLog(@"textdidbeginediting");
    if ([textView.text isEqualToString:kDefaultAboutMeString] || [textView.text isEqualToString:kDefaultFavActivitiesString] || [textView.text isEqualToString:kDefaultFavPlacesString]) {
        NSLog(@"settingtext");
        [textView setText:@""];
        [textView setNeedsDisplay];
        [textView setTextColor:[UIColor blackColor]];
    }
    [textView becomeFirstResponder];
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    if ([textView.text isEqualToString:@""]) {
        if (textView == self.aboutMeTextView) {
            [textView setText:kDefaultAboutMeString];
        } else if (textView == self.favActivitiesTextView) {
            [textView setText:kDefaultFavActivitiesString];
        } else if (textView == self.favPlacesTextView) {
            [textView setText:kDefaultFavPlacesString];
        }
        [textView setTextColor:[UIColor lightGrayColor]];
        [textView setNeedsDisplay];
    }
    [textView resignFirstResponder];
}

- (IBAction)useCurrentLocation:(id)sender {
}
@end
