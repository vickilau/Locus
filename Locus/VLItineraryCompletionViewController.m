//
//  VLItineraryCompletionViewController.m
//  Locus
//
//  Created by Vicki Lau on 11/28/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import "VLItineraryCompletionViewController.h"

@implementation VLItineraryCompletionViewController

- (instancetype)initWithActivityName:(NSString *)activityName indexPath:(NSIndexPath *)indexPath {
    if (self = [super init]) {
        _currentUser = [PFUser currentUser];
        
        _indexPath = indexPath;
        
        _activityName = [[UILabel alloc] init];
        [_activityName setText:activityName];
        [_activityName setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline]];
        [_activityName setTextAlignment:NSTextAlignmentCenter];
        _activityRating = [[RateView alloc] initWithFrame:CGRectZero];
        [_activityRating setNotSelectedImage:[UIImage imageNamed:@"emptyHeart.png"]];
        [_activityRating setHalfSelectedImage:[UIImage imageNamed:@"halfHeart.png"]];
        [_activityRating setFullSelectedImage:[UIImage imageNamed:@"fullHeart.png"]];
        [_activityRating setEditable:YES];
        [_activityRating setMaxRating:5];
        _activityNote = [[UITextField alloc] initWithFrame:CGRectZero];
        [_activityNote setPlaceholder:[VLConstants kPlaceholderSaveActivityNoteString]];
        [_activityNote setBorderStyle:UITextBorderStyleRoundedRect];
        [_activityNote setBackgroundColor:[UIColor whiteColor]];
        _ratingMessage = [[UILabel alloc] initWithFrame:CGRectZero];
        [_ratingMessage setText:[VLConstants kActivityRatingMessage]];
        [_ratingMessage setTextColor:[UIColor colorWithRed:153.0/255.0 green:102.0/255.0 blue:102.0/255.0 alpha:1.0]];
        [_ratingMessage setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleTitle2]];
        [_ratingMessage setTextAlignment:NSTextAlignmentCenter];
        
        _submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_submitButton setTitle:@"Submit" forState:UIControlStateNormal];
        [_submitButton addTarget:self action:@selector(completeActivity) forControlEvents:UIControlEventTouchUpInside];
        [_submitButton setTitleColor:[UIColor colorWithRed:51/255.0 green:153.0/255.0 blue:255.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        _cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
        [_cancelButton addTarget:self action:@selector(cancelActivity) forControlEvents:UIControlEventTouchUpInside];
        [_cancelButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [self setButtonProperties:_submitButton];
        [self setButtonProperties:_cancelButton];
        [self.view setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}

- (void)setButtonProperties:(UIButton *)button {
    [VLUtilities makeRound:button];
    [button.titleLabel setFont:[UIFont systemFontOfSize:18]];
    [button setBackgroundColor:[UIColor colorWithRed:1 green:204.0/255.0 blue:204.0/255.0 alpha:1.0]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.activityName];
    [self.view addSubview:self.activityRating];
    [self.view addSubview:self.ratingMessage];
    [self.view addSubview:self.activityNote];
    [self.view addSubview:self.submitButton];
    [self.view addSubview:self.cancelButton];
}

- (void)viewWillLayoutSubviews {
    [self.ratingMessage setFrame:CGRectMake(20, 20, self.view.bounds.size.width - 40, 30)];
    [self.activityName setFrame:CGRectMake(20, CGRectGetMaxY(self.ratingMessage.frame) + 10, self.view.bounds.size.width - 40, 20)];
    [self.activityRating setFrame:CGRectMake(20, CGRectGetMaxY(self.activityName.frame) + 20, self.view.bounds.size.width - 40, 20)];
    [self.activityNote setFrame:CGRectMake(20, CGRectGetMaxY(self.activityRating.frame) + 20, self.view.bounds.size.width - 40, 20)];
    [self.submitButton setFrame:CGRectMake((self.view.bounds.size.width/2) - 75, CGRectGetMaxY(self.activityNote.frame) + 20, 70, 30)];
    [self.cancelButton setFrame:CGRectMake((self.view.bounds.size.width/2) + 5, CGRectGetMaxY(self.activityNote.frame) + 20, 70, 30)];
}

- (void)completeActivity {
    id<VLItineraryCompletionViewControllerDelegate> strongDelegate = self.delegate;
    [strongDelegate didSaveCancelCompleteActivity:self.indexPath remove:YES];
    
    PFQuery *query = [PFQuery queryWithClassName:[VLConstants kActivityClass]];
    [query whereKey:[VLConstants kActivityNameKey] equalTo:_activityName.text];
    [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
        if (!object) {
            PFObject *object = [PFObject objectWithClassName:[VLConstants kActivityClass]];
            NSMutableArray *comments = [[NSMutableArray alloc]initWithObjects:_activityNote.text, nil];
            NSMutableArray *ratings = [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithFloat:_activityRating.rating], nil];
            object[[VLConstants kActivityCommentsKey]] = comments;
            object[[VLConstants kActivityRatingsKey]] = ratings;
            object[[VLConstants kActivityNameKey]] = _activityName.text;
            [object saveInBackground];
        } else {
            NSMutableArray *comments = object[[VLConstants kActivityCommentsKey]];
            [comments addObject:_activityNote.text];
            NSMutableArray *ratings = object[[VLConstants kActivityRatingsKey]];
            [ratings addObject:[NSNumber numberWithFloat:_activityRating.rating]];
            object[[VLConstants kActivityCommentsKey]] = comments;
            object[[VLConstants kActivityRatingsKey]] = ratings;
            [object saveInBackground];
        }
    }];
}

- (void)cancelActivity {
    id<VLItineraryCompletionViewControllerDelegate> strongDelegate = self.delegate;
    [strongDelegate didSaveCancelCompleteActivity:self.indexPath remove:NO];

}
@end
