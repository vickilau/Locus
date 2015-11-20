//
//  VLTripViewController.m
//  Locus
//
//  Created by Vicki Lau on 11/19/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import "VLTripViewController.h"

@implementation VLTripViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    
    self.isEditing = NO;
    [self makeRound:self.profilePicView];
    [self makeRound:self.containerView];
    [self makeRound:self.tripTableVC.view];
    [self makeRound:self.editSaveToggleButton];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.view.backgroundColor = [UIColor clearColor];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"TripTableViewSegue"]){
        self.tripTableVC = (VLTripTableViewController *)segue.destinationViewController;
    }
}

- (IBAction)toggleButtonClicked:(id)sender {
    self.isEditing = !self.isEditing;
    if (self.isEditing == YES) {
        [self.editSaveToggleButton setTitle:@"Save" forState:UIControlStateNormal];
        [self.tripTableVC editTripFields];
    } else {
        [self.editSaveToggleButton setTitle:@"Edit" forState:UIControlStateNormal];
        [self.tripTableVC saveTripFields];
    }
}

- (void)makeRound:(UIView *)view {
    [view.layer setMasksToBounds:YES];
    
    if (view == self.editSaveToggleButton) {
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
