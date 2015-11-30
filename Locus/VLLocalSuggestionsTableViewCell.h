//
//  VLLocalSuggestionsTableViewCell.h
//  Locus
//
//  Created by Vicki Lau on 11/25/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <Parse/Parse.h>

#import "RateView.h"
#import "VLConstants.h"
#import "VLUtilities.h"

@protocol VLLocalSuggestionsTableViewCellDelegate;

@interface VLLocalSuggestionsTableViewCell : UITableViewCell

@property (nonatomic, weak) id<VLLocalSuggestionsTableViewCellDelegate> delegate;

@property PFUser *currentUser;
@property UIImageView *suggestionImageView;
@property UILabel *suggestionLabel;
@property RateView *suggestionRating;
@property UILabel *suggestionNote;
@property UIButton *addSuggestion;
@property UIButton *commentsButton;

@end

@protocol VLLocalSuggestionsTableViewCellDelegate <NSObject>

- (void)didAddToItinerary:(UIAlertController *)alert;
- (void)didClickToViewComments:(NSString *)activityName;

@end