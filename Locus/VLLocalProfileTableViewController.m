//
//  VLLocalProfileTableViewController.m
//  Locus
//
//  Created by Vicki Lau on 11/25/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import "VLLocalProfileTableViewController.h"

NSString *kDefaultAboutMeField = @"I love meeting new people! I was born and raised here and proudly claim that it is the best place ever. I know most people here and can tell you about all the best gems.";
NSString *kDefaultfavActivitiesField = @"#hiking #scubadiving #reading #eatingIceCream #swimming #painting";
NSString *kDefaultfavPlacesField = @"#coffeeshops #LACMA #EatonCanyon #DTLA #Chinatown #artsDistrict #VeniceBeach";

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
    //CGFloat randomRating = ((CGFloat)rand() / RAND_MAX) * 5;
    [self.profileCell.ratingView setRating:self.localCell.ratingView.rating];
    int randomAge =  (arc4random() % 21) + 20;
    NSString *gender = @"Female";
    [self.profileCell.ageGenderField setText:[[[NSString stringWithFormat:@"%i", randomAge] stringByAppendingString:@", "] stringByAppendingString:gender]];
    [self.profileCell.locationField setText:[self.currentUser objectForKey:@"cityField"]];
    [self.profileCell.aboutMeField setText:kDefaultAboutMeField];
    [self.profileCell.favsField setText:[[kDefaultfavActivitiesField stringByAppendingString:@" "]stringByAppendingString:kDefaultfavPlacesField]];

    [self.firstSuggestionCell.suggestionImageView setImage:self.localCell.profileImageView.image];
    [self.firstSuggestionCell.suggestionLabel setText:@"Venice Beach"];
    [self.firstSuggestionCell.suggestionNote setText:@"Love this place! I come here almost everyday!!!! It's amazing"];
    [self.firstSuggestionCell.suggestionRating setRating:3.8];
    [self.firstSuggestionCell setDelegate:self];
    
    [self.secondSuggestionCell.suggestionImageView setImage:self.localCell.profileImageView.image];
    [self.secondSuggestionCell.suggestionLabel setText:@"Venice Beach"];
    [self.secondSuggestionCell.suggestionNote setText:@"Love this place! I come here almost everyday!!!! It's amazing"];
    [self.secondSuggestionCell.suggestionRating setRating:3.8];
    [self.secondSuggestionCell setDelegate:self];

    [self.thirdSuggestionCell.suggestionImageView setImage:self.localCell.profileImageView.image];
    [self.thirdSuggestionCell.suggestionLabel setText:@"Venice Beach"];
    [self.thirdSuggestionCell.suggestionNote setText:@"Love this place! I come here almost everyday!!!! It's amazing"];
    [self.thirdSuggestionCell.suggestionRating setRating:3.8];
    [self.thirdSuggestionCell setDelegate:self];
    
    [self.fourthSuggestionCell.suggestionImageView setImage:self.localCell.profileImageView.image];
    [self.fourthSuggestionCell.suggestionLabel setText:@"Venice Beach"];
    [self.fourthSuggestionCell.suggestionNote setText:@"Love this place! I come here almost everyday!!!! It's amazing"];
    [self.fourthSuggestionCell.suggestionRating setRating:3.8];
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
        case 1: return 150.0f;
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
