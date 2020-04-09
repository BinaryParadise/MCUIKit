//
//  NSURL+MCExtension.h
//  Pods
//
//  Created by Rake Yang on 2020/4/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSURL (MCExtension)

+ (instancetype)mc_SafeURLWithString:(NSString *)URLString;

@end

NS_ASSUME_NONNULL_END
