//
//  UIView+MCFrameGeometry.h
//  MCUIKit
//
//  Created by lingjing on 2017/11/6.
//  Copyright © 2017年 MC-Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (MCFrameGeometry)

@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;
@property (nonatomic) CGPoint origin;
@property (nonatomic) CGSize size;
@property (nonatomic, readonly) CGPoint leftBottom;
@property (nonatomic) CGPoint rightTop;
@property (nonatomic) CGPoint rightBottom;

@end
