//
//  BPCycleCollectionViewLayout.h
//  BPCycleScrollView
//
//  Created by Rake Yang on 2020/2/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BPCycleCollectionViewLayout : UICollectionViewFlowLayout

/// 分页页面之间间隔，默认为20
@property (nonatomic, assign) CGFloat distanceBetweenPages;

@end

NS_ASSUME_NONNULL_END
