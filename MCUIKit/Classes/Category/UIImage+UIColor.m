//
//  UIImage+UIColor.m
//  MCUIKit_Example
//
//  Created by mylcode on 2017/12/15.
//  Copyright © 2017年 MC-Studio. All rights reserved.
//

#import "UIImage+UIColor.h"

@implementation UIImage (UIColor)

+ (UIImage *)mc_imageWithColor:(UIColor *)color {
    return [self mc_imageWithColor:color size:CGSizeMake(1, 1)];
}

+ (UIImage *)mc_imageWithColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
