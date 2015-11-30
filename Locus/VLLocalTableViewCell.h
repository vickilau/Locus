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
#import "VLConstants.h"
#import "VLUtilities.h"

@protocol VLLocalTableViewCellDelegate;

@interface VLLocalTableViewCell : UITableViewCell

@property (nonatomic, weak) id<VLLocalTableViewCellDelegate> delegate;

@property UIImageView *profileImageView;
@property NSString *firstSuggestionImageString;
@property NSString *secondSuggestionImageString;
@property NSString *thirdSuggestionImageString;
@property NSString *fourthSuggestionImageString;
@property UILabel *nameLabel;
@property UILabel *firstSuggestion;
@property UILabel *secondSuggestion;
@property NSString *thirdSuggestion;
@property NSString *fourthSuggestion;
@property UILabel *firstSuggestionNote;
@property UILabel *secondSuggestionNote;
@property NSString *thirdSuggestionNote;
@property NSString *fourthSuggestionNote;
@property UIButton *viewProfileButton;
@property UIButton *addFirstSuggestion;
@property UIButton *addSecondSuggestion;
@property RateView *ratingView;
@property RateView *firstSuggestionRating;
@property RateView *secondSuggestionRating;
@property float thirdSuggestionRating;
@property float fourthSuggestionRating;
@property NSString *aboutMe;
@property NSString *faves;
@property NSString *gender;
@property NSString *age;

@end

@protocol VLLocalTableViewCellDelegate <NSObject>

- (void)didAddToItinerary:(UIAlertController *)alert;

- (void)didClickToViewProfile:(VLLocalTableViewCell *)targetCell;

@end