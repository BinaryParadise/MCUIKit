//
//  BPCyclePageControl.h
//  BPCycleScrollView
//
//  Created by Rake Yang on 2020/2/27.
//

#import <UIKit/UIKit.h>
#import "BPCycleConfig.h"

NS_ASSUME_NONNULL_BEGIN

@interface BPCyclePageControl : UIControl

/// 总分页数，默认为0
@property(nonatomic) NSInteger numberOfPages;

/// 单页是否隐藏控件，默认为YES
@property (nonatomic, assign) BOOL hidesForSinglePage;


/// 当前所在页，默认为0
@property(nonatomic) NSInteger currentPage;

@property (nonatomic, strong) BPCycleConfig *config;

- (CGSize)sizeForNumberOfPages:(NSInteger)pageCount;

@end

NS_ASSUME_NONNULL_END
