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
    self.firstTimeLogin = YES;
    self.firstTimeTab = YES;
    self.view.backgroundColor = [UIColor clearColor];
    self.loginVC = [[VLLoginViewController alloc] init];

}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (self.firstTimeLogin) {
        [self.loginVC setFields:(PFLogInFieldsUsernameAndPassword
                            | PFLogInFieldsLogInButton
                            | PFLogInFieldsSignUpButton
                            | PFLogInFieldsPasswordForgotten
                            | PFLogInFieldsFacebook)];
        [self.loginVC setDelegate:self];
        VLSignupViewController *signUpVC = [[VLSignupViewController alloc] init];
        [signUpVC setDelegate:self];
        [self.loginVC setSignUpController:signUpVC];
        NSArray *permissions = @[@"public_profile", @"user_photos"];
        [self.loginVC setFacebookPermissions:permissions];
        [self presentViewController:self.loginVC animated:YES completion:nil];
        self.firstTimeLogin = NO;
    }
}

- (void)viewDidLayoutSubviews {
    if ([PFUser currentUser] != nil && !self.firstTimeTab) {
        [self logInViewController:self.loginVC didLogInUser:[PFUser currentUser]];
    }
    self.firstTimeTab = NO;
}

- (void)logInViewController:(PFLogInViewController *)controller
               didLogInUser:(PFUser *)user {
    
    VLTabBarController *tabBC = [[VLTabBarController alloc] init];
    tabBC.view.frame = self.view.frame;
    [controller.view addSubview:tabBC.view];
    [controller addChildViewController:tabBC];
    [tabBC didMoveToParentViewController:controller];

}

- (void)signUpViewController:(PFSignUpViewController *)signUpController didSignUpUser:(PFUser *)user {
    VLTabBarController *tabBC = [[VLTabBarController alloc] init];
    tabBC.view.frame = self.view.frame;
    [signUpController.view addSubview:tabBC.view];
    [signUpController addChildViewController:tabBC];
    [tabBC didMoveToParentViewController:signUpController];
}

@end
