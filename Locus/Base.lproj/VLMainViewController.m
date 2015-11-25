//
//  VLMainViewController.m
//  Locus
//
//  Created by Vicki Lau on 11/24/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import "VLMainViewController.h"

@implementation VLMainViewController

- (instancetype)init{
    if (self = [super init]) {
        _containerView = [[UIView alloc] initWithFrame:CGRectZero];
        _profilePicView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _actionButton = [[UIButton alloc] initWithFrame:CGRectZero];
        _logoutButton = [[UIButton alloc] initWithFrame:CGRectZero];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:self.containerView];
    [self.view addSubview:self.profilePicView];
    [self.view addSubview:self.actionButton];
    [self.view addSubview:self.logoutButton];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

}

@end
