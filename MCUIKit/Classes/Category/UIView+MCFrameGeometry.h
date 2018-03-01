//
//  UIView+MCFrameGeometry.h
//  MCUIKit
//
//  Created by mylcode on 2017/11/6.
//  Copyright © 2017年 MC-Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (MCFrameGeometry)

/**
 视图y坐标
 */
@property (nonatomic) CGFloat mcTop;

/**
 视图x坐标
 */
@property (nonatomic) CGFloat mcLeft;

/**
 视图底部坐标
 */
@property (nonatomic) CGFloat mcBottom;

/**
 视图右边坐标
 */
@property (nonatomic) CGFloat mcRight;

/**
 视图宽度
 */
@property (nonatomic) CGFloat mcWidth;

/**
 视图高度
 */
@property (nonatomic) CGFloat mcHeight;

/**
 视图原点坐标
 */
@property (nonatomic) CGPoint mcOrigin;

/**
 视图尺寸
 */
@property (nonatomic) CGSize mcSize;

/**
 视图以左下角为原点相对superView的坐标，例如(10, 10)实际表示(10, superView.heigth + 10)
 */
@property (nonatomic) CGPoint mcLeftBottom;

/**
 视图以右上角为原点相对superView的坐标
 */
@property (nonatomic) CGPoint mcRightTop;

/**
 视图以右下角为原点相对superView的坐标
 */
@property (nonatomic) CGPoint mcRightBottom;

@end
