//
//  VLMainViewController.h
//  Locus
//
//  Created by Vicki Lau on 11/18/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "VLLoginViewController.h"
#import "VLSignupViewController.h"
#import "VLTabBarController.h"

@interface VLMainViewController : UIViewController <PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate>

@property BOOL firstTimeLogin;
@property BOOL firstTimeTab;
@property VLLoginViewController *loginVC;

@end
