//
//  VLLocalTableViewCell.m
//  Locus
//
//  Created by Vicki Lau on 11/25/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import "VLLocalTableViewCell.h"

NSString *kItineraryFieldKey = @"itinerary";
NSString *kActivityNoteKey = @"activityNote";

@implementation VLLocalTableViewCell

- (instancetype)init {
    if (self = [super init]) {
        [self setProperties];
        [self addPropertiesAsSubviews];
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat mainRowHeight = (self.frame.size.height - 30) * 0.4;
    CGFloat subRowHeight = (self.frame.size.height - 30) * 0.3;
    CGFloat rowWidth = self.frame.size.width - CGRectGetMaxX(self.profileImageView.frame) - 15;
    
    [self.profileImageView setFrame:CGRectMake(10, (self.frame.size.height - (self.frame.size.width * 0.35))/2, self.frame.size.width * 0.35, self.frame.size.width * 0.35)];
    [VLUtilities makeCircle:self.profileImageView];
    
    [self.viewProfileButton setFrame:CGRectMake(self.frame.size.width - 10 - mainRowHeight, 10, mainRowHeight, mainRowHeight)];
    [self.nameLabel setFrame:CGRectMake(CGRectGetMaxX(self.profileImageView.frame) + 5, 10, rowWidth - CGRectGetWidth(self.viewProfileButton.frame), mainRowHeight * 0.6)];
    [self.ratingView setFrame:CGRectMake(CGRectGetMaxX(self.profileImageView.frame) + 10, CGRectGetMaxY(self.nameLabel.frame), rowWidth - CGRectGetWidth(self.viewProfileButton.frame), mainRowHeight * 0.4)];
    
    [self.firstSuggestion setFrame:CGRectMake(CGRectGetMaxX(self.profileImageView.frame) + 5, CGRectGetMaxY(self.ratingView.frame) + 5, rowWidth * 0.5, subRowHeight * 0.6)];
    [self.firstSuggestionRating setFrame:CGRectMake(CGRectGetMaxX(self.firstSuggestion.frame) + 5, CGRectGetMaxY(self.ratingView.frame) + 5, rowWidth * 0.5, subRowHeight * 0.6)];
    [self.addFirstSuggestion setFrame:CGRectMake(self.frame.size.width - 10 - (subRowHeight * 0.4), CGRectGetMaxY(self.firstSuggestion.frame), subRowHeight * 0.4, subRowHeight * 0.4)];
    [self.firstSuggestionNote setFrame:CGRectMake(CGRectGetMaxX(self.profileImageView.frame) + 5, CGRectGetMaxY(self.firstSuggestion.frame), rowWidth - CGRectGetWidth(self.addFirstSuggestion.frame), subRowHeight * 0.4)];
    
    
    [self.secondSuggestion setFrame:CGRectMake(CGRectGetMaxX(self.profileImageView.frame) + 5, CGRectGetMaxY(self.firstSuggestionNote.frame) + 5, rowWidth * 0.5, subRowHeight * 0.6)];
    [self.secondSuggestionRating setFrame:CGRectMake(CGRectGetMaxX(self.secondSuggestion.frame) + 5, CGRectGetMaxY(self.firstSuggestionNote.frame) + 5, rowWidth * 0.5, subRowHeight * 0.6)];
    [self.addSecondSuggestion setFrame:CGRectMake(self.frame.size.width - 10 - (subRowHeight * 0.4), CGRectGetMaxY(self.secondSuggestion.frame), subRowHeight * 0.4, subRowHeight * 0.4)];
    [self.secondSuggestionNote setFrame:CGRectMake(CGRectGetMaxX(self.profileImageView.frame) + 5, CGRectGetMaxY(self.secondSuggestion.frame), rowWidth - CGRectGetWidth(self.addSecondSuggestion.frame), subRowHeight * 0.4)];
}

- (void)setProperties {
    _ratingView = [[RateView alloc] init];
    [_ratingView setNotSelectedImage:[UIImage imageNamed:@"emptyStar.png"]];
    [_ratingView setHalfSelectedImage:[UIImage imageNamed:@"halfStar.png"]];
    [_ratingView setFullSelectedImage:[UIImage imageNamed:@"fullStar.png"]];
    [_ratingView setEditable:NO];
    [_ratingView setMaxRating:5];
    
    _firstSuggestionRating = [[RateView alloc] init];
    [_firstSuggestionRating setNotSelectedImage:[UIImage imageNamed:@"emptyHeart.png"]];
    [_firstSuggestionRating setHalfSelectedImage:[UIImage imageNamed:@"halfHeart.png"]];
    [_firstSuggestionRating setFullSelectedImage:[UIImage imageNamed:@"fullHeart.png"]];
    [_firstSuggestionRating setEditable:NO];
    [_firstSuggestionRating setMaxRating:5];
    
    _secondSuggestionRating = [[RateView alloc] init];
    [_secondSuggestionRating setNotSelectedImage:[UIImage imageNamed:@"emptyHeart.png"]];
    [_secondSuggestionRating setHalfSelectedImage:[UIImage imageNamed:@"halfHeart.png"]];
    [_secondSuggestionRating setFullSelectedImage:[UIImage imageNamed:@"fullHeart.png"]];
    [_secondSuggestionRating setEditable:NO];
    [_secondSuggestionRating setMaxRating:5];
    
    _profileImageView = [[UIImageView alloc] init];
    
    _nameLabel = [[UILabel alloc] init];
    [_nameLabel setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleTitle2]];
    [_nameLabel setTextColor:[UIColor colorWithRed:153.0/255.0 green:102.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [_nameLabel setTextAlignment:NSTextAlignmentCenter];
    
    _firstSuggestion = [[UILabel alloc] init];
    [_firstSuggestion setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline]];
    
    _secondSuggestion = [[UILabel alloc] init];
    [_secondSuggestion setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline]];
    
    _viewProfileButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_viewProfileButton setImage:[UIImage imageNamed:@"viewProfile.png"] forState:UIControlStateNormal];
    [_viewProfileButton addTarget:self action:@selector(viewProfile:) forControlEvents:UIControlEventTouchUpInside];
    
    _addFirstSuggestion = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [_addFirstSuggestion setTag:1];
    [_addFirstSuggestion addTarget:self action:@selector(addSuggestion:) forControlEvents:UIControlEventTouchUpInside];
    
    _addSecondSuggestion = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [_addSecondSuggestion setTag:2];
    [_addSecondSuggestion addTarget:self action:@selector(addSuggestion:) forControlEvents:UIControlEventTouchUpInside];

    _firstSuggestionNote = [[UILabel alloc] init];
    _secondSuggestionNote = [[UILabel alloc] init];

}

