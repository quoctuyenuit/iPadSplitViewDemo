//
//  MasterViewController.m
//  MathMonsters_SplitVC
//
//  Created by Quốc Tuyến on 7/17/20.
//  Copyright © 2020 Quốc Tuyến. All rights reserved.
//

#import "MasterViewController.h"
#import "MasterTemplateViewController.h"
#import "MonsterListViewController.h"
#import "EmptyDetailViewController.h"
#import "NavigationManager.h"
#import "NavigationElementProtocol.h"

@interface MasterViewController () <MasterDelegate, UISplitViewControllerDelegate, UITabBarControllerDelegate, NavigationManagerDelegate>
@property(nonatomic) UITabBarController * tabbarController;
@end

@implementation MasterViewController

- (void)loadView {
    [super loadView];
    [NavigationManager navigator].delegate = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
    [self.navigationController.navigationBar setHidden:YES];
}

- (void)setupView {
    _tabbarController = [[UITabBarController alloc] init];
    UIViewController<MasterViewControllerProtocol> * tab1 = [[MasterTemplateViewController alloc] initWithTitle:@"Tab1 Master" withIndex:1];
    UIViewController<MasterViewControllerProtocol> * tab2 = [[MasterTemplateViewController alloc] initWithTitle:@"Tab2 Master" withIndex:1];
    UIViewController<MasterViewControllerProtocol> * tab3 = [[MasterTemplateViewController alloc] initWithTitle:@"Tab3 Master" withIndex:1];
    UIViewController<MasterViewControllerProtocol> * tab4 = [[MonsterListViewController alloc] init];
    
    tab1.delegate = self;
    tab2.delegate = self;
    tab3.delegate = self;
    tab4.delegate = self;
    
    tab1.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMore tag:1];
    tab2.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemHistory tag:2];
    tab3.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:3];
    tab4.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemBookmarks tag:4];
    
    tab1.view.backgroundColor = UIColor.greenColor;
    tab2.view.backgroundColor = UIColor.grayColor;
    tab3.view.backgroundColor = UIColor.cyanColor;
    
    UINavigationController * tab1Nav = [[UINavigationController alloc] initWithRootViewController:tab1];
    UINavigationController * tab2Nav = [[UINavigationController alloc] initWithRootViewController:tab2];
    UINavigationController * tab3Nav = [[UINavigationController alloc] initWithRootViewController:tab3];
    UINavigationController * tab4Nav = [[UINavigationController alloc] initWithRootViewController:tab4];
    
    _tabbarController.viewControllers = @[tab1Nav, tab2Nav, tab3Nav, tab4Nav];
    
    [self addChildViewController:_tabbarController];
    [self.view addSubview:_tabbarController.view];
    _tabbarController.view.translatesAutoresizingMaskIntoConstraints = NO;
    
    [_tabbarController.view.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [_tabbarController.view.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [_tabbarController.view.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    [_tabbarController.view.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
}

#pragma mark - TemplateViewControllerDelegate methods
- (void)masterViewController:(nonnull UIViewController<NavigationElementProtocol> *)sender
                  showDetail:(nonnull UIViewController<NavigationElementProtocol> *)detailViewController {
    detailViewController.sender = sender;
    [[NavigationManager navigator] pushViewController:detailViewController animated:YES];
}

#pragma mark - UISplitViewController category methods
- (UIViewController *)separateSecondaryViewControllerForSplitViewController:(UISplitViewController *)splitViewController {
   
    UINavigationController *currentTab = (UINavigationController *)self.tabbarController.selectedViewController;
    /**
     * ----------------------------------------------------------------------------------------------------------------------------------------------------------------
     * Get all detail ViewControllers to push in split detail NavigationController
     * ----------------------------------------------------------------------------------------------------------------------------------------------------------------
     */
    NSMutableArray * detailViewControllers = [NSMutableArray array];
    while (currentTab.viewControllers.count > 1 && ((UIViewController<NavigationElementProtocol> *)currentTab.topViewController).splitType == SplitViewControllerTypeDetail) {
        [detailViewControllers addObject:[currentTab popViewControllerAnimated:NO]];
    }
    /**
     * ----------------------------------------------------------------------------------------------------------------------------------------------------------------
     * If current tab dont have any detail or dont want to present detail in split ==> show empty viewcontroller
     * ----------------------------------------------------------------------------------------------------------------------------------------------------------------
     */
    if (detailViewControllers.count == 0) {
        UIViewController * emptyDetail = [[EmptyDetailViewController alloc] init];
        emptyDetail.navigationItem.leftItemsSupplementBackButton = YES;
        emptyDetail.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem;
        return [[UINavigationController alloc] initWithRootViewController: emptyDetail];
    }
    
    UINavigationController * detailNavi = [[UINavigationController alloc] init];
    for (NSInteger index = detailViewControllers.count - 1; index >= 0; index--) {
        UIViewController * vc = [detailViewControllers objectAtIndex:index];
        [detailNavi pushViewController:vc animated:NO];
    }
    detailNavi.viewControllers.firstObject.navigationItem.leftItemsSupplementBackButton = YES;
    detailNavi.viewControllers.firstObject.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem;
    return detailNavi;
}

- (void)collapseSecondaryViewController:(UIViewController *)secondaryViewController
                 forSplitViewController:(UISplitViewController *)splitViewController {
    
     UINavigationController * currentTab = (UINavigationController *)self.tabbarController.selectedViewController;
       if (currentTab != nil) {
           UINavigationController * detailNavi = (UINavigationController *)secondaryViewController;
           if ([detailNavi.topViewController isKindOfClass:[EmptyDetailViewController class]]) return;
           
           UIViewController<NavigationElementProtocol> * currentMaster = (UIViewController<NavigationElementProtocol> *)currentTab.topViewController;
           UIViewController<NavigationElementProtocol> * rootDetail = (UIViewController<NavigationElementProtocol> *)detailNavi.viewControllers.firstObject;
           
           if (rootDetail.sender == currentMaster) {
               while (detailNavi.viewControllers.count > 0) {
                   [currentTab pushViewController: [detailNavi.viewControllers objectAtIndex:0] animated:NO];
               }
           }
       }
}

#pragma mark - NavigationManagerDelegate methods
- (UISplitViewController *)naviSplitViewController {
    return self.splitViewController;
}
@end
