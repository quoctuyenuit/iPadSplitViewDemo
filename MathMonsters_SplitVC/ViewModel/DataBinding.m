//
//  DataBinding.m
//  MathMonsters_SplitVC
//
//  Created by Quốc Tuyến on 7/16/20.
//  Copyright © 2020 Quốc Tuyến. All rights reserved.
//

#import "DataBinding.h"

@interface DataBinding ()
@property(nonatomic) NSMutableArray<void(^)(id)> * handlers;
- (void)_fire;
@end

@implementation DataBinding
- (instancetype)init {
    _handlers = [NSMutableArray array];
    return self;
}

- (instancetype)initWithValue:(id)value {
    _handlers = [NSMutableArray array];
    _value = value;
    return self;
}

- (void)setValue:(id)value {
    _value = value;
    [self _fire];
}

- (void)_fire {
    for (void(^block)(id)  in _handlers) {
        block(_value);
    }
}

- (void)binding:(void(^)(id))handler {
    [_handlers addObject:handler];
}

- (void)bindAndFire:(void(^)(id))handler {
    [self binding:handler];
    [self _fire];
}
@end
