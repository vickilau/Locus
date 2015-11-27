//
//  VLConnectLocalsErrorViewController.m
//  Locus
//
//  Created by Vicki Lau on 11/25/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import "VLConnectLocalsErrorViewController.h"

NSString *kNeedLocationErrorMessage = @"We cannot connect you with locals without a location. Please set a location for your trip by clicking the \"Trip\" tab and filling in the \"City\" and \"Country\" field or clicking the \"Use Current Location\" button.";

@implementation VLConnectLocalsErrorViewController

- (instancetype) init {
    if (self = [super init]) {
        _needLocationBlurb = [[UITextView alloc] initWithFrame:CGRectZero];
        
        [_needLocationBlurb setText:kNeedLocationErrorMessage];
        [_needLocationBlurb setTextColor:[UIColor colorWithRed:153.0/255.0 green:102.0/255.0 blue:102.0/255.0 alpha:1.0]];
        [_needLocationBlurb setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleTitle2]];
        [_needLocationBlurb setTextContainerInset:UIEdgeInsetsMake(20, 20, 20, 20)];
    }
    return self;
}

- (void)viewDidLoad {
    [self.view addSubview:self.needLocationBlurb];
}

- (void)viewDidLayoutSubviews {
    [self.needLocationBlurb setFrame:self.view.bounds];
}

@end
