//
//  MCFullScreenViewController.m
//  MCUIKit_Example
//
//  Created by Rake Yang on 2020/9/15.
//  Copyright © 2020 MC-Studio. All rights reserved.
//

#import "MCFullScreenViewController.h"
#import <MCUIKit/MCUIKit.h>
#import <MCUIKit/BPScrollCollectionViewCell.h>
#import <SDWebImage/UIImageView+WebCache.h>

@interface MCFullScreenViewController () <UICollectionViewDataSource, BPCycleScrollViewDelegate>

@property (nonatomic, strong) BPCycleScrollView *cycleView1;
@property (nonatomic, copy) NSArray *URLs;


@end

@implementation MCFullScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    NSData *imgJSONData = [NSData dataWithContentsOfFile:[NSBundle.mainBundle pathForResource:@"ImageData.json" ofType:nil]];
    NSArray *URLs = [NSJSONSerialization JSONObjectWithData:imgJSONData options:NSJSONReadingMutableLeaves error:nil];
    NSInteger count = URLs.count;
    self.URLs = URLs;
    
    //自动轮播图
    self.cycleView1 = [[BPCycleScrollView alloc] initWithFrame:self.view.bounds scrollDirection:UICollectionViewScrollDirectionVertical];
    self.cycleView1.backgroundColor = UIColor.lightGrayColor;
    self.cycleView1.infiniteLoop = NO;
    self.cycleView1.contentMode = UIViewContentModeScaleAspectFit;
    self.cycleView1.pageControl.hidden = YES;
    self.cycleView1.originImageURLs = [URLs subarrayWithRange:NSMakeRange(0, count)];
    self.cycleView1.customDataSource = self;
    self.cycleView1.delegate = self;
    [self.view addSubview:self.cycleView1];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setImage:[UIImage imageNamed:@"ic_arrowleft"] forState:UIControlStateNormal];
    backButton.frame = CGRectMake(16, 40, 40, 40);
    [backButton addTarget:self action:@selector(onBackButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
}

- (void)onBackButton:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

#pragma mark - BPCycleScrollViewDelegate

- (void)cycleScrollView:(BPCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    NSLog(@"点击：%ld", index);
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.URLs.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BPScrollCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(BPScrollCollectionViewCell.class) forIndexPath:indexPath];
    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    NSString *imgURL = [self.URLs mc_safeObjectAtIndex:indexPath.row];
    [cell.imageView sd_setImageWithURL:[NSURL mc_SafeURLWithString:imgURL] placeholderImage:nil options:SDWebImageRetryFailed];
    return cell;
}

@end
