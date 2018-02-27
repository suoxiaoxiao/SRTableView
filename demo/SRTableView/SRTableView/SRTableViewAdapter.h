//
//  SRTableViewAdapter.h
//  SRTableView
//
//  Created by 索晓晓 on 2018/2/24.
//  Copyright © 2018年 SXiao.RR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SRTableView.h"
#import "SRBaseModel.h"
#import "SRIndexPathArray.h"
#import "SRBaseModelProtocol.h"

@protocol SRTableViewAdapterDelegate;

@interface SRTableViewAdapter : NSObject
<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic , weak)SRTableView *tableView;

@property (nonatomic , weak)id<SRTableViewAdapterDelegate> delegate;

@property (nonatomic ,strong)SRIndexPathArray * items;//数据模型

- (void)reloadTableViewAtIndexPath:(NSIndexPath *)indexPath;

@end


@protocol SRTableViewAdapterDelegate <NSObject>

@optional
- (BOOL) tableView:(UITableView *)tableView canEditObject:(id<SRBaseModelProcotol>)object forRowAtIndexPath:(NSIndexPath *)indexPath;
- (BOOL) tableView:(UITableView *)tableView canMoveObject:(id<SRBaseModelProcotol>)object forRowAtIndexPath:(NSIndexPath *)indexPath;
- (void) tableView:(UITableView *)tableView commitDeletingObject:(id<SRBaseModelProcotol>)object forRowAtIndexPath:(NSIndexPath *)indexPath;
- (CGFloat)tableView:(UITableView *)tableView srHeightForHeaderInSection:(NSInteger)section;
- (UIView *)tableView:(UITableView *)tableView srViewForHeaderInSection:(NSInteger)section;
- (void) tableView:(UITableView *)tableView didSelectObject:(id<SRBaseModelProcotol>)object rowAtIndexPath:(NSIndexPath *)indexPath;


@end
