//
//  UIColor+MCExtension.m
//  MCUIKit
//
//  Created by mylcode on 2018/2/5.
//  Copyright © 2018年 MC-Studio. All rights reserved.
//

#import "UIColor+MCExtension.h"

@implementation UIColor (MCExtension)

+ (instancetype)mc_colorWithHex:(long)hexColor {
    return [UIColor colorWithRed:((float)((hexColor & 0xFF0000) >> 16))/255.0 green:((float)((hexColor & 0xFF00) >> 8))/255.0 blue:((float)(hexColor & 0xFF))/255.0 alpha:1.0];
}

@end
