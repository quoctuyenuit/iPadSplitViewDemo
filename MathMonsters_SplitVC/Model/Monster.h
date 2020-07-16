//
//  Monster.h
//  MathMonsters_SplitVC
//
//  Created by Quốc Tuyến on 7/16/20.
//  Copyright © 2020 Quốc Tuyến. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, Weapon) {
  WeaponBlowgun = 0,
  WeaponNinjaStar,
  WeaponFire,
  WeaponSword,
  WeaponSmoke
};

extern UIImage * _Nullable ImageFromWeapon(Weapon weapon);

static NSInteger const WeaponCount = 3;

NS_ASSUME_NONNULL_BEGIN

@interface Monster : NSObject

@property(nonatomic, readonly) NSString * name;
@property(nonatomic, readonly) NSString * desc;
@property(nonatomic, readonly) NSString * iconName;
@property(nonatomic, readonly) Weapon     weapon;

- (instancetype)initWithName:(NSString *)name description:(NSString *)desc iconName:(NSString *)iconName weapon:(Weapon)weapon;
@end

NS_ASSUME_NONNULL_END
