//
//  VLLocalProfileTableViewCell.h
//  Locus
//
//  Created by Vicki Lau on 11/25/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RateView.h"
#import "VLUtilities.h"

@interface VLLocalProfileTableViewCell : UITableViewCell

@property RateView *ratingView;
@property UIImageView *profileImageView;
@property UILabel *ageGenderField;
@property UILabel *locationField;
@property UILabel *aboutMeField;
@property UILabel *favsField;

@end
