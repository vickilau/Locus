//
//  VLUtilities.m
//  Locus
//
//  Created by Vicki Lau on 11/25/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import "VLUtilities.h"

@implementation VLUtilities

+ (void)makeRound:(UIView *)view {
    [view.layer setMasksToBounds:YES];
    
    if ([view isKindOfClass:[UIButton class]]) {
        [view.layer setCornerRadius:5.0f];
    } else {
        [view.layer setCornerRadius:30.0f];
    }
    // border
    [view.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [view.layer setBorderWidth:1.5f];
    
    // drop shadow
    [view.layer setShadowColor:[UIColor blackColor].CGColor];
    [view.layer setShadowOpacity:0.8];
    [view.layer setShadowRadius:3.0];
    [view.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
}

+ (void)makeCircle:(UIView *)view {
    [view.layer setMasksToBounds:YES];

    [view.layer setCornerRadius:view.frame.size.width/2];

    // border
    [view.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [view.layer setBorderWidth:1.5f];
    
    // drop shadow
    [view.layer setShadowColor:[UIColor blackColor].CGColor];
    [view.layer setShadowOpacity:0.8];
    [view.layer setShadowRadius:3.0];
    [view.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
}

+ (CGFloat)getHeightOfLabel:(UILabel *)label width:(CGFloat)width{
    CGRect labelRect = [label.text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:label.font} context:nil];
    
    [label setNumberOfLines:0];
    [label setLineBreakMode:NSLineBreakByWordWrapping];
    
    return labelRect.size.height;
}

@end
