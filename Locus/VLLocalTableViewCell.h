//
//  VLLocalTableViewCell.h
//  Locus
//
//  Created by Vicki Lau on 11/25/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RateView.h"

@interface VLLocalTableViewCell : UITableViewCell

@property RateView *ratingView;
@property UIImageView *profileImageView;
@property UILabel *nameLabel;
@property UILabel *firstSuggestion;
@property UILabel *secondSuggestion;
@property UILabel *thirdSuggestion;
@property UIButton *viewProfileButton;
@property UIButton *addFirstSuggestion;
@property UIButton *addSecondSuggestion;
@property UIButton *addThirdSuggestion;

@end
