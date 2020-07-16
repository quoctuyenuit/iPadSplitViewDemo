//
//  MonsterViewEntity.h
//  MathMonsters_SplitVC
//
//  Created by Quốc Tuyến on 7/16/20.
//  Copyright © 2020 Quốc Tuyến. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Monster.h"

NS_ASSUME_NONNULL_BEGIN

@interface MonsterViewEntity : NSObject
@property(nonatomic) NSString * name;
@property(nonatomic) NSString * desc;
@property(nonatomic, readonly) UIImage * icon;
@property(nonatomic, readonly) UIImage * weaponIcon;

- (instancetype)initWithName:(NSString *)name
                 description:(NSString *)desc
                    iconName:(NSString *)iconName
                      weapon:(Weapon)weapon;

- (instancetype)initWithModel:(Monster *)model;
@end

NS_ASSUME_NONNULL_END
