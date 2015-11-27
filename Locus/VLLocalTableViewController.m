
//
//  VLLocalTableViewController.m
//  Locus
//
//  Created by Vicki Lau on 11/25/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import "VLLocalTableViewController.h"

@implementation VLLocalTableViewController

- (instancetype)init {
    if (self = [super init]) {
        _currentUser = [PFUser currentUser];
        _firstLocalCell = [[VLLocalTableViewCell alloc] init];
        _secondLocalCell = [[VLLocalTableViewCell alloc] init];
        _thirdLocalCell = [[VLLocalTableViewCell alloc] init];
        _fourthLocalCell = [[VLLocalTableViewCell alloc] init];
        [self.tableView setSeparatorColor:[UIColor lightGrayColor]];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}

- (void)loadView {
    [super loadView];
    
    [self.firstLocalCell setBackgroundColor:[UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.5f]];
    [self.firstLocalCell.profileImageView setImage:[UIImage imageNamed:@"bar.jpg"]];
    [self.firstLocalCell.nameLabel setText:@"Vicki Lau"];
    [self.firstLocalCell.ratingView setRating:4.8];
    [self.firstLocalCell.firstSuggestion setText:@"Eaton Canyon "];
    [self.firstLocalCell.secondSuggestion setText:@"Nick's Cafe"];
    [self.firstLocalCell.firstSuggestionNote setText:@"hiking at sunset is beautiful!"];
    [self.firstLocalCell.secondSuggestionNote setText:@"best brunch in the area!!!"];
    [self.firstLocalCell.firstSuggestionRating setRating:5];
    [self.firstLocalCell.secondSuggestionRating setRating:5];
    [self.firstLocalCell setDelegate:self];
    
    [self.secondLocalCell setBackgroundColor:[UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.5f]];
    [self.secondLocalCell.profileImageView setImage:[UIImage imageNamed:@"beach.jpeg"]];
    [self.secondLocalCell.nameLabel setText:@"Gautam Rao"];
    [self.secondLocalCell.ratingView setRating:3.5];
    [self.secondLocalCell.firstSuggestion setText:@"Aer Lounge"];
    [self.secondLocalCell.secondSuggestion setText:@"Red Beach"];
    [self.secondLocalCell.firstSuggestionNote setText:@"great atmosphere for hanging with friends"];
    [self.secondLocalCell.secondSuggestionNote setText:@"weather is always perfect!"];
    [self.secondLocalCell.firstSuggestionRating setRating:4.3];
    [self.secondLocalCell.secondSuggestionRating setRating:3.8];
    [self.secondLocalCell setDelegate:self];

    [self.thirdLocalCell setBackgroundColor:[UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.5f]];
    [self.thirdLocalCell.profileImageView setImage:[UIImage imageNamed:@"cliffdiving.jpg"]];
    [self.thirdLocalCell.nameLabel setText:@"Anwesha Jalan"];
    [self.thirdLocalCell.ratingView setRating:1.2];
    [self.thirdLocalCell.firstSuggestion setText:@"Taj Mahal"];
    [self.thirdLocalCell.secondSuggestion setText:@"Dilli Haat"];
    [self.thirdLocalCell.firstSuggestionNote setText:@"a must-see for everybody"];
    [self.thirdLocalCell.secondSuggestionNote setText:@"open-air food plaza for foodies!!"];
    [self.thirdLocalCell.firstSuggestionRating setRating:4.5];
    [self.thirdLocalCell.secondSuggestionRating setRating:3.0];
    [self.thirdLocalCell setDelegate:self];
    
    [self.fourthLocalCell setBackgroundColor:[UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.5f]];
    [self.fourthLocalCell.profileImageView setImage:[UIImage imageNamed:@"hiking.jpeg"]];
    [self.fourthLocalCell.nameLabel setText:@"Erin Singer"];
    [self.fourthLocalCell.ratingView setRating:3.8];
    [self.fourthLocalCell.firstSuggestion setText:@"CS147 Lecture"];
    [self.fourthLocalCell.secondSuggestion setText:@"CS147 Studio"];
    [self.fourthLocalCell.firstSuggestionNote setText:@"lectures are always interesting"];
    [self.fourthLocalCell.secondSuggestionNote setText:@"see cool projects come alive"];
    [self.fourthLocalCell.firstSuggestionRating setRating:2.0];
    [self.fourthLocalCell.secondSuggestionRating setRating:5.0];
    [self.fourthLocalCell setDelegate:self];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch(indexPath.row) {
        case 0: return self.firstLocalCell;
        case 1: return self.secondLocalCell;
        case 2: return self.thirdLocalCell;
        case 3: return self.fourthLocalCell;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200.0f;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NSString *location = [[[self.currentUser objectForKey:@"cityField"] stringByAppendingString:@", "] stringByAppendingString:[self.currentUser objectForKey:@"countryField"]];

    UILabel *label = [[UILabel alloc] init];
    [label setText:location];
    [label setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleTitle2]];
    [label setTextColor:[UIColor colorWithRed:153.0/255.0 green:102.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [label setBackgroundColor:[UIColor colorWithRed:247/255.0f green:247/255.0f blue:247/255.0f alpha:1.0f]];
    [label.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [label setTextAlignment:NSTextAlignmentCenter];
    return label;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}

#pragma mark - VLLocalTableViewCellDelegate
- (void)didClickToViewProfile:(VLLocalTableViewCell *)targetCell {
    VLLocalProfileTableViewController *localProfileTVC = [[VLLocalProfileTableViewController alloc] initWithCell:targetCell];
    [self.navigationController pushViewController:localProfileTVC animated:YES];
    
}

- (void)didAddToItinerary:(UIAlertController *)alert {
    [self presentViewController:alert animated:YES completion:nil];
}

@end
