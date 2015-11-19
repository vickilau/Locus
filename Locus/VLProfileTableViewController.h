//
//  VLProfileTableViewController.h
//  Locus
//
//  Created by Vicki Lau on 11/18/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface VLProfileTableViewController : UITableViewController 

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *genderField;
@property (weak, nonatomic) IBOutlet UITextField *ageField;
@property (weak, nonatomic) IBOutlet UITextField *homeLocationField;
@property (weak, nonatomic) IBOutlet UITextView *aboutMeField;
@property (weak, nonatomic) IBOutlet UITextField *favActivitiesField;
@property (weak, nonatomic) IBOutlet UITextField *favPlacesField;

- (IBAction)useCurrentLocation:(id)sender;

- (void)saveProfileFields;

- (void)editProfileFields;

- (void)disableTextFields;

- (void)redisplayTextFields;

@end
