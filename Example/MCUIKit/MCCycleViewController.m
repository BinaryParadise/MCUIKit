//
//  MCCycleViewController.m
//  MCUIKit_Example
//
//  Created by Rake Yang on 2020/3/10.
//  Copyright © 2020年 MC-Studio. All rights reserved.
//

#import "MCCycleViewController.h"
#import <MCUIKit/MCUIKit.h>

@interface MCCycleViewController ()

@property (nonatomic, weak) IBOutlet BPCycleScrollView *cycleView1;
@property (nonatomic, weak) IBOutlet BPCycleScrollView *cycleView2;
@property (nonatomic, strong) BPCycleScrollView *cycleView3;

@end

@implementation MCCycleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSData *imgJSONData = [NSData dataWithContentsOfFile:[NSBundle.mainBundle pathForResource:@"ImageData.json" ofType:nil]];
    NSArray *URLs = [NSJSONSerialization JSONObjectWithData:imgJSONData options:NSJSONReadingMutableLeaves error:nil];
    NSInteger count = URLs.count;
    
    //自动轮播图
    self.cycleView1.pageControl.config.indicatorOffset = 8;
    self.cycleView1.pageControl.config.pageIndicatorImage = [UIImage imageNamed:@"ic_dotdark"];
    self.cycleView1.pageControl.config.currentPageIndicatorImage = [UIImage imageNamed:@"ic_dotdark_current"];
    self.cycleView1.originImageURLs = [URLs subarrayWithRange:NSMakeRange(0, count)];
    
    //手动轮播图
    self.cycleView2.autoScroll = NO;
    self.cycleView2.pageControl.config.indicatorOffset = 8;
    self.cycleView2.pageControl.config.pageIndicatorImage = [UIImage imageNamed:@"ic_dotdark"];
    self.cycleView2.pageControl.config.currentPageIndicatorImage = [UIImage imageNamed:@"ic_dotdark_current"];
    self.cycleView2.originImageURLs = [URLs subarrayWithRange:NSMakeRange(0, count)];
    
    //手动创建
    self.cycleView3 = [[BPCycleScrollView alloc] initWithFrame:CGRectMake(16, self.cycleView2.mcBottom+50, self.view.mcWidth-36, 222)];
    self.cycleView3.autoScroll = NO;
    self.cycleView3.pageControl.config.indicatorOffset = 8;
    self.cycleView3.pageControl.config.pageIndicatorImage = [UIImage imageNamed:@"ic_dotdark"];
    self.cycleView3.pageControl.config.currentPageIndicatorImage = [UIImage imageNamed:@"ic_dotdark_current"];
    self.cycleView3.placeholderImage = [UIImage imageNamed:@"ic_placeholder"];
    self.cycleView3.originImageURLs = [URLs subarrayWithRange:NSMakeRange(0, count)];
    [self.view addSubview:self.cycleView3];
}

- (void)dealloc {
    self.cycleView1 = nil;
    self.cycleView2 = nil;
}

@end
