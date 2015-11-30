//
//  VLTravelStyleViewController.h
//  Locus
//
//  Created by Vicki Lau on 11/25/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

#import "VLConstants.h"
#import "VLUtilities.h"

@interface VLTravelStyleViewController : UIViewController

@property (nonatomic, strong) PFUser *currentUser;
@property (nonatomic, strong) UITextView *travelStyleBlurb;
@property (nonatomic, strong) UITextView *instructionsBlurb;

@end