- (void)addPropertiesAsSubviews {
    [self.contentView addSubview:_ratingView];
    [self.contentView addSubview:_profileImageView];
    [self.contentView addSubview:_nameLabel];
    [self.contentView addSubview:_viewProfileButton];
    [self.contentView addSubview:_firstSuggestion];
    [self.contentView addSubview:_firstSuggestionRating];
    [self.contentView addSubview:_firstSuggestionNote];
    [self.contentView addSubview:_addFirstSuggestion];
    [self.contentView addSubview:_secondSuggestion];
    [self.contentView addSubview:_secondSuggestionRating];
    [self.contentView addSubview:_secondSuggestionNote];
    [self.contentView addSubview:_addSecondSuggestion];
}

- (void)viewProfile:(id)sender {
    id<VLLocalTableViewCellDelegate> strongDelegate = self.delegate;
    [strongDelegate didClickToViewProfile:self];
}

- (void)addSuggestion:(id)sender {
    UIButton *buttonClicked = (UIButton *)sender;
    NSString *suggestion = [[NSString alloc] init];
    switch (buttonClicked.tag) {
        case 1:
            suggestion = [@"Location: " stringByAppendingString:[[_firstSuggestion.text stringByAppendingString:@"\nLocal's Note: "] stringByAppendingString:_firstSuggestionNote.text]];
            break;
        case 2:
            suggestion = [@"Location: " stringByAppendingString:[[_secondSuggestion.text stringByAppendingString:@"\nLocal's Note: "] stringByAppendingString:_secondSuggestionNote.text]];
            break;
        default:
            break;
    }
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Add To My Itinerary"
                                                                   message:suggestion
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * action) {}];
    UIAlertAction* saveAction = [UIAlertAction actionWithTitle:@"Save" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              PFUser *currentUser = [PFUser currentUser];
                                                              
                                                              NSString *note = ((UITextField *)[alert.textFields objectAtIndex:0]).text;
                                                              NSMutableArray *activityNotes = [currentUser objectForKey:kActivityNoteKey];
                                                              if (activityNotes) {
                                                                  [activityNotes addObject:note];
                                                              } else {
                                                                  activityNotes = [[NSMutableArray alloc] initWithObjects:note, nil];
                                                              }
                                                              [currentUser setObject:activityNotes forKey:kActivityNoteKey];
                                                              
                                                              NSMutableArray *itinerary = [currentUser objectForKey:kItineraryFieldKey];
                                                              if (itinerary) {
                                                                  [itinerary addObject:suggestion];
                                                              } else {
                                                                  itinerary = [[NSMutableArray alloc] initWithObjects:suggestion, nil];
                                                              }
                                                              [currentUser setObject:itinerary forKey:kItineraryFieldKey];
                                                              [currentUser saveInBackground];
                                                          }];
    
    [alert addAction:saveAction];
    [alert addAction:cancelAction];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
         textField.placeholder = NSLocalizedString(@"Add your notes about this activity.", @"Add your notes about this activity.");
     }];
    id<VLLocalTableViewCellDelegate> strongDelegate = self.delegate;
    [strongDelegate didAddToItinerary:alert];
}

@end
