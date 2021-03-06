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

@end

@implementation MCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = MCHexColor(0x8c8c8c);
    
    _mainView.mcLeft = 16;
    if (@available(iOS 11.0, *)) {
        _mainView.mcTop = UIApplication.sharedApplication.keyWindow.safeAreaInsets.top + 50;
    }
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
