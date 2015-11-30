//
//  VLLocalProfileTableViewController.m
//  Locus
//
//  Created by Vicki Lau on 11/25/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import "VLLocalProfileTableViewController.h"

@implementation VLLocalProfileTableViewController

- (instancetype) initWithCell:(VLLocalTableViewCell *)cell {
    if (self = [super init]) {
        _localCell = cell;
        _currentUser = [PFUser currentUser];
        _profileCell = [[VLLocalProfileTableViewCell alloc] init];
        _firstSuggestionCell = [[VLLocalSuggestionsTableViewCell alloc] init];
        _secondSuggestionCell = [[VLLocalSuggestionsTableViewCell alloc] init];
        _thirdSuggestionCell = [[VLLocalSuggestionsTableViewCell alloc] init];
        _fourthSuggestionCell = [[VLLocalSuggestionsTableViewCell alloc] init];
        [self.tableView setSeparatorColor:[UIColor lightGrayColor]];
    }
    return self;
}

- (void)loadView {
    [super loadView];
    
    [self.profileCell.profileImageView setImage:self.localCell.profileImageView.image];
    [self.profileCell.profileImageView setContentMode:UIViewContentModeScaleAspectFill];
    [self.profileCell.ratingView setRating:self.localCell.ratingView.rating];
    [self.profileCell.ageGenderField setText:[[self.localCell.age stringByAppendingString:@", "] stringByAppendingString:self.localCell.gender]];
    [self.profileCell.locationField setText:[self.currentUser objectForKey:[VLConstants kCityFieldKey]]];
    [self.profileCell.aboutMeField setText:self.localCell.aboutMe];
    [self.profileCell.favsField setText:self.localCell.faves];

    [self.firstSuggestionCell.suggestionImageView setImage:[UIImage imageNamed:self.localCell.firstSuggestionImageString]];
    [self.firstSuggestionCell.suggestionLabel setText:self.localCell.firstSuggestion.text];
    [self.firstSuggestionCell.suggestionNote setText:self.localCell.firstSuggestionNote.text];
    [self.firstSuggestionCell.suggestionRating setRating:self.localCell.firstSuggestionRating.rating];
    [self.firstSuggestionCell setDelegate:self];
    
    [self.secondSuggestionCell.suggestionImageView setImage:[UIImage imageNamed:self.localCell.secondSuggestionImageString]];
    [self.secondSuggestionCell.suggestionLabel setText:self.localCell.secondSuggestion.text];
    [self.secondSuggestionCell.suggestionNote setText:self.localCell.secondSuggestionNote.text];
    [self.secondSuggestionCell.suggestionRating setRating:self.localCell.secondSuggestionRating.rating];
    [self.secondSuggestionCell setDelegate:self];

    [self.thirdSuggestionCell.suggestionImageView setImage:[UIImage imageNamed:self.localCell.thirdSuggestionImageString]];
    [self.thirdSuggestionCell.suggestionLabel setText:self.localCell.thirdSuggestion];
    [self.thirdSuggestionCell.suggestionNote setText:self.localCell.thirdSuggestionNote];
    [self.thirdSuggestionCell.suggestionRating setRating:self.localCell.thirdSuggestionRating];
    [self.thirdSuggestionCell setDelegate:self];
    
    [self.fourthSuggestionCell.suggestionImageView setImage:[UIImage imageNamed:self.localCell.fourthSuggestionImageString]];
    [self.fourthSuggestionCell.suggestionLabel setText:self.localCell.fourthSuggestion];
    [self.fourthSuggestionCell.suggestionNote setText:self.localCell.fourthSuggestionNote];
    [self.fourthSuggestionCell.suggestionRating setRating:self.localCell.fourthSuggestionRating];
    [self.fourthSuggestionCell setDelegate:self];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 4;
            break;
        default:
            return 0;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0: return self.profileCell;
        case 1:
            switch(indexPath.row) {
                case 0: return self.firstSuggestionCell;
                case 1: return self.secondSuggestionCell;
                case 2: return self.thirdSuggestionCell;
                case 3: return self.fourthSuggestionCell;
            }
        default: return nil;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0: return 300.0f;
        case 1: return 200.0f;
        default: return 0.0f;
    }
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NSString *headerTitle = [[NSString alloc] init];
    switch (section) {
        case 0:
            headerTitle = self.localCell.nameLabel.text;
            break;
        case 1:
            headerTitle = @"Suggestions";
            break;
        default:
            return nil;
    }
    UILabel *label = [[UILabel alloc] init];
    [label setText:headerTitle];
    [label setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleTitle2]];
    [label setTextColor:[UIColor colorWithRed:153.0/255.0 green:102.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [label setBackgroundColor:[UIColor colorWithRed:247/255.0f green:247/255.0f blue:247/255.0f alpha:1.0f]];
    [label.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [label setTextAlignment:NSTextAlignmentCenter];
    return label;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}

#pragma mark - VLLocalSuggestionsTableViewCellDelegate
- (void)didAddToItinerary:(UIAlertController *)alert {
    [self presentViewController:alert animated:YES completion:nil];
}
@end
