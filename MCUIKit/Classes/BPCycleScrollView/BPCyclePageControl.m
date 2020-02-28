//
//  BPCyclePageControl.m
//  BPCycleScrollView
//
//  Created by Rake Yang on 2020/2/27.
//

#import "BPCyclePageControl.h"
#import "UIView+MCFrameGeometry.h"

#define kCyclePageTag   1000

@interface BPCyclePageControl ()

@end

@implementation BPCyclePageControl

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.hidesForSinglePage = YES;
        self.config = [BPCycleConfig new];
    }
    return self;
}

- (void)setNumberOfPages:(NSInteger)numberOfPages {
    _numberOfPages = numberOfPages;
    if (self.hidesForSinglePage) {
        self.hidden = numberOfPages <= 1;
    }
    self.currentPage = 0;
}

- (void)setCurrentPage:(NSInteger)currentPage {    
    _currentPage = currentPage;
    [self configView];
}

- (void)configView {
    CGFloat startX = 0;
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.hidden = YES;
    }];
    for (NSInteger i=0; i<self.numberOfPages; i++) {
        NSInteger vtag = i+kCyclePageTag;
        UIImageView *indicatorView = [self viewWithTag:vtag];
        indicatorView.hidden = NO;
        if (!indicatorView) {
           indicatorView = [[UIImageView alloc] init];
           indicatorView.tag = vtag;
           [self addSubview:indicatorView];
        }
        indicatorView.mcLeft = startX;
        indicatorView.image = self.currentPage==i?self.config.currentPageIndicatorImage:self.config.pageIndicatorImage;
        indicatorView.mcSize = indicatorView.image.size;
       
        if (i == self.numberOfPages - 1) {
        } else {
            startX += indicatorView.frame.size.width+self.config.indicatorOffset;
        }
    }
}

- (CGSize)sizeForNumberOfPages:(NSInteger)pageCount {
    return CGSizeMake((self.config.pageIndicatorImage.size.width+self.config.indicatorOffset)*(pageCount-1)+self.config.currentPageIndicatorImage.size.width,self.config.pageIndicatorImage.size.height);
}

@end
