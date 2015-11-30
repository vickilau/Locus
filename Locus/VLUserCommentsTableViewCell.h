//
//  VLUserCommentsTableViewCell.h
//  Locus
//
//  Created by Vicki Lau on 11/29/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RateView.h"
#import "VLUtilities.h"

@interface VLUserCommentsTableViewCell : UITableViewCell

@property (strong, nonatomic) UIImageView *userImageView;
@property (strong, nonatomic) UILabel *userName;
@property (strong, nonatomic) UILabel *userComment;
@property (strong, nonatomic) UILabel *userAgeAndGender;
@property (strong, nonatomic) RateView *userRating;

@end
