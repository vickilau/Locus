//
//  VLProfileTableViewController.m
//  Locus
//
//  Created by Vicki Lau on 11/18/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import "VLProfileTableViewController.h"

@implementation VLProfileTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.currentUser = [PFUser currentUser];
    [self.aboutMeTextView setDelegate:self];
    [self.aboutMeField setEnabled:NO];
    [self.favActivitiesField setEnabled:NO];
    [self.favPlacesField setEnabled:NO];
    [self.favActivitiesTextView setDelegate:self];
    [self.favPlacesTextView setDelegate:self];
    [self.currentLocationButton setEnabled:NO];
    
    [self reloadTextFieldValues];
    [self disableTextFields];
}

- (void)saveProfileFields {
    [self disableTextFields];
    
    [self.currentUser setValue:[self.nameField text] forKey:[VLConstants kNameFieldKey]];
    [self.currentUser setValue:[self.genderField text] forKey:[VLConstants kGenderFieldKey]];
    [self.currentUser setValue:[self.ageField text] forKey:[VLConstants kAgeFieldKey]];
    [self.currentUser setValue:[self.homeLocationField text] forKey:[VLConstants kHomeLocationKey]];
    if (![[self.aboutMeTextView text] isEqualToString:[VLConstants kPlaceholderAboutMeString]]) {
        [self.currentUser setValue:[self.aboutMeTextView text] forKey:[VLConstants kAboutMeFieldKey]];
    }
    if (![[self.favActivitiesTextView text] isEqualToString:[VLConstants kPlaceholderFavActivitiesString]]) {
        [self.currentUser setValue:[self.favActivitiesTextView text] forKey:[VLConstants kFavActivitiesFieldKey]];
    }
    if (![[self.favPlacesTextView text] isEqualToString:[VLConstants kPlaceholderFavPlacesString]]) {
        [self.currentUser setValue:[self.favPlacesTextView text] forKey:[VLConstants kFavPlacesFieldKey]];
    }
    [self.currentUser saveInBackground];

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
    [self.currentLocationButton setEnabled:YES];
    
    [self.aboutMeTextView setEditable:YES];
    [self.favActivitiesTextView setEditable:YES];
    [self.favPlacesTextView setEditable:YES];
    
    [self redisplayTextFields];
}

- (void)reloadTextFieldValues {
    if ([self.currentUser objectForKey:[VLConstants kNameFieldKey]] && ![[self.currentUser objectForKey:[VLConstants kNameFieldKey]] isEqualToString:@""]) {
        [self.nameField setText:[self.currentUser objectForKey:[VLConstants kNameFieldKey]]];
    } else {
        [self.nameField setPlaceholder:[VLConstants kPlaceholderNameField]];
    }
    if ([self.currentUser objectForKey:[VLConstants kGenderFieldKey]] && ![[self.currentUser objectForKey:[VLConstants kGenderFieldKey]] isEqualToString:@""]) {
        [self.genderField setText:[self.currentUser objectForKey:[VLConstants kGenderFieldKey]]];
    } else {
        [self.genderField setPlaceholder:[VLConstants kPlaceholderGenderField]];
    }
    if ([self.currentUser objectForKey:[VLConstants kAgeFieldKey]] && ![[self.currentUser objectForKey:[VLConstants kAgeFieldKey]] isEqualToString:@""]) {
        [self.ageField setText:[self.currentUser objectForKey:[VLConstants kAgeFieldKey]]];
    } else {
        [self.ageField setPlaceholder:[VLConstants kPlaceholderAgeField]];
    }
    if ([self.currentUser objectForKey:[VLConstants kHomeLocationKey]] && ![[self.currentUser objectForKey:[VLConstants kHomeLocationKey]] isEqualToString:@""]) {
        [self.homeLocationField setText:[self.currentUser objectForKey:[VLConstants kHomeLocationKey]]];
    } else {
        [self.homeLocationField setPlaceholder:[VLConstants kPlaceholderHomeLocationField]];
    }
    if ([self.currentUser objectForKey:[VLConstants kAboutMeFieldKey]] && ![[self.currentUser objectForKey:[VLConstants kAboutMeFieldKey]] isEqualToString:@""]) {
        [self.aboutMeTextView setText:[self.currentUser objectForKey:[VLConstants kAboutMeFieldKey]]];
    } else {
        [self.aboutMeTextView setText:[VLConstants kPlaceholderAboutMeString]];
        [self.aboutMeTextView setTextColor:[UIColor lightGrayColor]];
    }
    if ([self.currentUser objectForKey:[VLConstants kFavActivitiesFieldKey]] && ![[self.currentUser objectForKey:[VLConstants kFavActivitiesFieldKey]] isEqualToString:@""]) {
        [self.favActivitiesTextView setText:[self.currentUser objectForKey:[VLConstants kFavActivitiesFieldKey]]];
    } else {
        [self.favActivitiesTextView setText:[VLConstants kPlaceholderFavActivitiesString]];
        [self.favActivitiesTextView setTextColor:[UIColor lightGrayColor]];
    }
    if ([self.currentUser objectForKey:[VLConstants kFavPlacesFieldKey]] && ![[self.currentUser objectForKey:[VLConstants kFavPlacesFieldKey]] isEqualToString:@""]) {
        [self.favPlacesTextView setText:[self.currentUser objectForKey:[VLConstants kFavPlacesFieldKey]]];
    } else {
        [self.favPlacesTextView setText:[VLConstants kPlaceholderFavPlacesString]];
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
    [self.currentLocationButton setEnabled:NO];
    
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
    if ([textView.text isEqualToString:[VLConstants kPlaceholderAboutMeString]] || [textView.text isEqualToString:[VLConstants kPlaceholderFavActivitiesString]] || [textView.text isEqualToString:[VLConstants kPlaceholderFavPlacesString]]) {
        NSLog(@"settingtext");
        [textView setText:@""];
        [textView setNeedsDisplay];
        [textView setTextColor:[UIColor blackColor]];
    }
    [textView becomeFirstResponder];
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    NSLog(@"textdidendediting");
    if ([textView.text isEqualToString:@""]) {
        if (textView == self.aboutMeTextView) {
            [textView setText:[VLConstants kPlaceholderAboutMeString]];
        } else if (textView == self.favActivitiesTextView) {
            [textView setText:[VLConstants kPlaceholderFavActivitiesString]];
        } else if (textView == self.favPlacesTextView) {
            [textView setText:[VLConstants kPlaceholderFavPlacesString]];
        }
        [textView setTextColor:[UIColor lightGrayColor]];
        [textView setNeedsDisplay];
    }
    [textView resignFirstResponder];
}

- (IBAction)useCurrentLocation:(id)sender {
    NSLog(@"useCurrentLocation");
    if (self.currentLocationButton.selected) {
        [self.currentLocationButton setSelected:NO];
    } else {
        [PFGeoPoint geoPointForCurrentLocationInBackground:^(PFGeoPoint *geoPoint, NSError *error) {
            if (!error) {
                NSLog(@"User's home location is at %f, %f", geoPoint.latitude, geoPoint.longitude);
                
                [self.currentUser setObject:geoPoint forKey:[VLConstants kHomeLocationKey]];
                [self.currentUser saveInBackground];
                [self.currentLocationButton setSelected:YES];
            }
        }];
    }
}
@end
