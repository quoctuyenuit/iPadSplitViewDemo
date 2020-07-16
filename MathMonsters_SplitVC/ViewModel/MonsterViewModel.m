//
//  MonsterViewModel.m
//  MathMonsters_SplitVC
//
//  Created by Quốc Tuyến on 7/16/20.
//  Copyright © 2020 Quốc Tuyến. All rights reserved.
//

#import "MonsterViewModel.h"
#import <UIKit/UIKit.h>
#import "MonsterFactory.h"
#import "Monster.h"
#import "MonsterViewEntity.h"

@interface MonsterViewModel ()
@property(nonatomic) NSMutableArray * monsters;
@property(nonatomic) MonsterFactory * factory;
@end

@implementation MonsterViewModel
- (instancetype)init {
    if (self = [super init]) {
        _monsters = [NSMutableArray array];
        _dataSourceObservable = [[DataBinding alloc] init];
        _factory = [[MonsterFactory alloc] init];
    }
    return self;
}

- (NSInteger)numberOfSection {
    return 1;
}

- (NSInteger)numberOfMonstersAtSection:(NSInteger)section {
    return _monsters.count;
}

- (id)monsterAtIndexPath:(NSIndexPath *)indexPath {
    NSAssert(indexPath.row >= 0 && indexPath.row < _monsters.count, @"Invalid indexPath");
    if (indexPath.row < 0 || indexPath.row >= _monsters.count) {
        return nil;
    }
    return [_monsters objectAtIndex:indexPath.row];
}

- (void)getMonsterWithCount:(NSInteger)count {
    NSAssert(count > 0, @"Invalid count");
    if (count < 0) return;
    
    NSArray * monsterModels = [_factory getMonsterWithCount:count];
    for (Monster * monster in monsterModels) {
        [_monsters addObject: [[MonsterViewEntity alloc] initWithModel:monster]];
    }
    _dataSourceObservable.value = _monsters;
}
@end
