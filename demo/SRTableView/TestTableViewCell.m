//
//  TestTableViewCell.m
//  SRTableView
//
//  Created by 索晓晓 on 2018/2/26.
//  Copyright © 2018年 SXiao.RR. All rights reserved.
//

#import "TestTableViewCell.h"
#import "TestData.h"

@implementation TestTableViewCell

- (void)setObject:(id)object
{
    
    self.model = object;
    TestData *test = (TestData *)self.model;
    
    self.textLabel.text = test.title;
    
}

@end
