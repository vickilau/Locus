//
//  VLLabel.m
//  Locus
//
//  Created by Vicki Lau on 11/10/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import "VLLabel.h"

NSInteger const kVLFontSizeSmall = 30;
NSInteger const kVLFontSizeMedium = 25;
NSInteger const kVLFontSizeLarge = 17;

@interface VLLabel ()

@property (nonatomic, assign) CGFloat fontSize;

@end

@implementation VLLabel

- (instancetype)initWithFontSize:(VLFontSize) fontSize {
    if (self = [super init]) {
        
        [self setFont:[UIFont systemFontOfSize: [self fontSizeForVLFontSize:fontSize]]];
        
    }
    
    return self;
}

- (NSInteger)fontSizeForVLFontSize:(VLFontSize) fontSize {
    switch (fontSize) {
        case VLFontSizeSmall:
            return kVLFontSizeSmall;
        case VLFontSizeMedium:
            return kVLFontSizeMedium;
        case VLFontSizeLarge:
            return kVLFontSizeLarge;
    }
}

@end

