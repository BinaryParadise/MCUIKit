//
//  MCViewController.m
//  MCUIKit
//
//  Created by mylcode on 11/06/2017.
//  Copyright (c) 2017 mylcode. All rights reserved.
//

#import "MCViewController.h"
#import "MCView.h"

@interface MCViewController ()

@end

@implementation MCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    MCView *mcView = [[MCView alloc] initWithFrame:CGRectZero];
    mcView.left = 12;
    mcView.top = 60+12;
    mcView.width = self.view.width - 12*2;
    mcView.height = 80;
    
    mcView.frame = CGRectMake(self.view.left+12, self.view.top + 82, self.view.width-24, self.view.height - 82);
    mcView.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:mcView];
    
    MCView *leftTopView = [[MCView alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
    leftTopView.backgroundColor = [UIColor purpleColor];
    [mcView addSubview:leftTopView];
    leftTopView.rightTop = CGPointMake(-20, 20);
    NSLog(@"%@", NSStringFromCGPoint(leftTopView.rightTop));
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.35 animations:^{
            leftTopView.origin = CGPointMake(20, 20);
        }];
    });
    
    MCView *rightTopView = [[MCView alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
    rightTopView.backgroundColor = [UIColor lightGrayColor];
    [mcView addSubview:rightTopView];
    rightTopView.rightBottom = CGPointMake(-20, -20);
    NSLog(@"%@", NSStringFromCGPoint(rightTopView.rightBottom));
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.35 animations:^{
            rightTopView.leftBottom = CGPointMake(20, -20);
        }];
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
