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
NSString * const kDefaultString = @"";

@implementation VLProfileTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self disableTextFields];
    PFUser *user = [PFUser currentUser];
    if ([user objectForKey:kNameFieldKey]) {
        [self.nameField setText:[user objectForKey:kNameFieldKey]];
    } else {
        [self.nameField setText:kDefaultString];
    }
    if ([user objectForKey:kGenderFieldKey]) {
        [self.genderField setText:[user objectForKey:kGenderFieldKey]];
    } else {
        [self.genderField setText:kDefaultString];
    }
    if ([user objectForKey:kAgeFieldKey]) {
        [self.ageField setText:[user objectForKey:kAgeFieldKey]];
    } else {
        [self.ageField setText:kDefaultString];
    }
    if ([user objectForKey:kHomeLocationKey]) {
        [self.homeLocationField setText:[user objectForKey:kHomeLocationKey]];
    } else {
        [self.homeLocationField setText:kDefaultString];
    }
    if ([user objectForKey:kAboutMeFieldKey]) {
        [self.aboutMeField setText:[user objectForKey:kAboutMeFieldKey]];
    } else {
        [self.aboutMeField setText:kDefaultString];
    }
    if ([user objectForKey:kFavActivitiesFieldKey]) {
        [self.favActivitiesField setText:[user objectForKey:kFavActivitiesFieldKey]];
    } else {
        [self.favActivitiesField setText:kDefaultString];
    }
    if ([user objectForKey:kFavPlacesFieldKey]) {
        [self.favPlacesField setText:[user objectForKey:kFavPlacesFieldKey]];
    } else {
        [self.favPlacesField setText:kDefaultString];
    }
}

- (IBAction)useCurrentLocation:(id)sender {
}

- (void)saveProfileFields {
    PFUser *user = [PFUser currentUser];
    [self disableTextFields];
    
    [user setValue:[self.nameField text] forKey:kNameFieldKey];
    [user setValue:[self.genderField text] forKey:kGenderFieldKey];
    [user setValue:[self.ageField text] forKey:kAgeFieldKey];
    [user setValue:[self.homeLocationField text] forKey:kHomeLocationKey];
    [user setValue:[self.aboutMeField text] forKey:kAboutMeFieldKey];
    [user setValue:[self.favActivitiesField text] forKey:kFavActivitiesFieldKey];
    [user setValue:[self.favPlacesField text] forKey:kFavPlacesFieldKey];
    [[PFUser currentUser] saveInBackground];

    [self redisplayTextFields];
}

- (void)editProfileFields {
    [self.nameField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.genderField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.ageField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.homeLocationField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.favActivitiesField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.favPlacesField setBorderStyle:UITextBorderStyleRoundedRect];


    [self.nameField setEnabled:YES];
    [self.genderField setEnabled:YES];
    [self.ageField setEnabled:YES];
    [self.homeLocationField setEnabled:YES];
    [self.favActivitiesField setEnabled:YES];
    [self.favPlacesField setEnabled:YES];
    [self.aboutMeField setEditable:YES];
    [self.aboutMeField setSelectable:YES];
    
    [self redisplayTextFields];
}

- (void)disableTextFields {
    [self.nameField setBorderStyle:UITextBorderStyleNone];
    [self.genderField setBorderStyle:UITextBorderStyleNone];
    [self.ageField setBorderStyle:UITextBorderStyleNone];
    [self.homeLocationField setBorderStyle:UITextBorderStyleNone];
    [self.favActivitiesField setBorderStyle:UITextBorderStyleNone];
    [self.favPlacesField setBorderStyle:UITextBorderStyleNone];
    
    [self.nameField setEnabled:NO];
    [self.genderField setEnabled:NO];
    [self.ageField setEnabled:NO];
    [self.homeLocationField setEnabled:NO];
    [self.favActivitiesField setEnabled:NO];
    [self.favPlacesField setEnabled:NO];
    [self.aboutMeField setEditable:NO];
    [self.aboutMeField setSelectable:NO];
}

- (void)redisplayTextFields {
    [self.nameField setNeedsDisplay];
    [self.genderField setNeedsDisplay];
    [self.ageField setNeedsDisplay];
    [self.homeLocationField setNeedsDisplay];
    [self.aboutMeField setNeedsDisplay];
    [self.favActivitiesField setNeedsDisplay];
    [self.favPlacesField setNeedsDisplay];
}

//- (IBAction)useCurrentLocation:(id)sender {
//}
@end
