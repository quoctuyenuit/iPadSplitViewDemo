//
//  MonsterFactory.m
//  MathMonsters_SplitVC
//
//  Created by Quốc Tuyến on 7/16/20.
//  Copyright © 2020 Quốc Tuyến. All rights reserved.
//

#import "MonsterFactory.h"
#import "Monster.h"

@interface MonsterFactory ()
@property(nonatomic) Class modelClass;
@property(nonatomic) NSArray * defaultsMonster;
@end

@implementation MonsterFactory
- (instancetype)init {
    _defaultsMonster = [NSArray arrayWithArray: [self _getDefaultMonsters]];
    return self;
}

- (NSArray *)_getDefaultMonsters {
    NSMutableArray * monsters = [NSMutableArray array];
    
    [monsters addObject:[[Monster alloc] initWithName:@"Cat-Bot"
                                          description:@"MEE-OW"
                                             iconName:@"meetcatbot"
                                               weapon:WeaponSword]];
    
    [monsters addObject:[[Monster alloc] initWithName:@"Dog-Bot"
                                          description:@"BOW-WOW"
                                             iconName:@"meetdogbot"
                                               weapon:WeaponBlowgun]];
    
    [monsters addObject:[[Monster alloc] initWithName:@"Explode-Bot"
                                          description:@"BOOM!"
                                             iconName:@"meetexplodebot"
                                               weapon:WeaponSmoke]];
    
    [monsters addObject:[[Monster alloc] initWithName:@"Fire-Bot"
                                          description:@"Will Make You Steamed"
                                             iconName:@"meetfirebot"
                                               weapon:WeaponNinjaStar]];
    
    [monsters addObject:[[Monster alloc] initWithName:@"Ice-Bot"
                                          description:@"Has A Chilling Effect"
                                             iconName:@"meeticebot"
                                               weapon:WeaponFire]];
    
    [monsters addObject:[[Monster alloc] initWithName:@"Mini-Tomato-Bot"
                                          description:@"Extremely Handsome"
                                             iconName:@"meetminitomatobot"
                                               weapon:WeaponNinjaStar]];
    
    return monsters;
}

- (NSArray *)getMonsterWithCount:(NSInteger)count {
    NSAssert(count > 0, @"Invalid count");
    if (count < 0) return nil;
    
    NSMutableArray * result = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        int index = i % _defaultsMonster.count;
        [result addObject: [_defaultsMonster objectAtIndex:index]];
    }
    return result;
}
@end
