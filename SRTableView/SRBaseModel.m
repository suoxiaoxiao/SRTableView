//
//  SRBaseModel.m
//  SRTableView
//
//  Created by 索晓晓 on 2018/2/24.
//  Copyright © 2018年 SXiao.RR. All rights reserved.
//

#import "SRBaseModel.h"

@implementation SRBaseModel

@synthesize sr_cell_height = _sr_cell_height;
@synthesize sr_identify = _sr_identify;
@synthesize sr_cell_class = _sr_cell_class;
@synthesize sr_delegate = _sr_delegate;

@end


@implementation SRListModel

- (NSMutableArray *)sr_models
{
    if (! _sr_models) {
        _sr_models = [NSMutableArray array];
    }
    return _sr_models;
}

@end
