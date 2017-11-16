//
//  UIView+MCFrameGeometry.h
//  MCUIKit
//
//  Created by lingjing on 2017/11/6.
//  Copyright © 2017年 MC-Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (MCFrameGeometry)

/**
 视图y坐标
 */
@property (nonatomic) CGFloat top;

/**
 视图x坐标
 */
@property (nonatomic) CGFloat left;

/**
 视图底部坐标
 */
@property (nonatomic) CGFloat bottom;

/**
 视图右边坐标
 */
@property (nonatomic) CGFloat right;

/**
 视图宽度
 */
@property (nonatomic) CGFloat width;

/**
 视图高度
 */
@property (nonatomic) CGFloat height;

/**
 视图原点坐标
 */
@property (nonatomic) CGPoint origin;

/**
 视图尺寸
 */
@property (nonatomic) CGSize size;

/**
 视图以左下角为原点相对superView的坐标，例如(10, 10)实际表示(10, superView.heigth + 10)
 */
@property (nonatomic) CGPoint leftBottom;

/**
 视图以右上角为原点相对superView的坐标
 */
@property (nonatomic) CGPoint rightTop;

/**
 视图以右下角为原点相对superView的坐标
 */
@property (nonatomic) CGPoint rightBottom;

@end
