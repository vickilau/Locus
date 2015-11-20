//
//  VLFBProfilePictureView.m
//  Locus
//
//  Created by Vicki Lau on 11/19/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import "VLFBProfilePictureView.h"

@implementation VLFBProfilePictureView

- (instancetype)init {
    if (self = [super init]) {
        PFUser *user = [PFUser currentUser];
        if ([user objectForKey:@"facebookId"]) {
            [self setProfileID:[user objectForKey:@"facebookId"]];
        } else {
            if ([FBSDKAccessToken currentAccessToken]) {
                [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:@{@"fields": @"id"}]
                 startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
                     if (!error) {
                         [user setObject:result[@"id"] forKey:@"facebookId"];
                         [[PFUser currentUser] saveInBackground];
                         [self setProfileID:[user objectForKey:@"facebookId"]];
                     }
                 }];
            }
        }
    }
    
    [self.layer setBackgroundColor:[UIColor clearColor].CGColor];
    
    [self.layer setCornerRadius:30.0f];
    // border
    [self.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [self.layer setBorderWidth:1.5f];
    
    // drop shadow
    [self.layer setShadowColor:[UIColor blackColor].CGColor];
    [self.layer setShadowOpacity:0.8];
    [self.layer setShadowRadius:3.0];
    [self.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
    
    return self;
}


@end
