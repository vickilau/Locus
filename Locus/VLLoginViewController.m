//
//  VLLoginViewController.m
//  Locus
//
//  Created by Vicki Lau on 11/18/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import "VLLoginViewController.h"

@implementation VLLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    UIImageView *logoView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.png"]];
    [logoView setContentMode:UIViewContentModeScaleAspectFit];
    self.logInView.logo = logoView;
}

@end
