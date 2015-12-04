//
//  VLItineraryTableViewCell.m
//  Locus
//
//  Created by Vicki Lau on 11/26/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import "VLItineraryTableViewCell.h"

@implementation VLItineraryTableViewCell

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
    
    CGFloat mainRowHeight = self.frame.size.height - 100 - 10 - 30;
    
    CGFloat rowWidth = self.frame.size.width - 20;
    
    [self.border setFrame:CGRectMake(0, self.frame.size.height - 10, self.frame.size.width, 10)];
    
    [self.completeButton setFrame:CGRectMake((rowWidth/2) - 40, CGRectGetMinY(self.border.frame) - 10 - 25, 25, 25)];
    
    [self.cancelButton setFrame:CGRectMake(CGRectGetMaxX(self.completeButton.frame) + 20, CGRectGetMinY(self.border.frame) - 10 - 25, 25, 25)];
   
    [self.activityWhen setFrame:CGRectMake(15, CGRectGetMinY(self.completeButton.frame) - 100, rowWidth - 15, 100)];
    
    [self.activityNameLabel setFrame:CGRectMake(10, 10, rowWidth, mainRowHeight * 0.4)];
    
    [self.activityNoteLabel setFrame:CGRectMake(10, CGRectGetMaxY(self.activityNameLabel.frame) + 5, rowWidth, [VLUtilities getHeightOfLabel:self.activityNoteLabel width:rowWidth])];
 
}

- (void)setProperties {
    _currentUser = [PFUser currentUser];
    
    _activityNameLabel = [[UILabel alloc] init];
    [_activityNameLabel setTextColor:[UIColor colorWithRed:153.0/255.0 green:102.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [_activityNameLabel setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleTitle2]];
    [_activityNameLabel setTextAlignment:NSTextAlignmentCenter];
    
    _activityNoteLabel = [[UILabel alloc] init];
    [_activityNoteLabel setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline]];
    [_activityNoteLabel setTextAlignment:NSTextAlignmentCenter];

    _activityWhen = [[UIDatePicker alloc] init];
    
    _completeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_completeButton setImage:[UIImage imageNamed:@"check.png"] forState:UIControlStateNormal];
    [_completeButton addTarget:self action:@selector(completeActivity:) forControlEvents:UIControlEventTouchUpInside];
    
    _cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_cancelButton setImage:[UIImage imageNamed:@"cross.png"] forState:UIControlStateNormal];
    [_cancelButton addTarget:self action:@selector(cancelActivity:) forControlEvents:UIControlEventTouchUpInside];
    
    [_activityWhen setMinimumDate:[NSDate date]];
    [_activityWhen setUserInteractionEnabled:NO];
    
    _border = [[UIImageView alloc] init];
    [_border setBackgroundColor:[UIColor colorWithRed:1 green:153.0/255.0 blue:153.0/255.0 alpha:1]];
}

- (void)addPropertiesAsSubviews {
    [self.contentView addSubview:_activityNameLabel];
    [self.contentView addSubview:_activityNoteLabel];
    [self.contentView addSubview:_activityWhen];
    [self.contentView addSubview:_completeButton];
    [self.contentView addSubview:_cancelButton];
    [self.contentView addSubview:_border];
}

- (void)completeActivity:(id)sender {
    id<VLItineraryTableViewCellDelegate> strongDelegate = self.delegate;
    [strongDelegate didClickCompleteActivity:self];
}

- (void)cancelActivity:(id)sender {
    id<VLItineraryTableViewCellDelegate> strongDelegate = self.delegate;
    [strongDelegate didClickCancelActivity:self];
}

@end
