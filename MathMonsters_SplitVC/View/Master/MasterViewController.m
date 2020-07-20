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

@interface MasterViewController () <MasterDelegate, UISplitViewControllerDelegate, UITabBarControllerDelegate>
@property(nonatomic) UITabBarController * tabbarController;
@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupView];
    [self.navigationController.navigationBar setHidden:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)setupView {
    _tabbarController = [[UITabBarController alloc] init];
    MasterTemplateViewController * tab1 = [[MasterTemplateViewController alloc] initWithTitle:@"Tab1"];
    MasterTemplateViewController * tab2 = [[MasterTemplateViewController alloc] initWithTitle:@"Tab2"];
    MasterTemplateViewController * tab3 = [[MasterTemplateViewController alloc] initWithTitle:@"Tab3"];
    MonsterListViewController * tab4 = [[MonsterListViewController alloc] init];
    
    tab1.delegate = self;
    tab2.delegate = self;
    tab3.delegate = self;
    tab4.delegate = self;
    
    tab1.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMore tag:1];
    tab2.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemHistory tag:1];
    tab3.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:1];
    tab4.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemBookmarks tag:1];
    
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
- (void)masterViewController:(nonnull UIViewController *)templateViewController showDetail:(nonnull UIViewController *)detailViewController {
    if (self.splitViewController.viewControllers.count == 1) {
        [templateViewController.navigationController pushViewController:detailViewController animated:YES];
    } else {
        UINavigationController * detailNav = [[UINavigationController alloc] initWithRootViewController:detailViewController];
        [self.splitViewController showDetailViewController:detailNav sender:templateViewController];
        detailViewController.navigationItem.leftItemsSupplementBackButton = true;
        detailViewController.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
    }
}

- (UIViewController *)separateSecondaryViewControllerForSplitViewController:(UISplitViewController *)splitViewController {
    UINavigationController *currentTab = (UINavigationController *)self.tabbarController.selectedViewController;
    NSMutableArray * detailViewControllers = [NSMutableArray array];
    
    NSInteger i = 1;
    while (i < currentTab.viewControllers.count) {
        [detailViewControllers addObject:currentTab.viewControllers[i++]];
    }
    [currentTab popToRootViewControllerAnimated:NO];
    if (detailViewControllers.count == 0) {
        UIViewController * emptyDetail = [[EmptyDetailViewController alloc] init];
        emptyDetail.navigationItem.leftItemsSupplementBackButton = YES;
        emptyDetail.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem;
        return [[UINavigationController alloc] initWithRootViewController: emptyDetail];
    }
    
    UINavigationController * detailNavi = [[UINavigationController alloc] init];
    for (UIViewController * vc in detailViewControllers) {
        [detailNavi pushViewController:vc animated:NO];
    }
    return detailNavi;
}

- (void)collapseSecondaryViewController:(UIViewController *)secondaryViewController forSplitViewController:(UISplitViewController *)splitViewController {
    UINavigationController * currentTab = (UINavigationController *)self.tabbarController.selectedViewController;
    if (currentTab != nil) {
        UINavigationController * detailNavi = (UINavigationController *)secondaryViewController;
        UIViewController * detailVc = detailNavi.topViewController;
        if ([detailVc isKindOfClass:[EmptyDetailViewController class]]) return;
        
        while (detailNavi.viewControllers.count > 0) {
            [currentTab pushViewController: [detailNavi.viewControllers objectAtIndex:0] animated:NO];
        }
    }
}
@end
