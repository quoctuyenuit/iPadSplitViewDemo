//
//  MonsterFactory.h
//  MathMonsters_SplitVC
//
//  Created by Quốc Tuyến on 7/16/20.
//  Copyright © 2020 Quốc Tuyến. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MonsterFactory : NSObject
- (instancetype)init;
- (NSArray *)getMonsterWithCount:(NSInteger)count;
@end

NS_ASSUME_NONNULL_END
