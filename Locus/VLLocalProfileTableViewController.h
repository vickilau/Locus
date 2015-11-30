//
//  VLLocalProfileTableViewController.h
//  Locus
//
//  Created by Vicki Lau on 11/25/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

#import "VLConstants.h"
#import "VLData.h"
#import "VLLocalProfileTableViewCell.h"
#import "VLLocalTableViewCell.h"
#import "VLLocalSuggestionsTableViewCell.h"
#import "VLUserCommentsTableViewController.h"

@interface VLLocalProfileTableViewController : UITableViewController <VLLocalSuggestionsTableViewCellDelegate>

@property (strong, nonatomic) VLLocalTableViewCell *localCell;
@property (strong, nonatomic) PFUser *currentUser;
@property (strong, nonatomic) VLLocalProfileTableViewCell *profileCell;
@property (strong, nonatomic) VLLocalSuggestionsTableViewCell *firstSuggestionCell;
@property (strong, nonatomic) VLLocalSuggestionsTableViewCell *secondSuggestionCell;
@property (strong, nonatomic) VLLocalSuggestionsTableViewCell *thirdSuggestionCell;
@property (strong, nonatomic) VLLocalSuggestionsTableViewCell *fourthSuggestionCell;

- (instancetype) initWithCell:(VLLocalTableViewCell *)cell;

@end
