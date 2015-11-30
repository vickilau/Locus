//
//  VLUserCommentsTableViewController.h
//  Locus
//
//  Created by Vicki Lau on 11/29/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Parse/Parse.h"

#import "VLConstants.h"
#import "VLUserCommentsTableViewCell.h"

@interface VLUserCommentsTableViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray *comments;
@property (strong, nonatomic) NSMutableArray *ratings;
@property (strong, nonatomic) NSMutableArray *fbPictures;
@property (strong, nonatomic) NSMutableArray *ages;
@property (strong, nonatomic) NSMutableArray *genders;
@property (strong, nonatomic) NSMutableArray *names;
@property (strong, nonatomic) NSMutableArray *commentsArray;

- (instancetype)initWithActivityName:(NSString *)activityName;

@end
