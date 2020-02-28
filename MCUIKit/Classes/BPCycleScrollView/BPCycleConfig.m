//
//  BPCycleConfig.m
//  BPCycleScrollView
//
//  Created by Rake Yang on 2020/2/27.
//

#import "BPCycleConfig.h"

@implementation BPCycleConfig

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.indicatorOffset = 10;
        self.bottomOffset = 12;
    }
    return self;
}

@end
