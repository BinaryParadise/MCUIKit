//
//  MCVerticalViewController.m
//  MCUIKit_Example
//
//  Created by Rake Yang on 2020/9/15.
//  Copyright © 2020 MC-Studio. All rights reserved.
//

#import "MCVerticalViewController.h"
#import <MCUIKit/MCUIKit.h>

@interface MCVerticalViewController ()

@property (nonatomic, strong) BPCycleScrollView *cycleView1;


@end

@implementation MCVerticalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    NSData *imgJSONData = [NSData dataWithContentsOfFile:[NSBundle.mainBundle pathForResource:@"ImageData.json" ofType:nil]];
    NSArray *URLs = [NSJSONSerialization JSONObjectWithData:imgJSONData options:NSJSONReadingMutableLeaves error:nil];
    NSInteger count = URLs.count;
    
    //自动轮播图
    self.cycleView1 = [[BPCycleScrollView alloc] initWithFrame:CGRectMake(16, 100, self.view.mcWidth-16*2, 186) scrollDirection:UICollectionViewScrollDirectionVertical];
    self.cycleView1.layer.cornerRadius = 6;
    self.cycleView1.layer.masksToBounds = YES;
    self.cycleView1.autoScroll = YES;
    self.cycleView1.pageControl.config.indicatorOffset = 8;
    self.cycleView1.pageControl.config.pageIndicatorImage = [UIImage imageNamed:@"ic_dotdark"];
    self.cycleView1.pageControl.config.currentPageIndicatorImage = [UIImage imageNamed:@"ic_dotdark_current"];
    self.cycleView1.originImageURLs = [URLs subarrayWithRange:NSMakeRange(0, count)];
    [self.view addSubview:self.cycleView1];
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
