//
//  VLQuizViewController.m
//  Locus
//
//  Created by Vicki Lau on 11/24/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import "VLQuizViewController.h"

@implementation VLQuizViewController

- (instancetype)init {
    if (self = [super init]) {
        _index = 0;
        _progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
        _currentImageView = [[UIImageView alloc] initWithImage:[self imageAtIndex:_index] highlightedImage:[self imageAtIndex:_index]];
        [_currentImageView setContentMode:UIViewContentModeScaleAspectFill];
        [_currentImageView setClipsToBounds:YES];
        _dislikeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _likeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _travelStyleBlurb = [[UITextView alloc] initWithFrame:CGRectZero];
        [self.travelStyleBlurb setHidden:YES];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.dislikeButton setImage:[UIImage imageNamed:@"left.png"] forState:UIControlStateNormal];
    [self.dislikeButton setImageEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 0)];
    [self.dislikeButton setTitle:@"Dislike" forState:UIControlStateNormal];
    [self.dislikeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.dislikeButton setBackgroundColor:[UIColor clearColor]];
    [self.dislikeButton.titleLabel  setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleTitle2]];
    [self.dislikeButton setEnabled:NO];
    [self.view addSubview:self.dislikeButton];
    
    [self.likeButton setImage:[UIImage imageNamed:@"right.png"] forState:UIControlStateNormal];
    [self.likeButton setImageEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 0)];
    [self.likeButton setTitle:@"Like" forState:UIControlStateNormal];
    [self.likeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.likeButton setBackgroundColor:[UIColor clearColor]];
    [self.likeButton.titleLabel  setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleTitle2]];
    [self.likeButton setEnabled:NO];
    [self.view addSubview:self.likeButton];
    
    [self.travelStyleBlurb setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleTitle3]];
    [self.travelStyleBlurb setTextColor:[UIColor blackColor]];
    [self.travelStyleBlurb setText:[VLConstants kDefaultTravelStyle]];
    [self.travelStyleBlurb setClipsToBounds:YES];
    [_travelStyleBlurb setTextContainerInset:UIEdgeInsetsMake(5, 5, 5, 5)];
    [VLUtilities makeRound:self.travelStyleBlurb];
    
    PFUser *currentUser = [PFUser currentUser];
    [currentUser setObject:[VLConstants kDefaultTravelStyle] forKey:[VLConstants kTravelStyleKey]];
    [[PFUser currentUser] saveInBackground];
    
    UISwipeGestureRecognizer *swipeLeftGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeLeftGesture:)];
    [swipeLeftGestureRecognizer setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.view addGestureRecognizer:swipeLeftGestureRecognizer];
    
    UISwipeGestureRecognizer *swipeRightGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeRightGesture:)];
    [swipeRightGestureRecognizer setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.view addGestureRecognizer:swipeRightGestureRecognizer];
    
    [self.view addSubview:self.progressView];
    [self.view addSubview:self.currentImageView];
    [self.view addSubview:self.dislikeButton];
    [self.view addSubview:self.likeButton];
    [self.view addSubview:self.travelStyleBlurb];
}

- (void)viewDidLayoutSubviews {
    [self.currentImageView setFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 90)];
    [self.progressView setFrame:CGRectMake(0, self.view.bounds.size.height - 20, self.view.bounds.size.width, 30)];
    [self.dislikeButton setFrame:CGRectMake(30, CGRectGetMaxY(self.currentImageView.frame) + 20, self.view.bounds.size.width/3, 30)];
    [self.likeButton setFrame:CGRectMake(self.view.bounds.size.width - 10 - (self.view.bounds.size.width/3), CGRectGetMaxY(self.currentImageView.frame) + 20, self.view.bounds.size.width/3, 30)];
    [self.travelStyleBlurb setFrame:CGRectMake(10, self.view.bounds.size.height/2, self.view.bounds.size.width - 20, self.view.bounds.size.height/2 - 10)];
}

- (void)handleSwipeLeftGesture:(UISwipeGestureRecognizer *)swipeGestureRecognizer {
    [self progressAfterSwipeGesture];
}

- (void)handleSwipeRightGesture:(UISwipeGestureRecognizer *)swipeGestureRecognizer {
    [self progressAfterSwipeGesture];
}

- (void)progressAfterSwipeGesture {
    self.index++;
    if (self.index > 8) {
        [self.progressView setProgress:(self.index)/9.0];
        [self.dislikeButton setHidden:YES];
        [self.likeButton setHidden:YES];
        [self.travelStyleBlurb setHidden:NO];
        id<VLQuizViewControllerDelegate> strongDelegate = self.delegate;
        [strongDelegate VLQuizViewControllerDidFinishQuiz];
    } else {
        [self.progressView setProgress:(self.index)/9.0];
        [self.currentImageView setImage:[self imageAtIndex:self.index]];
        [self.view setNeedsDisplay];
    }
}

- (UIImage *)imageAtIndex:(NSUInteger)index {
    switch (index) {
        case 0:
            return [UIImage imageNamed:@"bar.jpg"];
            break;
        case 1:
            return [UIImage imageNamed:@"beach.jpeg"];
            break;
        case 2:
            return [UIImage imageNamed:@"cliffdiving.jpg"];
            break;
        case 3:
            return [UIImage imageNamed:@"dining.jpeg"];
            break;
        case 4:
            return [UIImage imageNamed:@"eiffeltower.jpg"];
            break;
        case 5:
            return [UIImage imageNamed:@"hiking.jpeg"];
            break;
        case 6:
            return [UIImage imageNamed:@"outdoorbazaar.jpeg"];
            break;
        case 7:
            return [UIImage imageNamed:@"party.jpeg"];
            break;
        case 8:
            return [UIImage imageNamed:@"reading.jpg"];
            break;
        default:
            return [UIImage imageNamed:@"defaultPic.png"];
            break;
    }
}

@end