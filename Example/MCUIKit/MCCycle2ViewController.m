//
//  MCCycle2ViewController.m
//  MCUIKit_Example
//
//  Created by Rake Yang on 2020/4/9.
//  Copyright © 2020 MC-Studio. All rights reserved.
//

#import "MCCycle2ViewController.h"
#import <MCUIKit/MCUIKit.h>

@interface MCCycle2ViewController ()

@property (nonatomic, strong) BPCycleScrollView *cycleView3;

@end

@implementation MCCycle2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSData *imgJSONData = [NSData dataWithContentsOfFile:[NSBundle.mainBundle pathForResource:@"ImageData.json" ofType:nil]];
    NSArray *URLs = [NSJSONSerialization JSONObjectWithData:imgJSONData options:NSJSONReadingMutableLeaves error:nil];
    NSInteger count = URLs.count;
    
    //手动创建
    self.cycleView3 = [[BPCycleScrollView alloc] initWithFrame:CGRectMake(16, 100, self.view.mcWidth-36, 222)];
    self.cycleView3.layer.cornerRadius = 6;
    self.cycleView3.layer.masksToBounds = YES;
//    self.cycleView3.autoScroll = NO;
    self.cycleView3.backgroundColor = [UIColor orangeColor];
    self.cycleView3.pageControl.config.indicatorOffset = 8;
    self.cycleView3.pageControl.config.pageIndicatorImage = [UIImage imageNamed:@"ic_dotdark"];
    self.cycleView3.pageControl.config.currentPageIndicatorImage = [UIImage imageNamed:@"ic_dotdark_current"];
    self.cycleView3.placeholderImage = [UIImage imageNamed:@"ic_placeholder"];
    self.cycleView3.originImageURLs = [URLs subarrayWithRange:NSMakeRange(0, count)];
    [self.view addSubview:self.cycleView3];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            self.cycleView3.originImageURLs = [URLs subarrayWithRange:NSMakeRange(0, 2)];
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
