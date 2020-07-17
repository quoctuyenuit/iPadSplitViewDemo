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

@interface MasterViewController () <MasterDelegate, UISplitViewControllerDelegate, UITabBarControllerDelegate>
@property(nonatomic) UITabBarController * tabbarController;
@property(nonatomic) UIViewController * detailController;
@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupView];
    [self.navigationController.navigationBar setHidden:YES];
    
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(orientationDidChanged:) name:UIDeviceOrientationDidChangeNotification object:nil];
}

- (void)orientationDidChanged:(NSNotification *)notification {
    if (self.detailController && UIDeviceOrientationIsLandscape(UIDevice.currentDevice.orientation)) {
        UINavigationController * detailNav = [[UINavigationController alloc] initWithRootViewController:self.detailController];
        self.splitViewController.viewControllers = @[self, detailNav];
        self.detailController.navigationItem.leftItemsSupplementBackButton = true;
        self.detailController.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
    }
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
        self.detailController = detailViewController;
    } else {
        UINavigationController * detailNav = [[UINavigationController alloc] initWithRootViewController:detailViewController];
        [self.splitViewController showDetailViewController:detailNav sender:templateViewController];
        detailViewController.navigationItem.leftItemsSupplementBackButton = true;
        detailViewController.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    [self popAllNavigation];
}

- (void)popAllNavigation {
    for (UINavigationController * nav in self.tabbarController.viewControllers) {
        while (nav.viewControllers.count > 1) {
            [nav popViewControllerAnimated:NO];
        }
    }
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    self.detailController = nil;
}

@end
