//
//  MCCycle2ViewController.m
//  MCUIKit_Example
//
//  Created by Rake Yang on 2020/4/9.
//  Copyright © 2020 MC-Studio. All rights reserved.
//

#import "MCCycle2ViewController.h"
#import <MCUIKit/MCUIKit.h>
#import <Masonry/Masonry.h>

@interface MCCycle2ViewController ()

@property (nonatomic, strong) BPCycleScrollView *cycleView3;
@property (nonatomic, strong) BPCycleScrollView *cycleView4;

@end

@implementation MCCycle2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSData *imgJSONData = [NSData dataWithContentsOfFile:[NSBundle.mainBundle pathForResource:@"ImageData.json" ofType:nil]];
    NSArray *URLs = [NSJSONSerialization JSONObjectWithData:imgJSONData options:NSJSONReadingMutableLeaves error:nil];
    NSInteger count = URLs.count;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //手动创建
    self.cycleView3 = [[BPCycleScrollView alloc] init];
    self.cycleView3.layer.cornerRadius = 6;
    self.cycleView3.layer.masksToBounds = YES;
//    self.cycleView3.autoScroll = NO;
    self.cycleView3.backgroundColor = [UIColor orangeColor];
    self.cycleView3.pageControl.config.indicatorOffset = 8;
    self.cycleView3.pageControl.config.pageIndicatorImage = [UIImage imageNamed:@"ic_dotdark"];
    self.cycleView3.pageControl.config.currentPageIndicatorImage = [UIImage imageNamed:@"ic_dotdark_current"];
    self.cycleView3.placeholderImage = [UIImage mc_imageWithColor:[UIColor mc_colorWithHex:0xCCCCCC] size:CGSizeMake(self.view.mcWidth, self.view.mcWidth)];
    self.cycleView3.originImageURLs = [URLs subarrayWithRange:NSMakeRange(0, count)];
    [self.view addSubview:self.cycleView3];
    [self.cycleView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(128);
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.mas_equalTo(@280);
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            self.cycleView3.originImageURLs = [URLs subarrayWithRange:NSMakeRange(0, 2)];
    });
    
    //默认占位
    self.cycleView4 = [[BPCycleScrollView alloc] init];
    self.cycleView4.layer.cornerRadius = 6;
    self.cycleView4.layer.masksToBounds = YES;
    self.cycleView4.pageControl.config.indicatorOffset = 8;
    self.cycleView4.pageControl.config.pageIndicatorImage = [UIImage imageNamed:@"ic_dotdark"];
    self.cycleView4.pageControl.config.currentPageIndicatorImage = [UIImage imageNamed:@"ic_dotdark_current"];
    self.cycleView4.placeholderImage = [UIImage mc_imageWithColor:[UIColor mc_colorWithHex:0xCCCCCC] size:CGSizeMake(self.view.mcWidth, self.view.mcWidth)];
    self.cycleView4.originImageURLs = @[@""];
    [self.view addSubview:self.cycleView4];
    [self.cycleView4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.cycleView3.mas_bottom).offset(28);
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.mas_equalTo(@180);
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.cycleView4.originImageURLs = [URLs subarrayWithRange:NSMakeRange(0, 2)];
    });
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
