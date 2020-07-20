//
//  DetailViewController.m
//  MathMonsters_SplitVC
//
//  Created by Quốc Tuyến on 7/16/20.
//  Copyright © 2020 Quốc Tuyến. All rights reserved.
//

#import "MonsterDetailViewController.h"
#import "MonsterListViewController.h"

#define ICON_WIDTH                      90
#define WEAPON_ICON_WIDTH               50
#define LABEL_MONSTER                   @"Preferred Way To Kill"
#define DEFAULT_MONSTER_NAME            @"Monster Name"
#define DEFAULT_MONSTER_DESCRIPTION     @"Description"

#define DEBUG_VIEW_MODE                 0

@interface MonsterDetailViewController ()
@property (nonatomic) UILabel *nameLabel;
@property (nonatomic) UILabel *descriptionLabel;
@property (nonatomic) UILabel *killMonsterLabel;
@property (nonatomic) UIImageView *iconImageView;
@property (nonatomic) UIImageView *weaponImageView;
@property (nonatomic) UIView * textBoundView;

- (void)_configureView;
- (void)_layoutElements;
@end

@implementation MonsterDetailViewController

- (void)loadView {
    [super loadView];
    self.splitType = SplitViewControllerTypeDetail;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self _layoutElements];
    
#if DEBUG_VIEW_MODE
    self.nameLabel.backgroundColor          = UIColor.grayColor;
    self.descriptionLabel.backgroundColor   = UIColor.blueColor;
    self.killMonsterLabel.backgroundColor   = UIColor.redColor;
    self.iconImageView.backgroundColor      = UIColor.yellowColor;
    self.weaponImageView.backgroundColor    = UIColor.brownColor;
    self.textBoundView.backgroundColor      = UIColor.greenColor;
#endif
}

- (void)setMonster:(MonsterViewEntity *)monster {
    _monster = monster;
    [self _configureView];
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = UIColor.blackColor;
        _nameLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightMedium];
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        _nameLabel.text = DEFAULT_MONSTER_NAME;
    }
    return _nameLabel;
}

- (UILabel *)descriptionLabel {
    if (!_descriptionLabel) {
        _descriptionLabel = [[UILabel alloc] init];
        _descriptionLabel.textColor = UIColor.blackColor;
        _descriptionLabel.font = [UIFont systemFontOfSize:17 weight:UIFontWeightRegular];
        _descriptionLabel.textAlignment = NSTextAlignmentLeft;
        _descriptionLabel.text = DEFAULT_MONSTER_DESCRIPTION;
    }
    return _descriptionLabel;
}

- (UILabel *)killMonsterLabel {
    if (!_killMonsterLabel) {
        _killMonsterLabel = [[UILabel alloc] init];
        _killMonsterLabel.textColor = UIColor.blackColor;
        _killMonsterLabel.font = [UIFont systemFontOfSize:17 weight:UIFontWeightRegular];
        _killMonsterLabel.textAlignment = NSTextAlignmentLeft;
        _killMonsterLabel.text = LABEL_MONSTER;
    }
    return _killMonsterLabel;
}

- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.contentMode = UIViewContentModeScaleAspectFit;
        _iconImageView.backgroundColor = UIColor.clearColor;
    }
    return _iconImageView;
}

- (UIImageView *)weaponImageView {
    if (!_weaponImageView) {
        _weaponImageView = [[UIImageView alloc] init];
        _weaponImageView.contentMode = UIViewContentModeScaleAspectFit;
        _weaponImageView.backgroundColor = UIColor.clearColor;
    }
    return _weaponImageView;
}

- (UIView *)textBoundView {
    if (!_textBoundView) {
        _textBoundView = [[UIView alloc] init];
        _textBoundView.backgroundColor = UIColor.clearColor;
    }
    return _textBoundView;
}

- (void)_layoutElements {
    [self.view addSubview:self.textBoundView];
    [self.view addSubview:self.iconImageView];
    [self.view addSubview:self.weaponImageView];
    [self.textBoundView addSubview:self.nameLabel];
    [self.textBoundView addSubview:self.descriptionLabel];
    [self.textBoundView addSubview:self.killMonsterLabel];
    
    self.textBoundView.translatesAutoresizingMaskIntoConstraints = NO;
    self.iconImageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.weaponImageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.killMonsterLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.iconImageView.widthAnchor constraintEqualToConstant:ICON_WIDTH].active = YES;
    [self.iconImageView.heightAnchor constraintEqualToAnchor:self.iconImageView.widthAnchor].active = YES;
    [self.iconImageView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor constant:-100].active = YES;
    [self.iconImageView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
    
    [self.weaponImageView.topAnchor constraintEqualToAnchor:self.textBoundView.bottomAnchor constant:8].active = YES;
    [self.weaponImageView.leadingAnchor constraintEqualToAnchor:self.iconImageView.trailingAnchor constant:8].active = YES;
    [self.weaponImageView.widthAnchor constraintEqualToConstant:WEAPON_ICON_WIDTH].active = YES;
    [self.weaponImageView.heightAnchor constraintEqualToAnchor:self.weaponImageView.widthAnchor].active = YES;
    
    [self.textBoundView.topAnchor constraintEqualToAnchor:self.iconImageView.topAnchor].active = YES;
    [self.textBoundView.leadingAnchor constraintEqualToAnchor:self.iconImageView.trailingAnchor constant:8].active = YES;
    [self.textBoundView.trailingAnchor constraintLessThanOrEqualToAnchor:self.view.trailingAnchor constant:-10].active = YES;
    
    [self.nameLabel.leadingAnchor constraintEqualToAnchor:self.textBoundView.leadingAnchor].active = YES;
    [self.nameLabel.topAnchor constraintEqualToAnchor:self.textBoundView.topAnchor].active = YES;
    [self.nameLabel.trailingAnchor constraintEqualToAnchor:self.textBoundView.trailingAnchor].active = YES;
    
    [self.descriptionLabel.leadingAnchor constraintEqualToAnchor:self.textBoundView.leadingAnchor].active = YES;
    [self.descriptionLabel.topAnchor constraintEqualToAnchor:self.nameLabel.bottomAnchor constant:15].active = YES;
    [self.descriptionLabel.trailingAnchor constraintEqualToAnchor:self.textBoundView.trailingAnchor].active = YES;

    [self.killMonsterLabel.leadingAnchor constraintEqualToAnchor:self.textBoundView.leadingAnchor].active = YES;
    [self.killMonsterLabel.topAnchor constraintEqualToAnchor:self.descriptionLabel.bottomAnchor constant:8].active = YES;
    [self.killMonsterLabel.trailingAnchor constraintEqualToAnchor:self.textBoundView.trailingAnchor].active = YES;
    [self.killMonsterLabel.bottomAnchor constraintEqualToAnchor:self.textBoundView.bottomAnchor].active = YES;
}

- (void)_configureView {
    if (_monster == nil) return;
    
    [self loadViewIfNeeded];
    _nameLabel.text = _monster.name;
    _descriptionLabel.text = _monster.desc;
    _iconImageView.image = _monster.icon;
    _weaponImageView.image = _monster.weaponIcon;
}

@synthesize prefferedPushType;

@synthesize sender;

@synthesize splitType;

@end
