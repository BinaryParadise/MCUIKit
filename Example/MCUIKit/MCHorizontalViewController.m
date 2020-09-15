//
//  MCCycleViewController.m
//  MCUIKit_Example
//
//  Created by Rake Yang on 2020/3/10.
//  Copyright © 2020年 MC-Studio. All rights reserved.
//

#import "MCHorizontalViewController.h"
#import <MCUIKit/MCUIKit.h>

@interface MCHorizontalViewController ()

@property (nonatomic, strong) BPCycleScrollView *cycleView1;
@property (nonatomic, strong) BPCycleScrollView *cycleView2;
@property (nonatomic, strong) BPCycleScrollView *cycleView3;

@end

@implementation MCHorizontalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSData *imgJSONData = [NSData dataWithContentsOfFile:[NSBundle.mainBundle pathForResource:@"ImageData.json" ofType:nil]];
    NSArray *URLs = [NSJSONSerialization JSONObjectWithData:imgJSONData options:NSJSONReadingMutableLeaves error:nil];
    NSInteger count = URLs.count;
    
    //自动轮播图
    self.cycleView1 = [[BPCycleScrollView alloc] initWithFrame:CGRectMake(16, 100, self.view.mcWidth-16*2, 186)];
    self.cycleView1.layer.cornerRadius = 6;
    self.cycleView1.layer.masksToBounds = YES;
    self.cycleView1.autoScroll = YES;
    self.cycleView1.pageControl.config.indicatorOffset = 8;
    self.cycleView1.pageControl.config.pageIndicatorImage = [UIImage imageNamed:@"ic_dotdark"];
    self.cycleView1.pageControl.config.currentPageIndicatorImage = [UIImage imageNamed:@"ic_dotdark_current"];
    self.cycleView1.originImageURLs = [URLs subarrayWithRange:NSMakeRange(0, count)];
    [self.view addSubview:self.cycleView1];
    
    //手动轮播图
    self.cycleView2 = [[BPCycleScrollView alloc] initWithFrame:CGRectMake(16, self.cycleView1.mcBottom+28, self.view.mcWidth-16*2, 186)];
    self.cycleView2.pageControl.config.indicatorOffset = 8;
    self.cycleView2.pageControl.config.pageIndicatorImage = [UIImage imageNamed:@"ic_dotdark"];
    self.cycleView2.pageControl.config.currentPageIndicatorImage = [UIImage imageNamed:@"ic_dotdark_current"];
    self.cycleView2.originImageURLs = [URLs subarrayWithRange:NSMakeRange(0, count)];
    [self.view addSubview:self.cycleView2];
    
    //手动创建
    self.cycleView3 = [[BPCycleScrollView alloc] initWithFrame:CGRectMake(16, self.cycleView2.mcBottom+28, self.view.mcWidth-16*2, 186)];
    self.cycleView3.layer.cornerRadius = 6;
    self.cycleView3.layer.masksToBounds = YES;
//    self.cycleView3.autoScroll = NO;
    self.cycleView3.pageControl.config.indicatorOffset = 8;
    self.cycleView3.pageControl.config.pageIndicatorImage = [UIImage imageNamed:@"ic_dotdark"];
    self.cycleView3.pageControl.config.currentPageIndicatorImage = [UIImage imageNamed:@"ic_dotdark_current"];
    self.cycleView3.placeholderImage = [UIImage mc_imageWithColor:[UIColor mc_colorWithHex:0x5CFF7F]];
    self.cycleView3.originImageURLs = [URLs subarrayWithRange:NSMakeRange(0, count)];
    [self.view addSubview:self.cycleView3];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.cycleView3.originImageURLs = [URLs subarrayWithRange:NSMakeRange(0, 2)];
    });
}

- (void)dealloc {
    self.cycleView1 = nil;
    self.cycleView2 = nil;
    self.cycleView3 = nil;
}

@end
