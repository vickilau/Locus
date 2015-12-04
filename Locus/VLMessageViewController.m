//
//  VLMessageViewController.m
//  Locus
//
//  Created by Vicki Lau on 11/28/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import "VLMessageViewController.h"

@implementation VLMessageViewController

- (instancetype) init {
    if (self = [super init]) {
        _message = [[UITextView alloc] initWithFrame:CGRectZero];
        [_message setTextColor:[UIColor colorWithRed:153.0/255.0 green:102.0/255.0 blue:102.0/255.0 alpha:1.0]];
        [_message setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleTitle2]];
        [_message setTextContainerInset:UIEdgeInsetsMake(10, 10, 10, 10)];
        [_message setClipsToBounds:YES];
        [_message setEditable:NO];
    }
    return self;
}

- (void)viewDidLoad {
    [self.view addSubview:self.message];
}

- (void)viewDidLayoutSubviews {
    [self.message setFrame:self.view.bounds];
}
@end
