//
//  VLProfileViewController.m
//  Locus
//
//  Created by Vicki Lau on 11/10/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import "VLProfileViewController.h"

@implementation VLProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.isEditing = NO;
    PFUser *user = [PFUser currentUser];
    if ([FBSDKAccessToken currentAccessToken]) {
        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:@{@"fields": @"id"}]
         startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
             if (!error) {
                 [user setObject:result[@"id"] forKey:@"facebookId"];
                 NSString *profilePictureURL = [NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large", result[@"id"]];
                 NSData *profilePictureData = [NSData dataWithContentsOfURL:[NSURL URLWithString:profilePictureURL]];
                 [self.profilePicView setImage:[UIImage imageWithData:profilePictureData]];
                 
                 [[PFUser currentUser] saveInBackground];
             }
         }];
    } else if ([user objectForKey:@"profilePic"]) {
        [self.profilePicView setImage:[user objectForKey:@"profilePic"]];
    } else {
        [self.profilePicView setImage:[UIImage imageNamed:@"defaultPic.png"]];
    }
    
    [self makeRound:self.profilePicView];
    [self makeRound:self.containerView];
    [self makeRound:self.profileTableVC.view];
    [self makeRound:self.editSaveToggleButton];
    [self makeRound:self.logoutButton];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.view.backgroundColor = [UIColor clearColor];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"ProfileTableViewSegue"]){
        self.profileTableVC = (VLProfileTableViewController *)segue.destinationViewController;
    }
}

- (IBAction)logoutButtonClicked:(id)sender {
    [PFUser logOut];
    
   //[self dismissViewControllerAnimated:NO completion:nil];
    
    VLLoginViewController *loginVC = [[VLLoginViewController alloc] init];
    [loginVC setFields:(PFLogInFieldsUsernameAndPassword
                        | PFLogInFieldsLogInButton
                        | PFLogInFieldsSignUpButton
                        | PFLogInFieldsPasswordForgotten
                        | PFLogInFieldsFacebook)];
    [loginVC setDelegate:self];
    PFSignUpViewController *signUpVC = [[PFSignUpViewController alloc] init];
    [signUpVC setDelegate:self];
    [loginVC setSignUpController:signUpVC];
    NSArray *permissions = @[@"public_profile", @"user_photos"];
    [loginVC setFacebookPermissions:permissions];
    [self presentViewController:loginVC animated:NO completion:nil];
    
    //[self.navigationController popToRootViewControllerAnimated:YES];
    
}

- (IBAction)toggleButtonClicked:(id)sender {
    self.isEditing = !self.isEditing;
    if (self.isEditing == YES) {
        [self.editSaveToggleButton setTitle:@"Save" forState:UIControlStateNormal];
        [self.profileTableVC editProfileFields];
    } else {
        [self.editSaveToggleButton setTitle:@"Edit" forState:UIControlStateNormal];
        [self.profileTableVC saveProfileFields];
    }
}

- (void)makeRound:(UIView *)view {
    [view.layer setMasksToBounds:YES];
    
    if (view == self.editSaveToggleButton || view == self.logoutButton) {
        [view.layer setCornerRadius:5.0f];
    } else {
        [view.layer setCornerRadius:30.0f];
    }
    // border
    [view.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [view.layer setBorderWidth:1.5f];
    
    // drop shadow
    [view.layer setShadowColor:[UIColor blackColor].CGColor];
    [view.layer setShadowOpacity:0.8];
    [view.layer setShadowRadius:3.0];
    [view.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
}
@end
