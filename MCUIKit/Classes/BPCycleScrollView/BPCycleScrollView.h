//
//  BPCycleScrollView.h
//  BPCycleScrollView_Example
//
//  Created by Rake Yang on 2020/2/27.
//  Copyright © 2020 BinaryParadise. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BPCyclePageControl.h"

@class BPCycleScrollView;

NS_ASSUME_NONNULL_BEGIN

@protocol BPCycleScrollViewDelegate <NSObject>

@optional

/** 点击图片回调 */
- (void)cycleScrollView:(BPCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index;

/** 图片滚动回调 */
- (void)cycleScrollView:(BPCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index;

@end

/// 请勿在Xib中使用
@interface BPCycleScrollView : UIView

/// 自动滚动时间间隔（默认3.0秒）
@property (nonatomic, assign) NSTimeInterval autoScrollTimeInterval;

/// 是否自动滚动，默认为NO
@property (nonatomic, assign) BOOL autoScroll;

/// 原始图片地址数组（自定义数据源时无效）
@property (nonatomic, copy) NSArray<NSString *> *originImageURLs;

@property (nonatomic, copy) UIImage *placeholderImage;

/// 默认为UIViewContentModeScaleAspectFit
@property (nonatomic, assign) UIViewContentMode imageContentMode;

/// 默认为self.frame.size
@property (nonatomic, assign) CGSize itemSize;

/// 无线循环滚动，默认为YES
@property (nonatomic, assign) BOOL infiniteLoop;

@property (nonatomic, strong, readonly) BPCyclePageControl *pageControl;

@property (nonatomic, weak) id<BPCycleScrollViewDelegate> delegate;

@property (nonatomic, strong, readonly) UICollectionView *collectionView;

/// 自定义数据源
@property (nonatomic, weak) id<UICollectionViewDataSource> customDataSource;

- (instancetype)initWithFrame:(CGRect)frame scrollDirection:(UICollectionViewScrollDirection)direction;

@end

NS_ASSUME_NONNULL_END
