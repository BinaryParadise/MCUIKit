//
//  UIColor+MCExtension.h
//  MCUIKit
//
//  Created by mylcode on 2018/2/5.
//  Copyright © 2018年 MC-Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MCHexColor(hexColor)    [UIColor mc_colorWithHex:hexColor]

@interface UIColor (MCExtension)

+ (instancetype)mc_colorWithHex:(long)hexColor;

@end
