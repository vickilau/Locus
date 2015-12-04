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

    [self.suggestionImageView setFrame:CGRectMake(0, (self.frame.size.height - (self.frame.size.width * 0.4))/2 - 20, self.frame.size.width * 0.4, self.frame.size.width * 0.4)];

    CGFloat rowWidth = self.frame.size.width - CGRectGetMaxX(self.suggestionImageView.frame) - 15;
    
    [self.commentsButton setFrame:CGRectMake(CGRectGetWidth(self.suggestionImageView.frame)/2 - 15, CGRectGetMaxY(self.suggestionImageView.frame) + 10, 30, 30)];
    [self.addSuggestion setFrame:CGRectMake(self.frame.size.width - 20 - 10, 25, 20, 20)];
    
    [self.suggestionLabel setFrame:CGRectMake(CGRectGetMaxX(self.suggestionImageView.frame) + 5, 10, rowWidth - CGRectGetWidth(self.addSuggestion.frame), mainRowHeight * 0.3)];
    
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
    [_suggestionImageView setContentMode:UIViewContentModeScaleAspectFill];
    [_suggestionImageView setClipsToBounds:YES];
    [_suggestionImageView setUserInteractionEnabled:YES];
    UITapGestureRecognizer *singleTap =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showComments)];
    [singleTap setNumberOfTapsRequired:1];
    [_suggestionImageView addGestureRecognizer:singleTap];

    
    _suggestionLabel = [[UILabel alloc] init];
    [_suggestionLabel setTextColor:[UIColor colorWithRed:153.0/255.0 green:102.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [_suggestionLabel setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleTitle2]];
    [_suggestionLabel setTextAlignment:NSTextAlignmentCenter];
    
    _suggestionNote = [[UILabel alloc] init];
    [_suggestionNote setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleBody]];
    
    _addSuggestion = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [_addSuggestion addTarget:self action:@selector(addSuggestion:) forControlEvents:UIControlEventTouchUpInside];
    
    _commentsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_commentsButton setImage:[UIImage imageNamed:@"comments.png"] forState:UIControlStateNormal];
    [_commentsButton addTarget:self action:@selector(showComments) forControlEvents:UIControlEventTouchUpInside];
}

- (void)addPropertiesAsSubviews {
    [self.contentView addSubview:_suggestionImageView];
    [self.contentView addSubview:_suggestionLabel];
    [self.contentView addSubview:_suggestionRating];
    [self.contentView addSubview:_suggestionNote];
    [self.contentView addSubview:_addSuggestion];
    [self.contentView addSubview:_commentsButton];
}

- (void)addSuggestion:(id)sender {
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
                                                           NSMutableArray *activityNotes = [self.currentUser objectForKey:[VLConstants kActivityNoteArrayKey]];
                                                           if (activityNotes) {
                                                               [activityNotes addObject:note];
                                                           } else {
                                                               activityNotes = [[NSMutableArray alloc] initWithObjects:note, nil];
                                                           }
                                                           [self.currentUser setObject:activityNotes forKey:[VLConstants kActivityNoteArrayKey]];
                                                           
                                                           NSMutableArray *itinerary = [self.currentUser objectForKey:[VLConstants kItineraryArrayKey]];
                                                           if (itinerary) {
                                                               [itinerary addObject:_suggestionLabel.text];
                                                           } else {
                                                               itinerary = [[NSMutableArray alloc] initWithObjects:_suggestionLabel.text, nil];
                                                           }
                                                           [self.currentUser setObject:itinerary forKey:[VLConstants kItineraryArrayKey]];
                                                           
                                                           [self.currentUser saveInBackground];
                                                       }];
    
    [alert addAction:saveAction];
    [alert addAction:cancelAction];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        [textField setPlaceholder:[VLConstants kPlaceholderSaveActivityNoteString]];
    }];
    
    id<VLLocalSuggestionsTableViewCellDelegate> strongDelegate = self.delegate;
    [strongDelegate didAddToItinerary:alert];
}

- (void)showComments {
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    spinner.frame = CGRectMake(CGRectGetMaxX(self.commentsButton.frame) + 5, CGRectGetMinY(self.commentsButton.frame), 24, 24);
    //self.accessoryView = spinner;
    [self addSubview:spinner];
    [spinner hidesWhenStopped];
    [spinner startAnimating];
    id<VLLocalSuggestionsTableViewCellDelegate> strongDelegate = self.delegate;
    [strongDelegate didClickToViewComments:self.suggestionLabel.text spinner:spinner];

}

@end
