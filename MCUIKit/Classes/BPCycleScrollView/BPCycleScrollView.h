//
//  BPCycleScrollView.h
//  BPCycleScrollView_Example
//
//  Created by Rake Yang on 2020/2/27.
//  Copyright © 2020 BinaryParadise. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BPCyclePageControl.h"

NS_ASSUME_NONNULL_BEGIN

@interface BPCycleScrollView : UIView

/// 自动滚动时间间隔（默认3.0秒）
@property (nonatomic, assign) NSTimeInterval autoScrollTimeInterval;

/// 是否自动滚动，默认为YES
@property (nonatomic, assign) BOOL autoScroll;

@property (nonatomic, copy) NSArray<NSString *> *imageURLs;

@property (nonatomic, copy) UIImage *placeholderImage;

/// 无线循环滚动，默认为YES
@property (nonatomic, assign) BOOL infiniteLoop;

@property (nonatomic, strong, readonly) BPCyclePageControl *pageControl;

@end

NS_ASSUME_NONNULL_END
