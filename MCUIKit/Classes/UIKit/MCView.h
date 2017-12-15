//
//  MCView.h
//  MCUIKit
//
//  Created by mylcode on 2017/11/6.
//  Copyright © 2017年 MC-Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+MCFrameGeometry.h"

#define ScreenWidth     [UIScreen mainScreen].applicationFrame.size.width
#define ScreenHeight    [UIScreen mainScreen].applicationFrame.size.height

#define MCHexColor(hexColor) \
[UIColor colorWithRed:((float)((hexColor & 0xFF0000) >> 16))/255.0 green:((float)((hexColor & 0xFF00) >> 8))/255.0 blue:((float)(hexColor & 0xFF))/255.0 alpha:1.0]

@interface MCView : UIView

@end
