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

@interface BPCycleScrollView () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, weak) NSTimer *timer;

@property (nonatomic, strong) BPCyclePageControl *pageControl;
@property (nonatomic, strong) NSArray<NSString *> *imageGroup;


@end

@implementation BPCycleScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _autoScrollTimeInterval = 3.0;
        _autoScroll = YES;
        _infiniteLoop = YES;
        [self configView];
        self.autoScroll = YES;
    }
    return self;
}

- (void)configView {
    self.flowLayout = [[UICollectionViewFlowLayout alloc] init];
    self.flowLayout.minimumLineSpacing = 0;
    self.flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:self.flowLayout];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.scrollsToTop = NO;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.collectionView];
    
    [self.collectionView registerClass:BPScrollCollectionViewCell.class forCellWithReuseIdentifier:@"ScrollCell"];
    
    self.pageControl = [[BPCyclePageControl alloc] init];
    [self addSubview:self.pageControl];
}

//设置数据时在第一个之前和最后一个之后分别插入数据
- (void)setImageURLs:(NSArray<NSString *> *)imageURLs {
    _imageURLs = imageURLs;
    NSMutableArray *marr = [NSMutableArray arrayWithArray:imageURLs];
    if (imageURLs.count > 1) {
        [marr addObject:imageURLs.firstObject];
        [marr insertObject:imageURLs.lastObject atIndex:0];
    }
    self.imageGroup = marr;
    
    [self.collectionView setContentOffset:CGPointMake(self.collectionView.bounds.size.width, 0)];
    self.pageControl.numberOfPages = imageURLs.count;
    self.pageControl.mcSize = [self.pageControl sizeForNumberOfPages:imageURLs.count];
    self.pageControl.mcBottom = self.mcHeight - self.pageControl.config.bottomOffset;
    self.pageControl.mcCenterX.equalTo(self);
    [self configTimer];
}

- (void)configTimer {
    [self.timer invalidate];
    self.timer = nil;
    if (self.autoScroll && self.imageURLs.count > 1) {
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:self.autoScrollTimeInterval target:self selector:@selector(showNext) userInfo:nil repeats:YES];
        timer.fireDate = [NSDate dateWithTimeIntervalSinceNow:self.autoScrollTimeInterval];
        self.timer = timer;
    }
}

- (void)setAutoScroll:(BOOL)autoScroll {
    _autoScroll = autoScroll;
    [self configTimer];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.imageGroup.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BPScrollCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ScrollCell" forIndexPath:indexPath];
    NSString *imgURL = self.imageGroup[indexPath.item];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:imgURL] placeholderImage:self.placeholderImage];
    return cell;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.flowLayout.itemSize = self.frame.size;
    self.collectionView.frame = self.bounds;
}

//自动显示下一个
- (void)showNext {
    //手指拖拽是禁止自动轮播
    if (self.collectionView.isDragging) {return;}
    CGFloat targetX =  self.collectionView.contentOffset.x + self.collectionView.bounds.size.width;
    [self.collectionView setContentOffset:CGPointMake(targetX, 0) animated:true];
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
    NSInteger page = self.collectionView.contentOffset.x/self.collectionView.bounds.size.width;
    if (page == 0) {//滚动到左边
        self.collectionView.contentOffset = CGPointMake(self.collectionView.bounds.size.width * (self.imageURLs.count - 2), 0);
        self.pageControl.currentPage = self.imageGroup.count - 2;
    }else if (page == self.imageGroup.count - 1){//滚动到右边
        self.collectionView.contentOffset = CGPointMake(self.collectionView.bounds.size.width, 0);
        self.pageControl.currentPage = 0;
    }else{
        self.pageControl.currentPage = page - 1;
    }
}

@end
