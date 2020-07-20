//
//  NavigationManager.m
//  MathMonsters_SplitVC
//
//  Created by Quốc Tuyến on 7/20/20.
//  Copyright © 2020 Quốc Tuyến. All rights reserved.
//

#import "NavigationManager.h"

@interface NavigationManager ()
@property(nonatomic, readonly) UISplitViewController * splitViewController;
@property(nonatomic) UINavigationController * detailNavigationController;
@end

@implementation NavigationManager

+ (instancetype)navigator {
    static NavigationManager * sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[NavigationManager alloc] init];
    });
    return sharedInstance;
}

- (UISplitViewController *)splitViewController {
    NSAssert(self.delegate, @"delegate is not set");
    if (self.delegate && [self.delegate respondsToSelector:@selector(naviSplitViewController)]) {
        return self.delegate.naviSplitViewController;
    }
    return nil;
}

- (void)pushViewController:(UIViewController<NavigationElementProtocol> *)viewController animated:(BOOL)animated {
    if (self.splitViewController.viewControllers.count == 1 ||
        viewController.sender.prefferedPushType == ViewControllerPushTypePushCurrentMaster)
    {
        [viewController.sender.navigationController pushViewController:viewController animated:animated];
        self.detailNavigationController = viewController.sender.navigationController;
    }
    else if (self.splitViewController.viewControllers.count > 1)
    {
        ViewControllerPushType pushType = viewController.sender.prefferedPushType;
        switch (pushType) {
                
            case ViewControllerPushTypeReplaceCurrentDetail: {
                UINavigationController * detailNav = [[UINavigationController alloc] initWithRootViewController:viewController];
                viewController.navigationItem.leftItemsSupplementBackButton = YES;
                viewController.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
                [self.splitViewController showDetailViewController:detailNav sender:viewController.sender];
                break;
            }
                
            case ViewControllerPushTypePushCurrentDetail: {
                UINavigationController * detailNav = (UINavigationController *)self.splitViewController.viewControllers.lastObject;
                if (detailNav == nil) {
                    detailNav = [[UINavigationController alloc] initWithRootViewController:viewController];
                    viewController.navigationItem.leftItemsSupplementBackButton = YES;
                    viewController.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
                } else if (![detailNav isKindOfClass: [UINavigationController class]]) {
                    detailNav = [[UINavigationController alloc] initWithRootViewController:self.splitViewController.viewControllers.lastObject];
                    [detailNav pushViewController:viewController animated:animated];
                } else {
                    [detailNav pushViewController:viewController animated:animated];
                }
                [self.splitViewController showDetailViewController:detailNav sender:viewController.sender];
                break;
            }
                
            default:
                break;
        }
        self.detailNavigationController = (UINavigationController *)self.splitViewController.viewControllers.lastObject;
    }
}

- (UIViewController *)popViewController:(BOOL)animated {
    return [self.detailNavigationController popViewControllerAnimated:animated];
}

- (void)presentViewController:(UIViewController<NavigationElementProtocol> *)viewControllerToPresent
                     animated:(BOOL)animated
                   completion:(void (^ _Nullable)(void))completion {
    viewControllerToPresent.modalPresentationStyle = UIModalPresentationPopover;
    [self.splitViewController presentViewController:viewControllerToPresent animated:animated completion:completion];
}

- (UIViewController *)topViewController {
    return self.detailNavigationController.topViewController;
}

- (UIViewController *)visibleViewController {
    return self.detailNavigationController.visibleViewController;
}
@end
