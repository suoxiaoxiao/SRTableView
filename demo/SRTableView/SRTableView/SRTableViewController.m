//
//  SRTableViewController.m
//  SRTableView
//
//  Created by 索晓晓 on 2018/2/24.
//  Copyright © 2018年 SXiao.RR. All rights reserved.
//

#import "SRTableViewController.h"


@interface SRTableViewController ()<SRTableViewAdapterDelegate>

@end

@implementation SRTableViewController

- (void) dealloc {
    _adapter.delegate = nil;
    self.tableView.delegate = nil;
    self.tableView.dataSource = nil;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self sr_create_table_adaptor];
    [self sr_init_ui];
    [self constructorData];
}
#pragma mark - 初始化Navi
- (void)sr_init_navi
{
    
}
#pragma mark - 初始化UI
- (void)sr_init_ui
{
    CGRect frame = self.view.bounds;
    _tableView = [[SRTableView alloc] initWithFrame:frame style:self.tableViewStyle];
    [_tableView setBackgroundColor:[UIColor clearColor]];
    [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    _tableView.showsHorizontalScrollIndicator = NO;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.dataSource = _adapter;
    _tableView.delegate = _adapter;
    _tableView.sectionIndexBackgroundColor = [UIColor clearColor];
    _tableView.sectionIndexTrackingBackgroundColor = [UIColor clearColor];
    _adapter.tableView = _tableView;
    [self.view addSubview:_tableView];
}
#pragma mark - 初始化Data
- (void)sr_create_table_adaptor {
    
    _adapter = [[SRTableViewAdapter alloc] init];
    _adapter.delegate = self;
}
- (void)constructorData
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
