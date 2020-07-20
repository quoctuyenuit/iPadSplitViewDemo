//
//  NavigationManager.h
//  MathMonsters_SplitVC
//
//  Created by Quốc Tuyến on 7/20/20.
//  Copyright © 2020 Quốc Tuyến. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol NavigationManagerDelegate;

@interface NavigationManager : NSObject
@property(nonatomic, weak) id<NavigationManagerDelegate> delegate;

@end

@protocol NavigationManagerDelegate <NSObject>
@property(nonatomic, readonly) UISplitViewController * splitViewController;
@end

NS_ASSUME_NONNULL_END
