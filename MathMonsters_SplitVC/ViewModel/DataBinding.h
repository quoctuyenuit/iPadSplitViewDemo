//
//  DataBinding.h
//  MathMonsters_SplitVC
//
//  Created by Quốc Tuyến on 7/16/20.
//  Copyright © 2020 Quốc Tuyến. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DataBinding<ObjectType> : NSObject
@property(nonatomic) ObjectType value;

- (instancetype)init;
- (instancetype)initWithValue:(ObjectType _Nullable)value;
- (void)binding:(void(^)(ObjectType _Nullable))handler;
- (void)bindAndFire:(void(^)(ObjectType _Nullable))handler;
@end

NS_ASSUME_NONNULL_END
