//
//  TestDataConstructor.m
//  SRTableView
//
//  Created by 索晓晓 on 2018/2/26.
//  Copyright © 2018年 SXiao.RR. All rights reserved.
//

#import "TestDataConstructor.h"
#import "TestData.h"
#import "TestTableViewCell.h"

@implementation TestDataConstructor

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)loadData
{
    //去网络数据
    
}
- (void)constructData
{
    //组建数据
    NSArray *temp = @[@"哈哈",@"呵呵",@"嘿嘿",@"嘻嘻",@"喔噢"];
    
    for (int i = 0; i < temp.count; i++) {
        NSMutableArray *t1 = [NSMutableArray array];
        NSString *name = temp[i];
        {
            TestData *model = [[TestData alloc] init];
            model.sr_cell_class = [TestTableViewCell class];
            model.sr_delegate = self.delegateViewController;
            model.sr_identify = @"cn.com.donglaidongwang";
            model.sr_cell_height = 44;
            model.title = name;
            [t1 addObject:model];
        }
        {
            TestData *model = [[TestData alloc] init];
            model.sr_cell_class = [TestTableViewCell class];
            model.sr_delegate = self.delegateViewController;
            model.sr_identify = @"cn.com.donglaidongwang";
            model.sr_cell_height = 44;
            model.title = name;
            [t1 addObject:model];
        }
        {
            TestData *model = [[TestData alloc] init];
            model.sr_cell_class = [TestTableViewCell class];
            model.sr_delegate = self.delegateViewController;
            model.sr_identify = @"cn.com.donglaidongwang";
            model.sr_cell_height = 44;
            model.title = name;
            [t1 addObject:model];
        }
        {
            TestData *model = [[TestData alloc] init];
            model.sr_cell_class = [TestTableViewCell class];
            model.sr_delegate = self.delegateViewController;
            model.sr_identify = @"cn.com.donglaidongwang";
            model.sr_cell_height = 44;
            model.title = name;
            [t1 addObject:model];
        }
        [self.items addObject:t1];
    }
}
@end
