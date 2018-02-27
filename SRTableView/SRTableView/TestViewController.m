//
//  TestViewController.m
//  SRTableView
//
//  Created by 索晓晓 on 2018/2/26.
//  Copyright © 2018年 SXiao.RR. All rights reserved.
//

#import "TestViewController.h"
#import "TestDataConstructor.h"
#import "TestData.h"

@interface TestViewController ()

@property (nonatomic ,strong)TestDataConstructor *dataCon;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}
- (void)dealloc
{
    NSLog(@"dealloc");
}
- (void)constructorData
{
    if (_dataCon == nil) {
        _dataCon = [[TestDataConstructor alloc] init];
        __weak typeof(self)weakSelf = self;
        _dataCon.updateDatacomplateBlock = ^(NSIndexPath *indexPath) {
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [weakSelf.adapter reloadTableViewAtIndexPath:indexPath];
                
            });
        };
    }
    [self.dataCon loadData];
    [self.dataCon constructData];
    self.adapter.items = self.dataCon.items;
    [self.tableView reloadData];
}

- (void) tableView:(UITableView *)tableView didSelectObject:(id<SRBaseModelProcotol>)object rowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点击了%@ %@",object,indexPath);
    TestData *ne = (TestData *)object;
    ne.title = @"woshixinde";
    [self.dataCon updateObject:ne atIndexPath:indexPath complate:nil];
    
}
- (CGFloat)tableView:(UITableView *)tableView srHeightForHeaderInSection:(NSInteger)section
{
    return 20;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
