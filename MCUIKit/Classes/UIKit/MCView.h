//
//  MCView.h
//  MCUIKit
//
//  Created by mylcode on 2017/11/6.
//  Copyright © 2017年 MC-Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+MCFrameGeometry.h"
#import "Gesonry.h"

#define MCAnimationDuration 0.25    //默认动画时间
#define MCScreenWidth       [UIScreen mainScreen].applicationFrame.size.width
#define MCScreenHeight      [UIScreen mainScreen].applicationFrame.size.height

@interface MCView : UIView

/**
 配置视图
 */
- (void)configView;

@end
