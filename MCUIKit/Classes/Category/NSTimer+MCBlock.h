//
//  NSTimer+MCBlock.h
//  MCUIKit
//
//  Created by Rake Yang on 2020/9/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTimer (MCBlock)

+ (NSTimer *)mc_scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(NSTimer * _Nonnull timer))block;

@end

NS_ASSUME_NONNULL_END
