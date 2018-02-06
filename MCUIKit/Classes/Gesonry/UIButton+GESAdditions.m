//
//  UIButton+GESAdditions.m
//  Gesonry
//
//  Created by mylcode on 16/5/18.
//  Copyright © 2016年 MC-Studio. All rights reserved.
//

#import "UIButton+GESAdditions.h"

@implementation UIButton (GESAdditions)

- (void (^)(id, SEL, UIControlEvents))ges_addAction {
    return ^(id target,SEL action,UIControlEvents controlEvents) {
        [self addTarget:target action:action forControlEvents:controlEvents];
    };
}

@end
