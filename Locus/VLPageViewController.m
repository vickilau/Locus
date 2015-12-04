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
    
    self.profileTVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"MyProfileTableViewController"];
    self.tripTVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"MyTripTableViewController"];
    self.quizVC = [[VLQuizViewController alloc] init];
    self.travelStyleTVC = [[VLTravelStyleViewController alloc] init];
    self.localTVC = [[VLLocalTableViewController alloc] init];
    self.itineraryTVC = [[VLItineraryTableViewController alloc] init];
    self.connectLocalsErrorVC = [[VLMessageViewController alloc] init];
    [self.connectLocalsErrorVC.message setText:[VLConstants kNeedLocationErrorMessage]];
    self.emptyItineraryMessageVC = [[VLMessageViewController alloc] init];
    [self.emptyItineraryMessageVC.message setText:[VLConstants kEmptyItineraryMessage]];
    self.connectLocalsNC = [[UINavigationController alloc] initWithRootViewController:self.localTVC];
    [self.connectLocalsNC setToolbarHidden:YES];
    
    self.profilePicView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.logoutButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.pageTitle = [[UILabel alloc] initWithFrame:CGRectZero];
    self.actionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.actionButton addTarget:self action:@selector(actionButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.logoutButton addTarget:self action:@selector(logoutButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
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
                 NSString *profilePictureURL = [NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large", result[@"id"]];
                 NSData *profilePictureData = [NSData dataWithContentsOfURL:[NSURL URLWithString:profilePictureURL]];
                 [self.profilePicView setImage:[UIImage imageWithData:profilePictureData]];
                 
                 [self.currentUser setObject:profilePictureData forKey:[VLConstants kFbPictureKey]];
                 
                 [self.currentUser saveInBackground];
             }
         }];
    } else if ([self.currentUser objectForKey:[VLConstants kProfilePicKey]]) {
        [self.profilePicView setImage:[self.currentUser objectForKey:[VLConstants kProfilePicKey]]];
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

/*- (void)viewWillAppear:(BOOL)animated {
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
        if (([self.currentUser objectForKey:[VLConstants kCityFieldKey]] && [self.currentUser objectForKey:[VLConstants kCountryFieldKey]] && ![[self.currentUser objectForKey:[VLConstants kCityFieldKey]] isEqualToString:@""] && ![[self.currentUser objectForKey:[VLConstants kCountryFieldKey]] isEqualToString:@""])) {
            [self setContainerViewController:self.connectLocalsNC];
        } else {
            [self setContainerViewController:self.connectLocalsErrorVC];
        }
    } else if ([self.tabBarItem.title isEqualToString:@"Itinerary"]) {
        [self.pageTitle setText:@"My Itinerary"];
        [self setEditSaveButton];
        if ([[self.currentUser objectForKey:[VLConstants kItineraryArrayKey]] count] > 0) {
            [self setContainerViewController:self.itineraryTVC];
        } else {
            [self.itineraryTVC.tableView setBackgroundColor:[UIColor clearColor]];
            [self setContainerViewController:self.emptyItineraryMessageVC];
        }
    }
}*/

- (void)viewWillAppear:(BOOL)animated {
    [self viewDidLayoutSubviews];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self setHeaderElementsLayout];

    if ([self.tabBarItem.title isEqualToString:@"Profile"]) {
        [self setEditSaveButton];
        [self.pageTitle setText:@"My Profile"];
        [self setContainerViewController:self.profileTVC];
        [self layoutContainerViewController:self.profileTVC];
    } else if ([self.tabBarItem.title isEqualToString:@"Style"]) {
        [self setBuildStyleButton];
        [self.pageTitle setText:@"My Style"];
        if (!self.actionButton.selected) {
            [self setContainerViewController:self.travelStyleTVC];
            [self layoutContainerViewController:self.travelStyleTVC];
        }
    } else if ([self.tabBarItem.title isEqualToString:@"Trip"]) {
        [self setEditSaveButton];
        [self.pageTitle setText:@"My Trip"];
        [self setContainerViewController:self.tripTVC];
        [self layoutContainerViewController:self.tripTVC];
    } else if ([self.tabBarItem.title isEqualToString:@"Connect"]) {
        [self.pageTitle setText:@"Connect"];
        [self.actionButton setHidden:YES];
        if (([self.currentUser objectForKey:[VLConstants kCityFieldKey]] && [self.currentUser objectForKey:[VLConstants kCountryFieldKey]] && ![[self.currentUser objectForKey:[VLConstants kCityFieldKey]] isEqualToString:@""] && ![[self.currentUser objectForKey:[VLConstants kCountryFieldKey]] isEqualToString:@""])) {
            [self setContainerViewController:self.connectLocalsNC];
            [self layoutContainerViewController:self.connectLocalsNC];
        } else {
            [self setContainerViewController:self.connectLocalsErrorVC];
            [self layoutContainerViewController:self.connectLocalsErrorVC];
        }
    } else if ([self.tabBarItem.title isEqualToString:@"Itinerary"]) {
        [self.pageTitle setText:@"My Itinerary"];
        [self setEditSaveButton];
        if ([[self.currentUser objectForKey:[VLConstants kItineraryArrayKey]] count] > 0) {
            [self setContainerViewController:self.itineraryTVC];
            [self layoutContainerViewController:self.itineraryTVC];
        } else {
            [self.itineraryTVC.tableView setBackgroundColor:[UIColor clearColor]];
            [self setContainerViewController:self.emptyItineraryMessageVC];
            [self layoutContainerViewController:self.emptyItineraryMessageVC];
        }
    }
}

