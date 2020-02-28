//
//  MCViewController.m
//  MCUIKit
//
//  Created by mylcode on 11/06/2017.
//  Copyright (c) 2017 mylcode. All rights reserved.
//

#import "MCViewController.h"
#import <MCUIKit/MCUIKit.h>

@interface MCViewController ()

@property (nonatomic, weak) IBOutlet UIView *mainView;
@property (nonatomic, weak) IBOutlet UIView *view1;
@property (nonatomic, weak) IBOutlet UIView *view2;
@property (nonatomic, strong) BPCycleScrollView *cycleView;


@end

@implementation MCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = MCHexColor(0x8c8c8c);
    
    //轮播图
    self.cycleView = [[BPCycleScrollView alloc] initWithFrame:CGRectMake(0, 88, self.view.mcWidth, 168)];
    self.cycleView.backgroundColor = [UIColor whiteColor];
    self.cycleView.autoScroll = YES;
    NSData *imgJSONData = [NSData dataWithContentsOfFile:[NSBundle.mainBundle pathForResource:@"ImageData.json" ofType:nil]];
    NSArray *URLs = [NSJSONSerialization JSONObjectWithData:imgJSONData options:NSJSONReadingMutableLeaves error:nil];
    NSInteger count = URLs.count;
    
    self.cycleView.pageControl.config.indicatorOffset = 8;
    self.cycleView.pageControl.config.pageIndicatorImage = [UIImage imageNamed:@"ic_dotdark"];
    self.cycleView.pageControl.config.currentPageIndicatorImage = [UIImage imageNamed:@"ic_dotdark_current"];
    
    self.cycleView.imageURLs = [URLs subarrayWithRange:NSMakeRange(0, count)];
    
    [self.view addSubview:self.cycleView];
    
    _mainView.mcLeft = 16;
    _mainView.mcTop = self.cycleView.mcBottom + 16;
    _mainView.mcWidth = self.view.mcWidth - 16*2;
    _mainView.mcHeight = self.view.mcHeight - _mainView.mcTop - 49;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.35 animations:^{
            _view1.mcRight = _mainView.mcWidth - 20;
            _view1.mcCenterX.equalTo(self.view).offset(18);
        }];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.35 animations:^{
            _view2.mcLeftBottom = CGPointMake(20, -20);
        }];
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
