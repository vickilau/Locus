//
//  VLLabel.h
//  Locus
//
//  Created by Vicki Lau on 11/10/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, VLFontSize) {
    VLFontSizeSmall,
    VLFontSizeMedium,
    VLFontSizeLarge
};

@interface VLLabel : UILabel

- (instancetype)initWithFontSize:(VLFontSize) fontSize;
- (NSInteger)fontSizeForVLFontSize:(VLFontSize) fontSize;

@end
