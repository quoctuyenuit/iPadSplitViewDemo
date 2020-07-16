//
//  MonsterViewEntity.m
//  MathMonsters_SplitVC
//
//  Created by Quốc Tuyến on 7/16/20.
//  Copyright © 2020 Quốc Tuyến. All rights reserved.
//

#import "MonsterViewEntity.h"

@interface MonsterViewEntity ()
@property(nonatomic) NSString * iconName;
@property(nonatomic) Weapon weapon;
@end

@implementation MonsterViewEntity
- (instancetype)initWithName:(NSString *)name description:(NSString *)desc iconName:(NSString *)iconName weapon:(Weapon)weapon {
    _name = name;
    _desc = desc;
    _iconName = iconName;
    _weapon = weapon;
    return self;
}

- (instancetype)initWithModel:(Monster *)model {
    return [self initWithName:model.name description:model.desc iconName:model.iconName weapon:model.weapon];
}

- (UIImage *)icon {
    return [UIImage imageNamed:_iconName];
}

- (UIImage *)weaponIcon {
    return ImageFromWeapon(_weapon);
}
@end
