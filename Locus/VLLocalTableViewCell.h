//
//  VLLocalTableViewCell.h
//  Locus
//
//  Created by Vicki Lau on 11/25/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <Parse/Parse.h>

#import "RateView.h"
#import "VLUtilities.h"

@protocol VLLocalTableViewCellDelegate;

@interface VLLocalTableViewCell : UITableViewCell

@property (nonatomic, weak) id<VLLocalTableViewCellDelegate> delegate;

@property RateView *ratingView;
@property UIImageView *profileImageView;
@property UILabel *nameLabel;
@property UILabel *firstSuggestion;
@property UILabel *secondSuggestion;
@property UILabel *firstSuggestionNote;
@property UILabel *secondSuggestionNote;
@property UIButton *viewProfileButton;
@property UIButton *addFirstSuggestion;
@property UIButton *addSecondSuggestion;
@property RateView *firstSuggestionRating;
@property RateView *secondSuggestionRating;

@end

@protocol VLLocalTableViewCellDelegate <NSObject>

- (void)didAddToItinerary:(UIAlertController *)alert;

- (void)didClickToViewProfile:(VLLocalTableViewCell *)targetCell;

@end