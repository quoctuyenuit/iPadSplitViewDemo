//
//  MasterViewController.h
//  MathMonsters_SplitVC
//
//  Created by Quốc Tuyến on 7/17/20.
//  Copyright © 2020 Quốc Tuyến. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationElementProtocol.h"

NS_ASSUME_NONNULL_BEGIN


@interface MasterViewController : UIViewController
@end

@protocol MasterDelegate;

@protocol MasterViewControllerProtocol <NSObject>
@property(nonatomic, weak) id<MasterDelegate> delegate;
@end

@protocol MasterDelegate <NSObject>
- (void)masterViewController:(UIViewController<NavigationElementProtocol> *)sender
                  showDetail:(UIViewController<NavigationElementProtocol> *)detailViewController;
@end

NS_ASSUME_NONNULL_END
