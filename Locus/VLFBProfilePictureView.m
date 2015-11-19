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
    return self;
}


@end
