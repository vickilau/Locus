//
//  VLMainViewController.m
//  Locus
//
//  Created by Vicki Lau on 11/18/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import "VLMainViewController.h"

@implementation VLMainViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    self.firstTime = YES;
    self.view.backgroundColor = [UIColor clearColor];
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (self.firstTime) {
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
        [self presentViewController:loginVC animated:YES completion:nil];
        self.firstTime = NO;
    }
}

- (void)logInViewController:(PFLogInViewController *)controller
               didLogInUser:(PFUser *)user {
    [self dismissViewControllerAnimated:YES completion:^{
        UITabBarController *tabBC = [self.storyboard instantiateViewControllerWithIdentifier:@"MyTabBarController"];
        [self presentViewController:tabBC animated:YES completion:nil];
    }];
}

- (void)signUpViewController:(PFSignUpViewController *)signUpController didSignUpUser:(PFUser *)user {
    [self dismissViewControllerAnimated:YES completion:^{
        UITabBarController *tabBC = [self.storyboard instantiateViewControllerWithIdentifier:@"MyTabBarController"];
        [self presentViewController:tabBC animated:YES completion:nil];
    }];
}

@end
