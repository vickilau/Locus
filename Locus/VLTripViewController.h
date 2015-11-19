//
//  VLTripViewController.h
//  Locus
//
//  Created by Vicki Lau on 11/19/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VLTripTableViewController.h"

@interface VLTripViewController : UIViewController

@property (strong, nonatomic) VLTripTableViewController *tripTableVC;
@property BOOL isEditing;

@property (weak, nonatomic) IBOutlet UIView *containerView;

@property (weak, nonatomic) IBOutlet UIButton *editSaveToggleButton;

- (IBAction)toggleButtonClicked:(id)sender;

@end
