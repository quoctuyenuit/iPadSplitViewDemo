//
//  MonsterViewModel.h
//  MathMonsters_SplitVC
//
//  Created by Quốc Tuyến on 7/16/20.
//  Copyright © 2020 Quốc Tuyến. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataBinding.h"

NS_ASSUME_NONNULL_BEGIN

@interface MonsterViewModel : NSObject
@property(nonatomic, readonly) DataBinding<NSArray *> * dataSourceObservable;

- (instancetype)init;
- (NSInteger)numberOfSection;
- (NSInteger)numberOfMonstersAtSection:(NSInteger)section;
- (id)monsterAtIndexPath:(NSIndexPath *)indexPath;
- (void)getMonsterWithCount:(NSInteger)count;
@end

NS_ASSUME_NONNULL_END
