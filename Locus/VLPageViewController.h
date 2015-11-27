//
//  VLPageViewController.h
//  Locus
//
//  Created by Vicki Lau on 11/24/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <Parse/Parse.h>

#import "VLConnectLocalsErrorViewController.h"
#import "VLProfileTableViewController.h"
#import "VLTripTableViewController.h"
#import "VLQuizViewController.h"
#import "VLTravelStyleViewController.h"
#import "VLLocalTableViewController.h"
#import "VLUtilities.h"

@interface VLPageViewController : UIViewController <VLQuizViewControllerDelegate>

@property (nonatomic, strong) VLProfileTableViewController *profileTVC;
@property (nonatomic, strong) VLTravelStyleViewController *travelStyleTVC;
@property (nonatomic, strong) VLQuizViewController *quizVC;
@property (nonatomic, strong) VLTripTableViewController *tripTVC;
@property (nonatomic, strong) VLLocalTableViewController *localTVC;
@property (nonatomic, strong) VLConnectLocalsErrorViewController *connectLocalsErrorVC;
@property (nonatomic, strong) UINavigationController *connectLocalsNC;

@property (nonatomic, strong) UIImageView *profilePicView;
@property (nonatomic, strong) UIButton *actionButton;
@property (nonatomic, strong) UIButton *logoutButton;
@property (nonatomic, strong) UILabel *pageTitle;

@property (nonatomic, strong) PFUser *currentUser;

@end