- (void)setHeaderElementsLayout {
    CGFloat center = CGRectGetWidth(self.view.bounds)/2;
    CGFloat rightCenter = (center - 30)/2;
    CGFloat heightOfUsableScreen = self.view.bounds.size.height - 20 - self.tabBarController.tabBar.frame.size.height;
    //[self.profilePicView setFrame:CGRectMake(20, 20, fminf(140, center - 20), 120)];
    [self.profilePicView setFrame:CGRectMake(20, 20, fminf(heightOfUsableScreen * 0.20 + 25, center - 30), heightOfUsableScreen * 0.20)];
    [self.actionButton setFrame: CGRectMake(center + rightCenter - 30, CGRectGetMaxY(self.profilePicView.frame) - 30, 60, 30)];
    [self.logoutButton  setFrame:CGRectMake(CGRectGetWidth(self.view.frame) - 10 - 55, 20, 60, 30)];
    
    CGSize pageTitleFontSize = [self.pageTitle.text sizeWithAttributes:@{NSFontAttributeName:[self.pageTitle font]}];

    [self.pageTitle setFrame:CGRectMake(center, CGRectGetMaxY(self.logoutButton.frame) + ((CGRectGetMinY(self.actionButton.frame) - CGRectGetMaxY(self.logoutButton.frame))/2) - pageTitleFontSize.height/2, center - 20, pageTitleFontSize.height)];
    [self.pageTitle setTextAlignment:NSTextAlignmentCenter];
    
    [self.actionButton.titleLabel setFont:[UIFont systemFontOfSize:18]];
    [self.actionButton setTitleColor:[UIColor colorWithRed:51/255.0 green:153.0/255.0 blue:255.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [self.actionButton setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [self.actionButton setBackgroundColor:[UIColor colorWithRed:1 green:204.0/255.0 blue:204.0/255.0 alpha:1.0]];
}

- (void)setContainerViewController:(UIViewController *) viewController {
    [self addChildViewController:viewController];
    [self.view addSubview:viewController.view];
    [viewController didMoveToParentViewController:self];
}

- (void)layoutContainerViewController:(UIViewController *) viewController {
    [viewController.view setFrame:CGRectMake(10, CGRectGetMaxY(self.profilePicView.frame) + 10, CGRectGetWidth(self.view.bounds) - 20, CGRectGetHeight(self.view.bounds) - CGRectGetMaxY(self.profilePicView.frame) - 20 - self.tabBarController.tabBar.frame.size.height)];
    [VLUtilities makeRound:viewController.view];
}

- (void)actionButtonClicked {
    [self.actionButton setSelected:!self.actionButton.selected];
    if (self.actionButton.selected == YES) {
        if ([self.tabBarItem.title isEqualToString:@"Profile"]) {
            [self.profileTVC editProfileFields];
        } else if ([self.tabBarItem.title isEqualToString:@"Trip"]) {
            [self.tripTVC editTripFields];
        } else if ([self.tabBarItem.title isEqualToString:@"Itinerary"]) {
            [self.itineraryTVC editItineraryCells];
        } else if ([self.tabBarItem.title isEqualToString:@"Style"]) {
            [self setBuildStyleViewController];
            return;
        }
    } else {
        if ([self.tabBarItem.title isEqualToString:@"Profile"]) {
            [self.profileTVC saveProfileFields];
        } else if ([self.tabBarItem.title isEqualToString:@"Trip"]) {
            [self.tripTVC saveTripFields];
        } else if ([self.tabBarItem.title isEqualToString:@"Itinerary"]) {
            [self.itineraryTVC saveItineraryCells];
            [self.currentUser saveInBackground];
        } else if ([self.tabBarItem.title isEqualToString:@"Style"]) {
            [self.quizVC.view removeFromSuperview];
            [self.quizVC removeFromParentViewController];
            [self setContainerViewController:self.travelStyleTVC];
        }
    }
}

- (void)logoutButtonClicked {
    [PFUser logOut];
    [self.tabBarController willMoveToParentViewController:nil];
    [self.tabBarController.view removeFromSuperview];
    [self.tabBarController removeFromParentViewController];
    
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
    [self layoutContainerViewController:self.quizVC];
}

#pragma mark - VLQuizViewControllerDelegate

- (void)VLQuizViewControllerDidFinishQuiz {
    [self.actionButton setSelected:NO];
}

@end
