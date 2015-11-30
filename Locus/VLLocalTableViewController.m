
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
    
    [self setCellProperties:self.firstLocalCell localName:[VLData firstLocal] imageName:[VLData firstLocalImage] localRating:[VLData firstLocalRating] aboutMe:[VLData firstLocalAboutMe] faves:[VLData firstLocalFaves] gender:[VLData firstLocalGender] age:[VLData firstLocalAge] firstSuggestion:[VLData firstLocalFirstSuggestion] secondSuggestion:[VLData firstLocalSecondSuggestion] thirdSuggeston:[VLData firstLocalThirdSuggestion] fourthSuggestion:[VLData firstLocalFourthSuggestion] firstSuggestionNote:[VLData firstLocalFirstNote] secondSuggestionNote:[VLData firstLocalSecondNote] thirdSuggestionNote:[VLData firstLocalThirdNote] fourthSuggestionNote:[VLData firstLocalFourthNote] firstSuggestionRating:[VLData firstLocalFirstSuggestionRating] secondSuggestionRating:[VLData firstLocalSecondSuggestionRating] thirdSuggestionRating:[VLData firstLocalThirdSuggestionRating] fourthSuggestionRating:[VLData firstLocalFourthSuggestionRating] firstSuggestionImageName:[VLData firstLocalFirstImage] secondSuggestionImageName:[VLData firstLocalSecondImage] thirdSuggestionImageName:[VLData firstLocalThirdImage] fourthSuggestionImageName:[VLData firstLocalFourthImage]];

    [self setCellProperties:self.secondLocalCell localName:[VLData secondLocal] imageName:[VLData secondLocalImage] localRating:[VLData secondLocalRating] aboutMe:[VLData secondLocalAboutMe] faves:[VLData secondLocalFaves] gender:[VLData secondLocalGender] age:[VLData secondLocalAge] firstSuggestion:[VLData secondLocalFirstSuggestion] secondSuggestion:[VLData secondLocalSecondSuggestion] thirdSuggeston:[VLData secondLocalThirdSuggestion] fourthSuggestion:[VLData secondLocalFourthSuggestion] firstSuggestionNote:[VLData secondLocalFirstNote] secondSuggestionNote:[VLData secondLocalSecondNote] thirdSuggestionNote:[VLData secondLocalThirdNote] fourthSuggestionNote:[VLData secondLocalFourthNote] firstSuggestionRating:[VLData secondLocalFirstSuggestionRating] secondSuggestionRating:[VLData secondLocalSecondSuggestionRating] thirdSuggestionRating:[VLData secondLocalThirdSuggestionRating] fourthSuggestionRating:[VLData secondLocalFourthSuggestionRating] firstSuggestionImageName:[VLData secondLocalFirstImage] secondSuggestionImageName:[VLData secondLocalSecondImage] thirdSuggestionImageName:[VLData secondLocalThirdImage] fourthSuggestionImageName:[VLData secondLocalFourthImage]];

    [self setCellProperties:self.thirdLocalCell localName:[VLData thirdLocal] imageName:[VLData thirdLocalImage] localRating:[VLData thirdLocalRating]aboutMe:[VLData thirdLocalAboutMe] faves:[VLData thirdLocalFaves] gender:[VLData thirdLocalGender] age:[VLData thirdLocalAge] firstSuggestion:[VLData thirdLocalFirstSuggestion] secondSuggestion:[VLData thirdLocalSecondSuggestion] thirdSuggeston:[VLData thirdLocalThirdSuggestion] fourthSuggestion:[VLData thirdLocalFourthSuggestion] firstSuggestionNote:[VLData thirdLocalFirstNote] secondSuggestionNote:[VLData thirdLocalSecondNote] thirdSuggestionNote:[VLData thirdLocalThirdNote] fourthSuggestionNote:[VLData thirdLocalFourthNote] firstSuggestionRating:[VLData thirdLocalFirstSuggestionRating] secondSuggestionRating:[VLData thirdLocalSecondSuggestionRating] thirdSuggestionRating:[VLData thirdLocalThirdSuggestionRating] fourthSuggestionRating:[VLData thirdLocalFourthSuggestionRating] firstSuggestionImageName:[VLData thirdLocalFirstImage] secondSuggestionImageName:[VLData thirdLocalSecondImage] thirdSuggestionImageName:[VLData thirdLocalThirdImage] fourthSuggestionImageName:[VLData thirdLocalFourthImage]];

    [self setCellProperties:self.fourthLocalCell localName:[VLData fourthLocal] imageName:[VLData fourthLocalImage] localRating:[VLData fourthLocalRating] aboutMe:[VLData fourthLocalAboutMe] faves:[VLData fourthLocalFaves] gender:[VLData fourthLocalGender] age:[VLData fourthLocalAge] firstSuggestion:[VLData fourthLocalFirstSuggestion] secondSuggestion:[VLData fourthLocalSecondSuggestion] thirdSuggeston:[VLData fourthLocalThirdSuggestion] fourthSuggestion:[VLData fourthLocalFourthSuggestion] firstSuggestionNote:[VLData fourthLocalFirstNote] secondSuggestionNote:[VLData fourthLocalSecondNote] thirdSuggestionNote:[VLData fourthLocalThirdNote] fourthSuggestionNote:[VLData fourthLocalFourthNote] firstSuggestionRating:[VLData fourthLocalFirstSuggestionRating] secondSuggestionRating:[VLData fourthLocalSecondSuggestionRating] thirdSuggestionRating:[VLData fourthLocalThirdSuggestionRating] fourthSuggestionRating:[VLData fourthLocalFourthSuggestionRating] firstSuggestionImageName:[VLData fourthLocalFirstImage] secondSuggestionImageName:[VLData fourthLocalSecondImage] thirdSuggestionImageName:[VLData fourthLocalThirdImage] fourthSuggestionImageName:[VLData fourthLocalFourthImage]];
}

