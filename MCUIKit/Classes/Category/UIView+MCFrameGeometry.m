//
//  UIView+MCFrameGeometry.m
//  MCUIKit
//
//  Created by mylcode on 2017/11/6.
//  Copyright © 2017年 MC-Studio. All rights reserved.
//

#import "UIView+MCFrameGeometry.h"

@implementation UIView (MCFrameGeometry)

- (CGFloat)top {
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)top {
    NSAssert(!isnan(top), @"Not a Number");
    CGRect rect = self.frame;
    rect.origin.y = top;
    self.frame = rect;
}

- (CGFloat)left {
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)left {
    NSAssert(!isnan(left), @"Not a Number");
    CGRect rect = self.frame;
    rect.origin.x = left;
    self.frame = rect;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    NSAssert(!isnan(width), @"Not a Number");
    CGRect rect = self.frame;
    rect.size.width = width;
    self.frame = rect;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect newFrame = self.frame;
    newFrame.origin.y = bottom - newFrame.size.height;
    self.frame = newFrame;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right {
    NSAssert(!isnan(right), @"Not a Number");
    CGRect newFrame = self.frame;
    newFrame.origin.x = right - (newFrame.origin.x + newFrame.size.width);
    self.frame = newFrame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
    NSAssert(!isnan(height), @"Not a Number");
    CGRect rect = self.frame;
    rect.size.height = height;
    self.frame = rect;
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect rect = self.frame;
    rect.origin = origin;
    self.frame = rect;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect rect = self.frame;
    rect.size = size;
    self.frame = rect;
}

- (CGPoint)leftTop {
    return self.frame.origin;
}

#pragma mark - Point

- (CGPoint)rightTop {
    CGRect frame = self.frame;
    return CGPointMake(frame.origin.x + frame.size.width, frame.origin.y);
}

- (void)setRightTop:(CGPoint)rightTop {
    CGRect frame = self.frame;
    frame.origin = CGPointMake(rightTop.x - frame.size.width, frame.origin.y + rightTop.y);
    self.frame = frame;
}

- (CGPoint)leftBottom {
    return CGPointMake(self.frame.origin.x, self.frame.origin.y + self.frame.size.height);
}

- (CGPoint)rightBottom {
    return CGPointMake(self.frame.origin.x + self.frame.size.width, self.frame.origin.y + self.frame.size.height);
}

- (void)setRightBottom:(CGPoint)rightBottom {
    CGRect frame = self.frame;
    frame.origin = CGPointMake(rightBottom.x - frame.size.width, rightBottom.y - frame.size.height);
    self.frame = frame;
}

@end
