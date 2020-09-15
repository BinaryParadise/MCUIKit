//
//  NSTimer+MCBlock.m
//  MCUIKit
//
//  Created by Rake Yang on 2020/9/15.
//

#import "NSTimer+MCBlock.h"

@implementation NSTimer (MCBlock)

+ (NSTimer *)mc_scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(NSTimer * _Nonnull timer))block {
    return [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(invokeBlock:) userInfo:[block copy] repeats:repeats];
}

+ (void)invokeBlock:(NSTimer *)timer {
    void (^block)(NSTimer *) = timer.userInfo;
    if (block) {
        block(timer);
    }
}

@end