- (void)setCellProperties:(VLLocalTableViewCell *)cell localName:(NSString *)localName imageName:(NSString *)imageName localRating:(float)localRating aboutMe:(NSString *)aboutMe faves:(NSString *)faves gender:(NSString *)gender age:(NSString *)age firstSuggestion:(NSString *)firstSuggestion secondSuggestion:(NSString *)secondSuggestion thirdSuggeston:(NSString *)thirdSuggestion fourthSuggestion:(NSString *)fourthSuggestion firstSuggestionNote:(NSString *)firstSuggestionNote secondSuggestionNote:(NSString *)secondSuggestionNote thirdSuggestionNote:(NSString *)thirdSuggestionNote fourthSuggestionNote:(NSString *)fourthSuggestionNote firstSuggestionRating:(float)firstSuggestionRating secondSuggestionRating:(float)secondSuggestionRating thirdSuggestionRating:(float)thirdSuggestionRating fourthSuggestionRating:(float)fourthSuggestionRating firstSuggestionImageName:(NSString *)firstSuggestionImageName secondSuggestionImageName:(NSString *)secondSuggestionImageName thirdSuggestionImageName:(NSString *)thirdSuggestionImageName fourthSuggestionImageName:(NSString *)fourthSuggestionImageName {
    [cell setBackgroundColor:[UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.5f]];
    [cell.profileImageView setContentMode:UIViewContentModeScaleAspectFill];
    [cell.profileImageView setImage:[UIImage imageNamed:imageName]];
    [cell.nameLabel setText:localName];
    [cell.ratingView setRating:localRating];
    cell.aboutMe = aboutMe;
    cell.faves = faves;
    cell.gender = gender;
    cell.age = age;
    
    [cell.firstSuggestion setText:firstSuggestion];
    [cell.secondSuggestion setText:secondSuggestion];
    cell.thirdSuggestion = thirdSuggestion;
    cell.fourthSuggestion = fourthSuggestion;
    
    [cell.firstSuggestionNote setText:firstSuggestionNote];
    [cell.secondSuggestionNote setText:secondSuggestionNote];
    cell.thirdSuggestionNote = thirdSuggestionNote;
    cell.fourthSuggestionNote = fourthSuggestionNote;
    
    [cell.firstSuggestionRating setRating:firstSuggestionRating];
    [cell.secondSuggestionRating setRating:secondSuggestionRating];
    cell.thirdSuggestionRating = thirdSuggestionRating;
    cell.fourthSuggestionRating = fourthSuggestionRating;
    
    cell.firstSuggestionImageString = firstSuggestionImageName;
    cell.secondSuggestionImageString = secondSuggestionImageName;
    cell.thirdSuggestionImageString = thirdSuggestionImageName;
    cell.fourthSuggestionImageString = fourthSuggestionImageName;
    [cell setDelegate:self];
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
    NSString *location;
    if (![[self.currentUser objectForKey:[VLConstants kCityFieldKey]] isEqualToString:@""] && ![[self.currentUser objectForKey:[VLConstants kCountryFieldKey]] isEqualToString:@""]) {
        location = [[[self.currentUser objectForKey:[VLConstants kCityFieldKey]] stringByAppendingString:@", "] stringByAppendingString:[self.currentUser objectForKey:[VLConstants kCountryFieldKey]]];
    } else {
        location = [VLConstants kLocationMessage];
    }

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
