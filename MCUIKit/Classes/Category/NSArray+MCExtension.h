//
//  NSArray+MCExtension.h
//  MCUIKit
//
//  Created by Rake Yang on 2020/4/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray<ObjectType> (MCExtension)

- (ObjectType)mc_safeObjectAtIndex:(NSUInteger)index;

@end

NS_ASSUME_NONNULL_END
