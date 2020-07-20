//
//  NavigationManager.h
//  MathMonsters_SplitVC
//
//  Created by Quốc Tuyến on 7/20/20.
//  Copyright © 2020 Quốc Tuyến. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NavigationElementProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@protocol NavigationManagerDelegate;

@interface NavigationManager : NSObject
@property(nonatomic, weak) id<NavigationManagerDelegate> delegate;
+ (instancetype)navigator;
- (void)pushViewController:(UIViewController<NavigationElementProtocol> *)viewController
                  animated:(BOOL)animated;
- (void)popViewController:(BOOL)animated;
- (void)presentViewController:(UIViewController<NavigationElementProtocol> *)viewControllerToPresent
                     animated:(BOOL)animated
                   completion:(void (^ _Nullable)(void))completion;
- (UIViewController *)topViewController;
- (UIViewController *)visibleViewController;
@end

@protocol NavigationManagerDelegate <NSObject>
@property(nonatomic, readonly) UISplitViewController * naviSplitViewController;
@end

NS_ASSUME_NONNULL_END
