//
//  BPCycleScrollView.m
//  BPCycleScrollView_Example
//
//  Created by Rake Yang on 2020/2/27.
//  Copyright © 2020 BinaryParadise. All rights reserved.
//

#import "BPCycleScrollView.h"
#import "BPScrollCollectionViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "BPCycleCollectionViewLayout.h"
#import "UIView+MCFrameGeometry.h"
#import "NSArray+MCExtension.h"
#import "NSURL+MCExtension.h"
#import "NSTimer+MCBlock.h"

@interface BPCycleScrollView () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, strong) BPCyclePageControl *pageControl;
@property (nonatomic, strong) NSArray<NSString *> *imageGroup;

@property (nonatomic, assign) UICollectionViewScrollDirection scrollDirection;


@end

@implementation BPCycleScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    return [self initWithFrame:frame scrollDirection:UICollectionViewScrollDirectionHorizontal];
}

- (instancetype)initWithFrame:(CGRect)frame scrollDirection:(UICollectionViewScrollDirection)direction {
    if (self = [super initWithFrame:frame]) {
        self.scrollDirection = direction;
        self.itemSize = frame.size;
        self.imageContentMode = UIViewContentModeScaleAspectFill;
        [self configView];
    }
    return self;
}

- (BOOL)horizontal {
    return self.scrollDirection == UICollectionViewScrollDirectionHorizontal;
}

- (void)configView {
    _autoScrollTimeInterval = 3.0;
    _infiniteLoop = YES;
    
    self.flowLayout = [[UICollectionViewFlowLayout alloc] init];
    self.flowLayout.minimumLineSpacing = 0;
    self.flowLayout.minimumInteritemSpacing = 0;
    self.flowLayout.sectionInset = UIEdgeInsetsZero;
    self.flowLayout.scrollDirection = self.scrollDirection;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:self.flowLayout];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.scrollsToTop = NO;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.directionalLockEnabled = YES;
    [self addSubview:self.collectionView];
    
    [self.collectionView registerClass:BPScrollCollectionViewCell.class forCellWithReuseIdentifier:NSStringFromClass(BPScrollCollectionViewCell.class)];
    
    self.pageControl = [[BPCyclePageControl alloc] init];
    [self addSubview:self.pageControl];
}

//设置数据时在第一个之前和最后一个之后分别插入数据
- (void)setOriginImageURLs:(NSArray<NSString *> *)originImageURLs {
    _originImageURLs = originImageURLs;
    NSMutableArray *marr = [NSMutableArray arrayWithArray:originImageURLs];
    if (originImageURLs.count > 1) {
        [marr addObject:originImageURLs.firstObject];
        [marr insertObject:originImageURLs.lastObject atIndex:0];
    }
    self.imageGroup = marr;
    self.pageControl.numberOfPages = self.originImageURLs.count;
    [self.collectionView reloadData];
    if (self.imageGroup.count > 1) {
        //滚动到第一页（不含占位）
        [self.collectionView setContentOffset:CGPointMake(self.mcWidth, 0)];
        [self setNeedsLayout];
    }
    [self configTimer];
}

- (void)configTimer {
    [self.timer invalidate];
    self.timer = nil;
    if (self.autoScroll && self.originImageURLs.count > 1) {
        __weak typeof(self) weakSelf = self;
        self.timer = [NSTimer mc_scheduledTimerWithTimeInterval:self.autoScrollTimeInterval repeats:YES block:^(NSTimer * _Nonnull timer) {
            [weakSelf showNext];
        }];
        self.timer.fireDate = [NSDate dateWithTimeIntervalSinceNow:self.autoScrollTimeInterval];
    }
}

- (void)setAutoScroll:(BOOL)autoScroll {
    _autoScroll = autoScroll;
    [self configTimer];
}

- (void)setCustomDataSource:(id<UICollectionViewDataSource>)customDataSource {
    self.collectionView.dataSource = customDataSource;
}

#pragma mark - Actions

//自动显示下一个
- (void)showNext {
    //手指拖拽是禁止自动轮播
    if (self.collectionView.isDragging) {return;}
    
    CGFloat targetY = self.scrollDirection == UICollectionViewScrollDirectionVertical ? (self.collectionView.contentOffset.y + self.collectionView.mcHeight):0;
    CGFloat targetX = self.scrollDirection == UICollectionViewScrollDirectionVertical ? 0:(self.collectionView.contentOffset.x + self.collectionView.mcWidth);
    [self.collectionView setContentOffset:CGPointMake(targetX, targetY) animated:true];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.imageGroup.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BPScrollCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(BPScrollCollectionViewCell.class) forIndexPath:indexPath];
    cell.imageView.contentMode = self.imageContentMode;
    NSString *imgURL = [self.imageGroup mc_safeObjectAtIndex:indexPath.row];
    [cell.imageView sd_setImageWithURL:[NSURL mc_SafeURLWithString:imgURL] placeholderImage:self.placeholderImage options:SDWebImageRetryFailed];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(cycleScrollView:didSelectItemAtIndex:)]) {
        if (self.infiniteLoop) {
            [self.delegate cycleScrollView:self didSelectItemAtIndex:self.pageControl.currentPage];
        } else {
            [self.delegate cycleScrollView:self didSelectItemAtIndex:indexPath.row];
        }
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.flowLayout.itemSize = self.frame.size;
    BOOL shouldInit = CGRectEqualToRect(self.collectionView.frame, CGRectZero);
    self.collectionView.frame = self.bounds;
    if (shouldInit && self.originImageURLs.count > 1) {//自动布局需要初始化位置
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    }
    self.pageControl.mcSize = [self.pageControl sizeForNumberOfPages:self.originImageURLs.count];
    self.pageControl.mcBottom = self.mcHeight - self.pageControl.config.bottomOffset;
    self.pageControl.mcCenterX.equalTo(self);
}

#pragma mark - UIScrollViewDelegate

//手动拖拽结束
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self cycleScroll];
    //拖拽动作后启动定时器
    [self configTimer];
}

//自动轮播结束
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    [self cycleScroll];
}

//循环显示
- (void)cycleScroll {
    if (!self.infiniteLoop) {
        return;
    }
    
    NSInteger page = [self horizontal]?self.collectionView.contentOffset.x/self.mcWidth : self.collectionView.contentOffset.y/self.mcHeight;
    if (page == 0) {
        if ([self horizontal]) {
            //滚动到左边
            self.collectionView.contentOffset = CGPointMake(self.mcWidth * (self.imageGroup.count - 2), 0);
        } else {
            //滚动到顶部
            self.collectionView.contentOffset = CGPointMake(self.mcHeight * (self.imageGroup.count - 2), 0);
        }
        self.pageControl.currentPage = self.imageGroup.count - 2;
    }else if (page == self.imageGroup.count - 1){
        if ([self horizontal]) {
            //滚动到右边
            self.collectionView.contentOffset = CGPointMake(self.mcWidth, 0);
        } else {
            //滚动到底部
            self.collectionView.contentOffset = CGPointMake(0, self.mcHeight);
        }
        self.pageControl.currentPage = 0;
    }else{
        self.pageControl.currentPage = page - 1;
    }
    
    if ([self.delegate respondsToSelector:@selector(cycleScrollView:didScrollToIndex:)]) {
        [self.delegate cycleScrollView:self didScrollToIndex:self.pageControl.currentPage];
    }
}

- (void)dealloc {
    [self.timer invalidate];
    self.timer = nil;
}

@end
