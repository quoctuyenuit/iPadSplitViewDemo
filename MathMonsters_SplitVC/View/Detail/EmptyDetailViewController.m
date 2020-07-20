//
//  DetailViewController.m
//  MathMonsters_SplitVC
//
//  Created by Quốc Tuyến on 7/17/20.
//  Copyright © 2020 Quốc Tuyến. All rights reserved.
//

#import "EmptyDetailViewController.h"

#define TEXT_DEFAULT    @"Detail ViewController"
#define SELF_TITLE      @"Detail"

@interface EmptyDetailViewController ()
@property(nonatomic) UILabel * label;
@property(nonatomic) UIViewController * currentDetail;
@end

@implementation EmptyDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:SELF_TITLE];
    [self setupView];
}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.textColor = UIColor.redColor;
        _label.font = [UIFont systemFontOfSize:20 weight:UIFontWeightMedium];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.text = TEXT_DEFAULT;
    }
    return _label;
}

- (void)setupView {
    [self.view addSubview:self.label];
    self.label.translatesAutoresizingMaskIntoConstraints = NO;
    [self.label.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.label.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
}

@end
