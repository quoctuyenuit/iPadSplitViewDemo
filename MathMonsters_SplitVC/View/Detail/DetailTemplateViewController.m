//
//  DetailTemplateViewController.m
//  MathMonsters_SplitVC
//
//  Created by Quốc Tuyến on 7/17/20.
//  Copyright © 2020 Quốc Tuyến. All rights reserved.
//

#import "DetailTemplateViewController.h"

@interface DetailTemplateViewController ()
@property(nonatomic) UIButton * pushButton;
@property(nonatomic) UILabel * label;
@end

@implementation DetailTemplateViewController

@synthesize sender;

@synthesize prefferedPushType;

- (instancetype)initWithTitle:(NSString *)title {
    if (self = [super initWithNibName:nil bundle:nil]) {
        [self setTitle:[title stringByAppendingFormat:@" Detail"]];
        [self.navigationController.navigationBar setHidden:NO];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

- (UIButton *)pushButton {
    if (!_pushButton) {
        _pushButton = [[UIButton alloc] init];
        _pushButton.backgroundColor = UIColor.whiteColor;
        [_pushButton setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
        [_pushButton setTitle:@"Push" forState:UIControlStateNormal];
        [_pushButton addTarget:self action:@selector(pushAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _pushButton;
}

- (void)setupView {
    [self.view addSubview:self.pushButton];
    
    self.pushButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.pushButton.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:100].active = YES;
    [self.pushButton.widthAnchor constraintEqualToConstant:80].active = YES;
    [self.pushButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
}

- (void)pushAction:(id)sender {
    UIViewController * viewController = [[DetailTemplateViewController alloc] initWithTitle:self.title];
    viewController.view.backgroundColor = self.view.backgroundColor;
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
