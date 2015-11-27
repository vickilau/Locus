//
//  VLQuizViewController.h
//  Locus
//
//  Created by Vicki Lau on 11/24/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

#import "VLUtilities.h"

@protocol VLQuizViewControllerDelegate;

@interface VLQuizViewController : UIViewController

@property (nonatomic, weak) id<VLQuizViewControllerDelegate> delegate;

@property UIImageView *currentImageView;
@property UIButton *dislikeButton;
@property UIButton *likeButton;
@property UITextView *travelStyleBlurb;
@property UIProgressView *progressView;
@property NSUInteger index;

@end


@protocol VLQuizViewControllerDelegate <NSObject>

- (void)VLQuizViewControllerDidFinishQuiz;

@end