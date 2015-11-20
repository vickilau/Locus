//
//  VLProfPictureView.m
//  Locus
//
//  Created by Vicki Lau on 11/19/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import "VLProfPictureView.h"

@implementation VLProfPictureView

- (instancetype)init {
    if (self = [super init]) {
        
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width, self.bounds.size.height)];
        
        PFUser *user = [PFUser currentUser];
        if ([FBSDKAccessToken currentAccessToken]) {
            [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:@{@"fields": @"id"}]
             startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
                 if (!error) {
                     [user setObject:result[@"id"] forKey:@"facebookId"];
                     NSString *profilePictureURL = [NSString stringWithFormat:@"https://graph.facebook.com/%@/picture", result[@"id"]];
                     NSData *profilePictureData = [NSData dataWithContentsOfURL:[NSURL URLWithString:profilePictureURL]];
                     [self.imageView setImage:[UIImage imageWithData:profilePictureData]];
                     
                     [[PFUser currentUser] saveInBackground];
                 }
             }];
        } else if ([user objectForKey:@"profilePic"]) {
            [self.imageView setImage:[user objectForKey:@"profilePic"]];
        } else {
            [self.imageView setImage:[UIImage imageNamed:@"defaultPic.png"]];
        }
        
        [self.imageView.layer setMasksToBounds:YES];
        [self.imageView.layer setBackgroundColor:[UIColor whiteColor].CGColor];
        
        [self.imageView.layer setCornerRadius:30.0f];
        // border
        [self.imageView.layer setBorderColor:[UIColor lightGrayColor].CGColor];
        [self.imageView.layer setBorderWidth:1.5f];
        
        // drop shadow
        [self.imageView.layer setShadowColor:[UIColor blackColor].CGColor];
        [self.imageView.layer setShadowOpacity:0.8];
        [self.imageView.layer setShadowRadius:3.0];
        [self.imageView.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
        
        [self addSubview:self.imageView];
    }
    
    return self;
}

@end
