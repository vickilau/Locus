//
//  VLLocalTableViewController.h
//  Locus
//
//  Created by Vicki Lau on 11/25/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <Parse/Parse.h>

#import "VLLocalProfileTableViewController.h"
#import "VLLocalTableViewCell.h"

@interface VLLocalTableViewController : UITableViewController <VLLocalTableViewCellDelegate>

@property (strong, nonatomic) PFUser *currentUser;
@property (strong, nonatomic) VLLocalTableViewCell *firstLocalCell;
@property (strong, nonatomic) VLLocalTableViewCell *secondLocalCell;
@property (strong, nonatomic) VLLocalTableViewCell *thirdLocalCell;
@property (strong, nonatomic) VLLocalTableViewCell *fourthLocalCell;

@end
