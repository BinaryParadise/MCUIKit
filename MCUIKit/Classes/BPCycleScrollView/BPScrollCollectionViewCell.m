//
//  BPScrollCollectionViewCell.m
//  BPCycleScrollView_Example
//
//  Created by Rake Yang on 2020/2/27.
//  Copyright © 2020 BinaryParadise. All rights reserved.
//

#import "BPScrollCollectionViewCell.h"

@implementation BPScrollCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.imageView = [UIImageView new];
        [self.contentView addSubview:self.imageView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.imageView.frame = self.contentView.bounds;
}

@end
