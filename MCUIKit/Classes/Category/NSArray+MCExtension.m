//
//  NSArray+MCExtension.m
//  MCUIKit
//
//  Created by Rake Yang on 2020/4/4.
//

#import "NSArray+MCExtension.h"

@implementation NSArray (MCExtension)

- (id)mc_safeObjectAtIndex:(NSUInteger)index {
    NSAssert(index < self.count, @"数组越界了，请关注下");
    return index < self.count ? self[index] : nil;
}

@end
