//
//  BPCycleConfig.h
//  BPCycleScrollView
//
//  Created by Rake Yang on 2020/2/27.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 分页相关配置
 */
@interface BPCycleConfig : NSObject

/// 指示器之间间隔，默认为10
@property (nonatomic, assign) CGFloat indicatorOffset;

/// 距离底部间隔，默认12
@property (nonatomic, assign) CGFloat bottomOffset;

/// 分页指示器图片，默认nil
@property (nonatomic, nonnull, strong) UIImage *pageIndicatorImage;

/// 当前页指示器图片，默认nil
@property (nonatomic, nonnull, strong) UIImage *currentPageIndicatorImage;

@end
