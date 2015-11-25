//
//  VLLocalTableViewCell.m
//  Locus
//
//  Created by Vicki Lau on 11/25/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import "VLLocalTableViewCell.h"

@implementation VLLocalTableViewCell

- (instancetype)init {
    if (self = [super init]) {
        _ratingView = [[RateView alloc] init];
        [_ratingView setNotSelectedImage:[UIImage imageNamed:@"emptyStar.png"]];
        [_ratingView setHalfSelectedImage:[UIImage imageNamed:@"halfStar.png"]];
        [_ratingView setFullSelectedImage:[UIImage imageNamed:@"fullStar.png"]];
        [_ratingView setEditable:NO];
        [_ratingView setMaxRating:5];
        
        _profileImageView = [[UIImageView alloc] init];
        _nameLabel = [[UILabel alloc] init];
        _firstSuggestion = [[UILabel alloc] init];
        _secondSuggestion = [[UILabel alloc] init];
        _thirdSuggestion = [[UILabel alloc] init];
        _viewProfileButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _addFirstSuggestion = [UIButton buttonWithType:UIButtonTypeContactAdd];
        _addSecondSuggestion = [UIButton buttonWithType:UIButtonTypeContactAdd];
        _addThirdSuggestion = [UIButton buttonWithType:UIButtonTypeContactAdd];
        
        [self addSubview:_ratingView];
        [self addSubview:_profileImageView];
        [self addSubview:_nameLabel];
        [self addSubview:_firstSuggestion];
        [self addSubview:_secondSuggestion];
        [self addSubview:_thirdSuggestion];
        [self addSubview:_viewProfileButton];
        [self addSubview:_addFirstSuggestion];
        [self addSubview:_addSecondSuggestion];
        [self addSubview:_addThirdSuggestion];
    }
    return self;
}

- (void)layoutSubviews {
    
}

@end
