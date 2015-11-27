//
//  VLLocalProfileTableViewCell.m
//  Locus
//
//  Created by Vicki Lau on 11/25/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import "VLLocalProfileTableViewCell.h"

@implementation VLLocalProfileTableViewCell

- (instancetype)init {
    if (self = [super init]) {
        _profileImageView = [[UIImageView alloc] init];
        _ageGenderField = [[UILabel alloc] init];
        _locationField = [[UILabel alloc] init];
        _aboutMeField = [[UILabel alloc] init];
        _favsField = [[UILabel alloc] init];

        [self setProperties];
        [self addPropertiesAsSubviews];
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.profileImageView setFrame:CGRectMake(10, 10, self.frame.size.width * 0.40, self.frame.size.width * 0.40)];
    [VLUtilities makeCircle:self.profileImageView];
    
    [self.ratingView setFrame:CGRectMake(10, CGRectGetMaxY(self.profileImageView.frame), CGRectGetWidth(self.profileImageView.frame), (self.frame.size.height - CGRectGetHeight(self.profileImageView.frame) - 30) * 0.4)];
    
    [self.ageGenderField setFrame:CGRectMake(10, CGRectGetMaxY(self.ratingView.frame) + 5, CGRectGetWidth(self.ratingView.frame), (self.frame.size.height - CGRectGetHeight(self.profileImageView.frame) - 30) * 0.3)];
    
    [self.locationField setFrame:CGRectMake(10, CGRectGetMaxY(self.ageGenderField.frame) + 5, CGRectGetWidth(self.ageGenderField.frame), (self.frame.size.height - CGRectGetHeight(self.profileImageView.frame) - 30) * 0.3)];
    
    CGFloat widthRow = (self.frame.size.width - CGRectGetWidth(self.profileImageView.frame)) - 25;
    
    [self.aboutMeField setFrame:CGRectMake(CGRectGetMaxX(self.profileImageView.frame) + 5, 10, widthRow, [VLUtilities getHeightOfLabel:self.aboutMeField width:widthRow])];
    
    [self.favsField setFrame:CGRectMake(CGRectGetMaxX(self.profileImageView.frame) + 5, CGRectGetMaxY(self.aboutMeField.frame) + 5, widthRow, [VLUtilities getHeightOfLabel:self.favsField width:widthRow])];
    
    CGFloat newHeight = 10 + self.aboutMeField.frame.size.height + 5 + self.favsField.frame.size.height + 10;
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, newHeight)];
}

- (void)setProperties {
    _ratingView = [[RateView alloc] init];
    [_ratingView setNotSelectedImage:[UIImage imageNamed:@"emptyStar.png"]];
    [_ratingView setHalfSelectedImage:[UIImage imageNamed:@"halfStar.png"]];
    [_ratingView setFullSelectedImage:[UIImage imageNamed:@"fullStar.png"]];
    [_ratingView setEditable:NO];
    [_ratingView setMaxRating:5];
    
    [_ageGenderField setTextAlignment:NSTextAlignmentCenter];
    [_locationField setTextAlignment:NSTextAlignmentCenter];
    
    [_aboutMeField setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleBody]];
    [_favsField setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline]];
    
    [_aboutMeField setTextColor:[UIColor blackColor]];
    [_favsField setTextColor:[UIColor darkGrayColor]];
}

- (void)addPropertiesAsSubviews {
    [self.contentView addSubview:_ratingView];
    [self.contentView addSubview:_profileImageView];
    [self.contentView addSubview:_ageGenderField];
    [self.contentView addSubview:_locationField];
    [self.contentView addSubview:_aboutMeField];
    [self.contentView addSubview:_favsField];
}

@end
