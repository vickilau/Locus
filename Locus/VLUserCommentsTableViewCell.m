
//
//  VLUserCommentsTableViewCell.m
//  Locus
//
//  Created by Vicki Lau on 11/29/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import "VLUserCommentsTableViewCell.h"

@implementation VLUserCommentsTableViewCell

- (instancetype)init {
    if (self = [super init]) {
        [self setProperties];
        [self addPropertiesAsSubviews];
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.userImageView setFrame:CGRectMake(10, 10, self.frame.size.width * 0.40, self.frame.size.width * 0.40)];
    [VLUtilities makeCircle:self.userImageView];

    CGFloat widthRow = (self.frame.size.width - CGRectGetWidth(self.userImageView.frame)) - 25;
    CGFloat heightSection = self.frame.size.height - 20 - 15;
    
    [self.userName setFrame:CGRectMake(CGRectGetMaxX(self.userImageView.frame) + 5, 10, widthRow, heightSection * 0.2)];
    
    [self.userRating setFrame:CGRectMake(CGRectGetMaxX(self.userImageView.frame) + 5, CGRectGetMaxY(self.userName.frame) + 5, widthRow, heightSection * 0.1)];
                                       
    [self.userAgeAndGender setFrame:CGRectMake(CGRectGetMaxX(self.userImageView.frame), CGRectGetMaxY(self.userRating.frame) + 5, widthRow, heightSection * 0.1)];

    [self.userComment setFrame:CGRectMake(CGRectGetMaxX(self.userImageView.frame) + 5, CGRectGetMaxY(self.userAgeAndGender.frame) + 5, widthRow, [VLUtilities getHeightOfLabel:self.userComment width:widthRow])];
}

- (void)setProperties {
    _userImageView = [[UIImageView alloc] init];
    _userRating = [[RateView alloc] init];
    _userName = [[UILabel alloc] init];
    _userAgeAndGender = [[UILabel alloc] init];
    _userComment = [[UILabel alloc] init];
    
    [_userImageView setContentMode:UIViewContentModeTop];
    
    [_userRating setNotSelectedImage:[UIImage imageNamed:@"emptyHeart.png"]];
    [_userRating setHalfSelectedImage:[UIImage imageNamed:@"halfHeart.png"]];
    [_userRating setFullSelectedImage:[UIImage imageNamed:@"fullHeart.png"]];
    [_userRating setEditable:NO];
    [_userRating setMaxRating:5];
    
    [_userName setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleTitle2]];
    [_userName setTextColor:[UIColor colorWithRed:153.0/255.0 green:102.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [_userName setTextAlignment:NSTextAlignmentCenter];
    
    [_userAgeAndGender setTextAlignment:NSTextAlignmentCenter];

    [_userComment setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline]];

}

- (void)addPropertiesAsSubviews {
    [self.contentView addSubview:_userImageView];
    [self.contentView addSubview:_userName];
    [self.contentView addSubview:_userRating];
    [self.contentView addSubview:_userComment];
    [self.contentView addSubview:_userAgeAndGender];
}

@end
