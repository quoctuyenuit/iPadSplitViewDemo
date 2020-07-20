//
//  MasterViewController.m
//  MathMonsters_SplitVC
//
//  Created by Quốc Tuyến on 7/16/20.
//  Copyright © 2020 Quốc Tuyến. All rights reserved.
//

#import "MonsterListViewController.h"
#import "MonsterViewModel.h"
#import "MonsterViewEntity.h"
#import "MonsterDetailViewController.h"

#define CELL_REUSEIDENTIFIER    @"Monster Cell"
#define SELF_TITLE              @"Monster List"
#define NUMBER_OF_MONSTER       20

@interface MonsterListViewController ()
@property(nonatomic) MonsterViewModel * viewModel;
@property(nonatomic) MonsterDetailViewController * detailMonsterViewController;
@end

@implementation MonsterListViewController

@synthesize delegate;

@synthesize sender;

@synthesize prefferedPushType;

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setTitle:SELF_TITLE];
        self.prefferedPushType = ViewControllerPushTypeReplaceCurrentDetail;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _viewModel = [[MonsterViewModel alloc] init];
    _detailMonsterViewController = [[MonsterDetailViewController alloc] init];
    
    __weak typeof(self) weakSelf = self;
    [_viewModel.dataSourceObservable bindAndFire:^(NSArray * _Nonnull monsters) {
        [weakSelf.tableView reloadData];
    }];
    
    [_viewModel getMonsterWithCount:NUMBER_OF_MONSTER];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [_viewModel numberOfSection];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_viewModel numberOfMonstersAtSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_REUSEIDENTIFIER];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CELL_REUSEIDENTIFIER];
        cell.textLabel.font = [UIFont systemFontOfSize:19];
        cell.detailTextLabel.font = [UIFont systemFontOfSize:15];
    }
    
    id object = [_viewModel monsterAtIndexPath:indexPath];
    if (object != nil && [object isKindOfClass:[MonsterViewEntity class]]) {
        cell.textLabel.text = ((MonsterViewEntity *)object).name;
        cell.detailTextLabel.text = ((MonsterViewEntity *)object).desc;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(masterViewController:showDetail:)]) {
        MonsterViewEntity * monster = [_viewModel monsterAtIndexPath:indexPath];
        _detailMonsterViewController.monster = monster;
        [self.delegate masterViewController:self showDetail:_detailMonsterViewController];
    }
}

@end
