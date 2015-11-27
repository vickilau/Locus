//
//  VLTravelStyleViewController.m
//  Locus
//
//  Created by Vicki Lau on 11/25/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import "VLTravelStyleViewController.h"

NSString *kNoTravelStyleMessage = @"You have not built your travel style yet. Click the \"Build\" button above to get started!";
NSString *kInstructionsMessage = @"Doesn't seem right? No problem! Click the \"Build\" button at the top to rebuild your travel style!";

@implementation VLTravelStyleViewController

- (instancetype)init {
    if (self = [super init]) {
        _travelStyleBlurb = [[UITextView alloc] initWithFrame:CGRectZero];
        _currentUser = [PFUser currentUser];

        [_travelStyleBlurb setTextColor:[UIColor blackColor]];
        [_travelStyleBlurb setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleTitle2]];
        [_travelStyleBlurb setTextContainerInset:UIEdgeInsetsMake(20, 20, 20, 20)];
        
        if ([_currentUser objectForKey:@"travelStyle"]) {
            _instructionsBlurb = [[UITextView alloc] initWithFrame:CGRectZero];
            [_instructionsBlurb setTextColor:[UIColor colorWithRed:153.0/255.0 green:102.0/255.0 blue:102.0/255.0 alpha:1.0]];
            [_instructionsBlurb setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleTitle3]];
            [_instructionsBlurb setTextContainerInset:UIEdgeInsetsMake(20, 20, 20, 20)];
            [_instructionsBlurb setText:kInstructionsMessage];
            
            [_travelStyleBlurb setText:[_currentUser objectForKey:@"travelStyle"]];

        } else {
            [_travelStyleBlurb setText:kNoTravelStyleMessage];
            [_travelStyleBlurb setTextColor:[UIColor colorWithRed:153.0/255.0 green:102.0/255.0 blue:102.0/255.0 alpha:1.0]];
        }
    }
    return self;
}

- (void)viewDidLoad {
    [self.view addSubview:self.travelStyleBlurb];
    [self.view addSubview:self.instructionsBlurb];
}

- (void)viewDidLayoutSubviews {
    if ([self.currentUser objectForKey:@"travelStyle"]) {
        [self.travelStyleBlurb setFrame:CGRectMake(self.view.bounds.origin.x, self.view.bounds.origin.y, self.view.bounds.size.width, 350)];
        [self.instructionsBlurb setFrame:CGRectMake(self.view.bounds.origin.x, CGRectGetMaxY(self.travelStyleBlurb.bounds), self.view.bounds.size.width, self.view.bounds.size.height)];
    } else {
        [self.travelStyleBlurb setFrame:self.view.bounds];
    }
}

@end
