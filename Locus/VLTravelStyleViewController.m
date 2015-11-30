//
//  VLTravelStyleViewController.m
//  Locus
//
//  Created by Vicki Lau on 11/25/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import "VLTravelStyleViewController.h"

@implementation VLTravelStyleViewController

- (instancetype)init {
    if (self = [super init]) {
        _travelStyleBlurb = [[UITextView alloc] initWithFrame:CGRectZero];
        _instructionsBlurb = [[UITextView alloc] initWithFrame:CGRectZero];
        _currentUser = [PFUser currentUser];
        
        [self.instructionsBlurb setTextColor:[UIColor colorWithRed:153.0/255.0 green:102.0/255.0 blue:102.0/255.0 alpha:1.0]];
        [self.instructionsBlurb setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleTitle3]];
        [self.instructionsBlurb setTextContainerInset:UIEdgeInsetsMake(20, 20, 20, 20)];
        [self.travelStyleBlurb setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleTitle2]];
        [self.travelStyleBlurb setTextContainerInset:UIEdgeInsetsMake(20, 20, 20, 20)];

    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if ([self.currentUser objectForKey:[VLConstants kTravelStyleKey]]) {
        [self.instructionsBlurb setText:[VLConstants kTravelStyleInstructionsMessage]];
        [self.travelStyleBlurb setText:[_currentUser objectForKey:[VLConstants kTravelStyleKey]]];
        [self.travelStyleBlurb setTextColor:[UIColor blackColor]];
        
    } else {
        [self.travelStyleBlurb setText:[VLConstants kNoTravelStyleMessage]];
        [self.travelStyleBlurb setTextColor:[UIColor colorWithRed:153.0/255.0 green:102.0/255.0 blue:102.0/255.0 alpha:1.0]];
    }
    [self viewDidLayoutSubviews];

}

- (void)viewDidLoad {
    [self.view addSubview:self.travelStyleBlurb];
    [self.view addSubview:self.instructionsBlurb];
}

- (void)viewDidLayoutSubviews {
    if ([self.currentUser objectForKey:[VLConstants kTravelStyleKey]]) {
        [self.travelStyleBlurb setFrame:CGRectMake(self.view.bounds.origin.x, self.view.bounds.origin.y, self.view.bounds.size.width, 350)];
        [self.instructionsBlurb setFrame:CGRectMake(self.view.bounds.origin.x, CGRectGetMaxY(self.travelStyleBlurb.bounds), self.view.bounds.size.width, self.view.bounds.size.height)];
    } else {
        [self.travelStyleBlurb setFrame:self.view.bounds];
    }
}

@end
