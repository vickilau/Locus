//
//  VLLocalSuggestionsTableViewCell.m
//  Locus
//
//  Created by Vicki Lau on 11/25/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import "VLLocalSuggestionsTableViewCell.h"

@implementation VLLocalSuggestionsTableViewCell

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
    
    CGFloat mainRowHeight = self.frame.size.height - 30;

    [self.suggestionImageView setFrame:CGRectMake(0, 0, self.frame.size.height, self.frame.size.height)];

    CGFloat rowWidth = self.frame.size.width - CGRectGetMaxX(self.suggestionImageView.frame) - 15;

    [self.addSuggestion setFrame:CGRectMake(self.frame.size.width - 10 - (mainRowHeight * 0.3), 10, mainRowHeight * 0.3, mainRowHeight * 0.3)];
    
    [self.suggestionLabel setFrame:CGRectMake(CGRectGetMaxX(self.suggestionImageView.frame) + 5, 10, rowWidth - CGRectGetWidth(self.addSuggestion.frame) - 5, mainRowHeight * 0.3)];
    
    [self.suggestionRating setFrame:CGRectMake(CGRectGetMaxX(self.suggestionImageView.frame) + 5, CGRectGetMaxY(self.suggestionLabel.frame) + 5, rowWidth, mainRowHeight * 0.2)];
    
    [self.suggestionNote setFrame:CGRectMake(CGRectGetMaxX(self.suggestionImageView.frame) + 5, CGRectGetMaxY(self.suggestionRating.frame) + 5, rowWidth, [VLUtilities getHeightOfLabel:self.suggestionNote width:rowWidth])];
}

- (void)setProperties {
    _currentUser = [PFUser currentUser];
    
    _suggestionRating = [[RateView alloc] init];
    [_suggestionRating setNotSelectedImage:[UIImage imageNamed:@"emptyHeart.png"]];
    [_suggestionRating setHalfSelectedImage:[UIImage imageNamed:@"halfHeart.png"]];
    [_suggestionRating setFullSelectedImage:[UIImage imageNamed:@"fullHeart.png"]];
    [_suggestionRating setEditable:NO];
    [_suggestionRating setMaxRating:5];
    
    _suggestionImageView = [[UIImageView alloc] init];
    
    _suggestionLabel = [[UILabel alloc] init];
    [_suggestionLabel setTextColor:[UIColor colorWithRed:153.0/255.0 green:102.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [_suggestionLabel setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleTitle2]];
    [_suggestionLabel setTextAlignment:NSTextAlignmentCenter];
    
    _suggestionNote = [[UILabel alloc] init];
    [_suggestionNote setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleBody]];
    
    _addSuggestion = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [_addSuggestion addTarget:self action:@selector(addSuggestion:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)addPropertiesAsSubviews {
    [self.contentView addSubview:_suggestionImageView];
    [self.contentView addSubview:_suggestionLabel];
    [self.contentView addSubview:_suggestionRating];
    [self.contentView addSubview:_suggestionNote];
    [self.contentView addSubview:_addSuggestion];
}

- (void)addSuggestion:(id)sender {
    UIButton *buttonClicked = (UIButton *)sender;
    NSString *suggestion = [[NSString alloc] init];
    suggestion = [@"Location: " stringByAppendingString:[[_suggestionLabel.text stringByAppendingString:@"\nLocal's Note: "] stringByAppendingString:_suggestionNote.text]];
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Add To My Itinerary"
                                                                   message:suggestion
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * action) {}];
    UIAlertAction* saveAction = [UIAlertAction actionWithTitle:@"Save" style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * action) {
                                                           NSString *note = ((UITextField *)[alert.textFields objectAtIndex:0]).text;
                                                           NSMutableArray *activityNotes = [self.currentUser objectForKey:@"activityNote"];
                                                           if (activityNotes) {
                                                               [activityNotes addObject:note];
                                                           } else {
                                                               activityNotes = [[NSMutableArray alloc] initWithObjects:note, nil];
                                                           }
                                                           [self.currentUser setObject:activityNotes forKey:@"activityNote"];
                                                           
                                                           NSMutableArray *itinerary = [self.currentUser objectForKey:@"itinerary"];
                                                           if (itinerary) {
                                                               [itinerary addObject:suggestion];
                                                           } else {
                                                               itinerary = [[NSMutableArray alloc] initWithObjects:suggestion, nil];
                                                           }
                                                           [self.currentUser setObject:itinerary forKey:@"itinerary"];
                                                           [self.currentUser saveInBackground];
                                                       }];
    
    [alert addAction:saveAction];
    [alert addAction:cancelAction];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = NSLocalizedString(@"Add your notes about this activity.", @"Add your notes about this activity.");
    }];
    
    id<VLLocalSuggestionsTableViewCellDelegate> strongDelegate = self.delegate;
    [strongDelegate didAddToItinerary:alert];
}


@end
