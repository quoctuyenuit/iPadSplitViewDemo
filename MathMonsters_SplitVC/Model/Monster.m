//
//  Monster.m
//  MathMonsters_SplitVC
//
//  Created by Quốc Tuyến on 7/16/20.
//  Copyright © 2020 Quốc Tuyến. All rights reserved.
//

#import "Monster.h"

extern UIImage * _Nullable ImageFromWeapon(Weapon weapon) {
    switch (weapon) {
        case WeaponBlowgun:
            return [UIImage imageNamed:@"blowgun.png"];
        case WeaponFire:
            return [UIImage imageNamed:@"fire.png"];
        case WeaponNinjaStar:
            return [UIImage imageNamed:@"ninjastar.png"];
        case WeaponSmoke:
            return [UIImage imageNamed:@"smoke.png"];
        case WeaponSword:
            return [UIImage imageNamed:@"sword.png"];
    }
    return nil;
}

@implementation Monster

- (instancetype)initWithName:(NSString *)name description:(NSString *)desc iconName:(NSString *)iconName weapon:(Weapon)weapon {
    _name       = name;
    _desc       = desc;
    _iconName   = iconName;
    _weapon     = weapon;
    return self;
}

@end

