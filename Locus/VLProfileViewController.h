//
//  VLProfileViewController.h
//  Locus
//
//  Created by Vicki Lau on 11/10/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <Parse/Parse.h>
#import <UIKit/UIKit.h>
#import "VLProfileTableViewController.h"

@interface VLProfileViewController : UIViewController

@property (strong, nonatomic) VLProfileTableViewController *profileTableVC;
@property BOOL isEditing;

@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIButton *editSaveToggleButton;

- (IBAction)toggleButtonClicked:(id)sender;



@end