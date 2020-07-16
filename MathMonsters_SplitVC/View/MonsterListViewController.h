//
//  MasterViewController.h
//  MathMonsters_SplitVC
//
//  Created by Quốc Tuyến on 7/16/20.
//  Copyright © 2020 Quốc Tuyến. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MonsterViewEntity.h"

NS_ASSUME_NONNULL_BEGIN

@protocol MasterViewControllerDelegate;

@interface MonsterListViewController : UITableViewController
@property(nonatomic, weak) id<MasterViewControllerDelegate> delegate;
@end

@protocol MasterViewControllerDelegate <NSObject>
- (void)masterViewController:(MonsterListViewController *)viewController monsterSelected:(MonsterViewEntity *)monster;
@end

NS_ASSUME_NONNULL_END
