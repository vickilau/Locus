//
//  VLItineraryCompletionViewController.h
//  Locus
//
//  Created by Vicki Lau on 11/28/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Parse/Parse.h"

#import "RateView.h"
#import "VLConstants.h"
#import "VLUtilities.h"

@protocol VLItineraryCompletionViewControllerDelegate;

@interface VLItineraryCompletionViewController : UIViewController

@property (nonatomic, weak) id<VLItineraryCompletionViewControllerDelegate> delegate;

@property PFUser *currentUser;
@property RateView *activityRating;
@property UITextField *activityNote;
@property UILabel *ratingMessage;
@property UILabel *activityName;
@property UIButton *submitButton;
@property UIButton *cancelButton;
@property NSIndexPath *indexPath;

- (instancetype)initWithActivityName:(NSString *)activityName indexPath:(NSIndexPath *)indexPath;

@end

@protocol VLItineraryCompletionViewControllerDelegate <NSObject>

- (void)didSaveCancelCompleteActivity:(NSIndexPath *)indexPath remove:(BOOL)remove;

@end