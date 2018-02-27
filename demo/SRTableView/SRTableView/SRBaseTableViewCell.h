//
//  SRBaseTableViewCell.h
//  SRTableView
//
//  Created by 索晓晓 on 2018/2/24.
//  Copyright © 2018年 SXiao.RR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SRBaseModel.h"


@interface SRBaseTableViewCell : UITableViewCell


@property (nonatomic ,strong)SRBaseModel *model;


- (void)setObject:(id)object;



@end
