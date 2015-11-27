//
//  VLPageViewController.m
//  Locus
//
//  Created by Vicki Lau on 11/24/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import "VLPageViewController.h"

@implementation VLPageViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.currentUser = [PFUser currentUser];
    
    self.profileTVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MyProfileTableViewController"];
    self.tripTVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MyTripTableViewController"];
    self.quizVC = [[VLQuizViewController alloc] init];
    self.travelStyleTVC = [[VLTravelStyleViewController alloc] init];
    self.localTVC = [[VLLocalTableViewController alloc] init];
    self.connectLocalsErrorVC = [[VLConnectLocalsErrorViewController alloc] init];
    self.connectLocalsNC = [[UINavigationController alloc] initWithRootViewController:self.localTVC];
    [self.connectLocalsNC setToolbarHidden:YES];
    
    self.profilePicView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.logoutButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.pageTitle = [[UILabel alloc] initWithFrame:CGRectZero];
    self.actionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.actionButton addTarget:self action:@selector(actionButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.logoutButton setTitle:@"Logout" forState:UIControlStateNormal];
    [self.logoutButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [self.logoutButton setTitleColor:[UIColor colorWithRed:51.0/255.0 green:153.0/255.0 blue:1 alpha:1.0] forState:UIControlStateNormal];
    [self.logoutButton setBackgroundColor:[UIColor whiteColor]];
    
    [self.pageTitle setTextAlignment:NSTextAlignmentCenter];
    [self.pageTitle setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleTitle1]];
    
    [self.profilePicView setContentMode:UIViewContentModeTop];
    if ([FBSDKAccessToken currentAccessToken]) {
        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:@{@"fields": @"id"}]
         startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
             if (!error) {
                 [self.currentUser setObject:result[@"id"] forKey:@"facebookId"];
                 NSString *profilePictureURL = [NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large", result[@"id"]];
                 NSData *profilePictureData = [NSData dataWithContentsOfURL:[NSURL URLWithString:profilePictureURL]];
                 [self.profilePicView setImage:[UIImage imageWithData:profilePictureData]];
                 
                 [self.currentUser saveInBackground];
             }
         }];
    } else if ([self.currentUser objectForKey:@"profilePic"]) {
        [self.profilePicView setImage:[self.currentUser objectForKey:@"profilePic"]];
    } else {
        [self.profilePicView setImage:[UIImage imageNamed:@"defaultPic.png"]];
    }
    
    [VLUtilities makeRound:self.profilePicView];
    [VLUtilities makeRound:self.logoutButton];
    [VLUtilities makeRound:self.actionButton];
    
    [self.view setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:self.profilePicView];
    [self.view addSubview:self.actionButton];
    [self.view addSubview:self.logoutButton];
    [self.view addSubview:self.pageTitle];

}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    if ([self.tabBarItem.title isEqualToString:@"Profile"]) {
        [self setEditSaveButton];
        [self.pageTitle setText:@"My Profile"];
        [self setContainerViewController:self.profileTVC];
    } else if ([self.tabBarItem.title isEqualToString:@"Style"]) {
        [self setBuildStyleButton];
        [self.pageTitle setText:@"My Style"];
        if (!self.actionButton.selected) {
            [self setContainerViewController:self.travelStyleTVC];
        }
    } else if ([self.tabBarItem.title isEqualToString:@"Trip"]) {
        [self setEditSaveButton];
        [self.pageTitle setText:@"My Trip"];
        [self setContainerViewController:self.tripTVC];
    } else if ([self.tabBarItem.title isEqualToString:@"Connect"]) {
        [self.pageTitle setText:@"Connect"];
        [self.actionButton setHidden:YES];
        if ([self.currentUser objectForKey:@"cityField"] && [self.currentUser objectForKey:@"countryField"]) {
            [self setContainerViewController:self.connectLocalsNC];
        } else {
            [self setContainerViewController:self.connectLocalsErrorVC];
        }
    } else if ([self.tabBarItem.title isEqualToString:@"Itinerary"]) {
        [self.pageTitle setText:@"My Itinerary"];
    }
    [self setHeaderElementsLayout];
}

- (void)setHeaderElementsLayout {
    CGFloat center = CGRectGetWidth(self.view.bounds)/2;
    CGFloat rightCenter = (center - 30)/2;
    [self.profilePicView setFrame:CGRectMake(20, 20, fminf(140, center - 10), 120)];
    [self.actionButton setFrame: CGRectMake(center + rightCenter - 30, CGRectGetMaxY(self.profilePicView.frame) - 30, 60, 30)];
    [self.logoutButton  setFrame:CGRectMake(CGRectGetWidth(self.view.frame) - 10 - 55, 20, 60, 30)];
    [self.pageTitle setFrame:CGRectMake(center + rightCenter - 85, CGRectGetMaxY(self.logoutButton.frame) + 10, 170, 40)];
    
    [self.actionButton.titleLabel setFont:[UIFont systemFontOfSize:18]];
    [self.actionButton setTitleColor:[UIColor colorWithRed:51/255.0 green:153.0/255.0 blue:255.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [self.actionButton setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [self.actionButton setBackgroundColor:[UIColor colorWithRed:1 green:204.0/255.0 blue:204.0/255.0 alpha:1.0]];
}

- (void)setContainerViewController:(UIViewController *) viewController {
    [self addChildViewController:viewController];
    [viewController.view setFrame:CGRectMake(10, CGRectGetMaxY(self.profilePicView.frame) + 10, CGRectGetWidth(self.view.bounds) - 20, CGRectGetHeight(self.view.bounds) - CGRectGetMaxY(self.profilePicView.frame) - 20 - self.tabBarController.tabBar.frame.size.height)];
    [VLUtilities makeRound:viewController.view];
    
    [self.view addSubview:viewController.view];
    [viewController didMoveToParentViewController:self];
}

- (void)actionButtonClicked {
    [self.actionButton setSelected:!self.actionButton.selected];
    if ([self.tabBarItem.title isEqualToString:@"Style"]) {
        [self setBuildStyleViewController];
        return;
    }
    if (self.actionButton.selected == YES) {
        if ([self.tabBarItem.title isEqualToString:@"Profile"]) {
            [self.profileTVC editProfileFields];
        } else if ([self.tabBarItem.title isEqualToString:@"Trip"]) {
            [self.tripTVC editTripFields];
        }
    } else {
        if ([self.tabBarItem.title isEqualToString:@"Profile"]) {
            [self.profileTVC saveProfileFields];
        } else if ([self.tabBarItem.title isEqualToString:@"Trip"]) {
            [self.tripTVC saveTripFields];
        }
    }
}

- (void)setEditSaveButton {
    [self.actionButton setTitle:@"Edit" forState:UIControlStateNormal];
    [self.actionButton setTitle:@"Save" forState:UIControlStateSelected];
}

- (void)setBuildStyleButton {
    [self.actionButton setTitle:@"Build" forState:UIControlStateNormal];
    [self.actionButton setTitle:@"Cancel" forState:UIControlStateSelected];
}

- (void)setBuildStyleViewController {
    [self.travelStyleTVC.view removeFromSuperview];
    [self.travelStyleTVC removeFromParentViewController];
    [self.quizVC.view removeFromSuperview];
    [self.quizVC removeFromParentViewController];
    
    self.quizVC = [[VLQuizViewController alloc] init];
    [self.quizVC setDelegate:self];
    [self setContainerViewController:self.quizVC];
}

#pragma mark - VLQuizViewControllerDelegate

- (void)VLQuizViewControllerDidFinishQuiz {
    [self.actionButton setSelected:NO];
}

@end
