//
//  MasterTemplateViewController.h
//  MathMonsters_SplitVC
//
//  Created by Quốc Tuyến on 7/17/20.
//  Copyright © 2020 Quốc Tuyến. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MasterViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MasterTemplateViewController : UIViewController <MasterViewControllerProtocol, NavigationElementProtocol>
- (instancetype)initWithTitle:(NSString *)title withIndex:(int)index;
@end

NS_ASSUME_NONNULL_END
