//
//  VLUserCommentsTableViewController.m
//  Locus
//
//  Created by Vicki Lau on 11/29/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import "VLUserCommentsTableViewController.h"

@implementation VLUserCommentsTableViewController

- (instancetype)initWithActivityName:(NSString *)activityName {
    if (self = [super init]) {
        [self fetchFromDatabase:activityName];
        _commentsArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController.navigationBar setTranslucent:YES];
    [super viewWillAppear:animated];
}

- (void)fetchFromDatabase:(NSString *)activityName {
    PFQuery *query = [PFQuery queryWithClassName:[VLConstants kActivityClass]];
    [query whereKey:[VLConstants kActivityNameKey] equalTo:activityName];
    [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
        
        if (!error) {
            _comments = object[[VLConstants kActivityCommentsKey]];
            _ratings = object[[VLConstants kActivityRatingsKey]];
            _fbPictures = object[[VLConstants kActivityFbPicturesKey]];
            _ages = object[[VLConstants kActivityAgesKey]];
            _genders = object[[VLConstants kActivityGendersKey]];
            _names = object[[VLConstants kActivityUserNamesKey]];
            
            dispatch_async(dispatch_get_main_queue(), ^ {
                [self loadView];
            });
            
        } else {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

- (void)loadView {
    [super loadView];
    NSUInteger count = 0;
    while (count < self.comments.count) {
        VLUserCommentsTableViewCell *newCell = [[VLUserCommentsTableViewCell alloc] init];
        UIImage *profilePic = [UIImage imageWithData:[self.fbPictures objectAtIndex:count]];
        if ([[self.fbPictures objectAtIndex:count] length] == 0) {
            profilePic = [UIImage imageNamed:@"defaultPic.png"];
        }
        [newCell.userImageView setImage:profilePic];
        NSString *username = [self.names objectAtIndex:count];
        if ([username isEqualToString:@""]) {
            username = @"Anonymous";
        }
        [newCell.userName setText:username];
        NSString *comment = [self.comments objectAtIndex:count];
        if ([comment isEqualToString:@""]) {
            comment = @"No comment provided";
        }
        [newCell.userComment setText:comment];
        [newCell.userAgeAndGender setText:[[[self.ages objectAtIndex:count] stringByAppendingString:@", "] stringByAppendingString:[self.genders objectAtIndex:count]]];
        [newCell.userRating setRating:[[self.ratings objectAtIndex:count] floatValue]];
        [self.commentsArray addObject:newCell];
        count++;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.commentsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.commentsArray objectAtIndex:indexPath.row];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200.0f;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UILabel *label = [[UILabel alloc] init];
    [label setText:@"Comments"];
    [label setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleTitle2]];
    [label setTextColor:[UIColor colorWithRed:153.0/255.0 green:102.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [label setBackgroundColor:[UIColor colorWithRed:247/255.0f green:247/255.0f blue:247/255.0f alpha:1.0f]];
    [label.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [label setTextAlignment:NSTextAlignmentCenter];
    return label;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return CGRectGetHeight(self.navigationController.navigationBar.frame);
}
@end
