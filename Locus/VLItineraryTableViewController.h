//
//  VLItineraryTableViewController.h
//  Locus
//
//  Created by Vicki Lau on 11/26/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Parse/Parse.h"

#import "VLConstants.h"
#import "VLItineraryCompletionViewController.h"
#import "VLItineraryTableViewCell.h"

@interface VLItineraryTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource, VLItineraryTableViewCellDelegate, VLItineraryCompletionViewControllerDelegate>

@property (nonatomic, strong) PFUser *currentUser;
@property (nonatomic, strong) NSMutableArray *itineraryTableViewCells;
@property (nonatomic, strong) NSMutableArray *itineraryArray;
@property (nonatomic, strong) NSMutableArray *itineraryNoteArray;
@property (nonatomic, strong) NSMutableArray *activityCellTimes;

@property (nonatomic, strong) UIVisualEffectView *blurEffectView;
@property (nonatomic, strong) VLItineraryCompletionViewController *popupVC;

- (void)editItineraryCells;

- (void)saveItineraryCells;

@end
