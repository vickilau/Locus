//
//  VLItineraryTableViewCell.h
//  Locus
//
//  Created by Vicki Lau on 11/26/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <Parse/Parse.h>

#import "VLUtilities.h"

@protocol VLItineraryTableViewCellDelegate;

@interface VLItineraryTableViewCell : UITableViewCell

@property (nonatomic, weak) id<VLItineraryTableViewCellDelegate> delegate; 

@property PFUser *currentUser;
@property UILabel *activityNameLabel;
@property UILabel *activityNoteLabel;
@property UIDatePicker *activityWhen;
@property UIButton *completeButton;
@property UIButton *cancelButton;
@property UIImageView *border;

@end

@protocol VLItineraryTableViewCellDelegate <NSObject>

- (void)didClickCompleteActivity:(VLItineraryTableViewCell *)cell;
- (void)didClickCancelActivity:(VLItineraryTableViewCell *)cell;
@end