//
//  DetailViewController.h
//  MathMonsters_SplitVC
//
//  Created by Quốc Tuyến on 7/16/20.
//  Copyright © 2020 Quốc Tuyến. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MonsterViewEntity.h"
#import "MonsterListViewController.h"
#import "NavigationElementProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface MonsterDetailViewController : UIViewController <NavigationElementProtocol>

@property(nonatomic) MonsterViewEntity * monster;

@end

NS_ASSUME_NONNULL_END
