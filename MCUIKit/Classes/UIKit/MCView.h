//
//  MCView.h
//  MCUIKit
//
//  Created by mylcode on 2017/11/6.
//  Copyright © 2017年 MC-Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+MCFrameGeometry.h"

#define MCScreenWidth     [UIScreen mainScreen].applicationFrame.size.width
#define MCScreenHeight    [UIScreen mainScreen].applicationFrame.size.height

@interface MCView : UIView

/**
 配置视图
 */
- (void)configView;

@end
