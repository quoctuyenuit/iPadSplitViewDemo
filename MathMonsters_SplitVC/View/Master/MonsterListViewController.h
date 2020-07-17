//
//  MasterViewController.h
//  MathMonsters_SplitVC
//
//  Created by Quốc Tuyến on 7/16/20.
//  Copyright © 2020 Quốc Tuyến. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MonsterViewEntity.h"
#import "MasterTemplateViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MonsterListViewController : UITableViewController
@property(nonatomic, weak) id<MasterDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
