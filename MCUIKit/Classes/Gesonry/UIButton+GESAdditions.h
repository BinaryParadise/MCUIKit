//
//  UIButton+GESAdditions.h
//  Gesonry
//
//  Created by mylcode on 16/5/18.
//  Copyright © 2016年 MC-Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (GESAdditions)

/**
 *  添加点按动作
 */
- (void(^)(id,SEL,UIControlEvents))ges_addAction;

@end
