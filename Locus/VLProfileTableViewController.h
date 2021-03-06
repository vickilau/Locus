//
//  VLProfileTableViewController.h
//  Locus
//
//  Created by Vicki Lau on 11/18/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

#import "VLConstants.h"

@interface VLProfileTableViewController : UITableViewController <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *genderField;
@property (weak, nonatomic) IBOutlet UITextField *ageField;
@property (weak, nonatomic) IBOutlet UITextField *homeLocationField;
@property (weak, nonatomic) IBOutlet UITextField *aboutMeField;
@property (weak, nonatomic) IBOutlet UITextField *favActivitiesField;
@property (weak, nonatomic) IBOutlet UITextField *favPlacesField;


@property (weak, nonatomic) IBOutlet UITextView *aboutMeTextView;
@property (weak, nonatomic) IBOutlet UITextView *favActivitiesTextView;
@property (weak, nonatomic) IBOutlet UITextView *favPlacesTextView;
@property (weak, nonatomic) IBOutlet UIButton *currentLocationButton;

@property (strong, nonatomic) PFUser *currentUser;

- (IBAction)useCurrentLocation:(id)sender;

- (void)saveProfileFields;

- (void)editProfileFields;

- (void)disableTextFields;

- (void)reloadTextFieldValues;

- (void)redisplayTextFields;

@end
