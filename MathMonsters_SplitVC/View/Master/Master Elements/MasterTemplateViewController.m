//
//  MasterTemplateViewController.m
//  MathMonsters_SplitVC
//
//  Created by Quốc Tuyến on 7/17/20.
//  Copyright © 2020 Quốc Tuyến. All rights reserved.
//

#import "MasterTemplateViewController.h"
#import "DetailTemplateViewController.h"
#import "MasterViewController.h"

#define DEBUG_VIEW_MODE     0

@interface MasterTemplateViewController ()
@property(nonatomic) UIButton * pushButton;
@property(nonatomic) UIButton * showDetailButton;
@property(nonatomic) UIView * contentView;
@property(nonatomic, assign) NSString * masterTitle;
- (void)_setupView;
@end

@implementation MasterTemplateViewController

@synthesize delegate;

@synthesize sender;

@synthesize prefferedPushType;

- (instancetype)initWithTitle:(NSString *)title {
    if (self = [super initWithNibName:nil bundle:nil]) {
        self.masterTitle = title;
        [self setTitle:[title stringByAppendingFormat:@" Master"]];
        self.prefferedPushType = ViewControllerPushTypeReplaceCurrentDetail;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _setupView];
    self.view.backgroundColor = UIColor.whiteColor;

#if DEBUG_VIEW_MODE
    self.contentView.backgroundColor = UIColor.greenColor;
    self.pushButton.backgroundColor = UIColor.blueColor;
    self.showDetailButton.backgroundColor = UIColor.brownColor;
#endif
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

- (UIButton *)showDetailButton {
    if (!_showDetailButton) {
        _showDetailButton = [[UIButton alloc] init];
        _showDetailButton.backgroundColor = UIColor.whiteColor;
        [_showDetailButton setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
        [_showDetailButton setTitle:@"Show Detail" forState:UIControlStateNormal];
        [_showDetailButton addTarget:self action:@selector(showDetailAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _showDetailButton;
}

- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [[UIView alloc] init];
        _contentView.backgroundColor = UIColor.clearColor;
    }
    return _contentView;
}

- (void)_setupView {
    [self.view addSubview:self.contentView];
    [self.contentView addSubview:self.pushButton];
    [self.contentView addSubview:self.showDetailButton];
    
    self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
    self.pushButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.showDetailButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.contentView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.contentView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
    
    [self.pushButton.topAnchor constraintEqualToAnchor:self.contentView.topAnchor].active = YES;
    [self.pushButton.centerXAnchor constraintEqualToAnchor:self.contentView.centerXAnchor].active = YES;
    [self.pushButton.widthAnchor constraintEqualToConstant:80].active = YES;
    
    [self.showDetailButton.topAnchor constraintEqualToAnchor:self.pushButton.bottomAnchor constant:8].active = YES;
    [self.showDetailButton.leadingAnchor constraintEqualToAnchor: self.contentView.leadingAnchor].active = YES;
    [self.showDetailButton.trailingAnchor constraintEqualToAnchor: self.contentView.trailingAnchor].active = YES;
    [self.showDetailButton.widthAnchor constraintEqualToConstant:120].active = YES;
    [self.showDetailButton.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor].active = YES;
}

- (void)pushAction:(id)sender {
    UIViewController * viewController = [[MasterTemplateViewController alloc] initWithTitle:self.masterTitle];
    viewController.view.backgroundColor = self.view.backgroundColor;
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)showDetailAction:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(masterViewController:showDetail:)]) {
        UIViewController<NavigationElementProtocol> * detailVc = [[DetailTemplateViewController alloc] initWithTitle:self.masterTitle];
        detailVc.view.backgroundColor = self.view.backgroundColor;
        
        [self.delegate masterViewController:self showDetail:detailVc];
    }
}
@end
