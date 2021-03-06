//
//  UIView+MCFrameGeometry.h
//  MCUIKit
//
//  Created by mylcode on 2017/11/6.
//  Copyright © 2017年 MC-Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MCPREFIX_FRAME_PROPERTY(type,name) \
@property (nonatomic, assign) type mc##name;

#define mcTop           mcTop
#define mcLeft          mcLeft
#define mcBottom        mcBottom
#define mcRight         mcRight
#define mcWidth         mcWidth
#define mcHeight        mcHeight
#define mcOrigin        mcOrigin
#define mcSize          mcSize
#define mcHeight        mcHeight
#define mcHeight        mcHeight
#define LeftBottom      mcLeftBottom
#define mcRightTop      mcRightTop
#define mcRightBottom   mcRightBottom

typedef void(^MCConstraintBlock)(UIView *toView, CGFloat offset);

@interface MCViewConstraint : NSObject

@property (nonatomic, weak) UIView *firstItem;
@property (nonatomic, weak) UIView *secondItem;
@property (nonatomic, copy) MCConstraintBlock constraintBlock;

- (instancetype)initWithView:(UIView *)view layoutConstraint:(MCConstraintBlock)block;

- (MCViewConstraint * (^)(id))equalTo;
- (MCViewConstraint * (^)(CGFloat))offset;

@end

/**
 frame扩展属性：mc+名称
 */
@interface UIView (MCFrameGeometry)

/**
 视图y坐标
 */
MCPREFIX_FRAME_PROPERTY(CGFloat,Top)

/**
 视图x坐标
 */
MCPREFIX_FRAME_PROPERTY(CGFloat,Left)

/**
 视图底部坐标
 */
MCPREFIX_FRAME_PROPERTY(CGFloat,Bottom)

/**
 视图右边坐标
 */
MCPREFIX_FRAME_PROPERTY(CGFloat,Right)

/**
 视图宽度
 */
MCPREFIX_FRAME_PROPERTY(CGFloat,Width)

/**
 视图高度
 */
MCPREFIX_FRAME_PROPERTY(CGFloat,Height)

/**
 视图原点坐标
 */
MCPREFIX_FRAME_PROPERTY(CGPoint,Origin)

/**
 视图尺寸
 */
MCPREFIX_FRAME_PROPERTY(CGSize,Size)

/**
 视图以左下角为原点相对superView的坐标，例如(10, 10)实际表示(10, superView.heigth + 10)
 */
MCPREFIX_FRAME_PROPERTY(CGPoint,LeftBottom)

/**
 视图以右上角为原点相对superView的坐标
 */
MCPREFIX_FRAME_PROPERTY(CGPoint,RightTop)

/**
 视图以右下角为原点相对superView的坐标
 */
MCPREFIX_FRAME_PROPERTY(CGPoint,RightBottom)

/// 水平x坐标（实际设置frame.origin.x）
- (MCViewConstraint *)mcCenterX;

/// 垂直y坐标（实际设置frame.origin.y）
- (MCViewConstraint *)mCCenterY;

@end
