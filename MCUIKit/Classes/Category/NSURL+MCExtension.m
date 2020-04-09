//
//  NSURL+MCExtension.m
//  Pods
//
//  Created by Rake Yang on 2020/4/9.
//

#import "NSURL+MCExtension.h"

@implementation NSURL (MCExtension)

+ (instancetype)mc_SafeURLWithString:(NSString *)URLString {
    if ([URLString isKindOfClass:[NSString class]]) {
        NSURL *URL = [self URLWithString:URLString];
        if (!URL) {
            URL = [self URLWithString:[URLString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
        }
        return URL;
    }
    return nil;
}

@end
