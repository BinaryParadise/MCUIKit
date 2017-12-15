//
//  UIImage+UIColor.h
//  MCUIKit_Example
//
//  Created by mylcode on 2017/12/15.
//  Copyright © 2017年 MC-Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (UIColor)


/**
 通过颜色创建图片

 @param color 颜色，尺寸默认为（1x1）
 @return 图片
 */
+ (UIImage *)mc_imageWithColor:(UIColor *)color;

/**
 通过颜色创建图片

 @param color 颜色
 @param size 尺寸
 @return 图片
 */
+ (UIImage *)mc_imageWithColor:(UIColor *)color size:(CGSize)size;

@end
