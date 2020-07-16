//
//  SceneDelegate.m
//  MathMonsters_SplitVC
//
//  Created by Quốc Tuyến on 7/16/20.
//  Copyright © 2020 Quốc Tuyến. All rights reserved.
//

#import "SceneDelegate.h"
#import "MonsterListViewController.h"
#import "DetailViewController.h"

@interface SceneDelegate () <UISplitViewControllerDelegate>

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    
    UISplitViewController *splitViewController = [[UISplitViewController alloc] init];
    
    MonsterListViewController * monsterListVc   = [[MonsterListViewController alloc] init];
    DetailViewController *      detailVc        = [[DetailViewController alloc] init];
    
    monsterListVc.delegate = detailVc;
    
    UINavigationController *masterNav = [[UINavigationController alloc] initWithRootViewController:monsterListVc];
    UINavigationController *detailNav = [[UINavigationController alloc] initWithRootViewController:detailVc];
    [masterNav setTitle:@"Monster List"];
    
    splitViewController.viewControllers = @[masterNav, detailNav];
    splitViewController.delegate = self;
    detailVc.navigationItem.leftItemsSupplementBackButton = true;
    detailVc.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem;
    
    UIWindowScene * windowScene = (UIWindowScene *) scene;
    _window                     = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    _window.rootViewController  = splitViewController;
    [_window makeKeyAndVisible];
    _window.windowScene = windowScene;
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}

- (BOOL)splitViewController:(UISplitViewController *)splitViewController collapseSecondaryViewController:(UIViewController *)secondaryViewController ontoPrimaryViewController:(UIViewController *)primaryViewController {
    
    if ([secondaryViewController isKindOfClass:[UINavigationController class]] &&
        [[(UINavigationController *)secondaryViewController topViewController] isKindOfClass:[DetailViewController class]] &&
        ([(DetailViewController *)[(UINavigationController *)secondaryViewController topViewController] monster] == nil)) {
        // Return YES to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
        return YES;
    } else {
        return NO;
    }
}

@end
