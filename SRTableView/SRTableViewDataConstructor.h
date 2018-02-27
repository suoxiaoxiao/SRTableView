//
//  SRTableViewDataConstructor.h
//  SRTableView
//
//  Created by 索晓晓 on 2018/2/26.
//  Copyright © 2018年 SXiao.RR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SRIndexPathArray.h"
#import "SRBaseModelProtocol.h"

//修改完数据之后的回调block
typedef void(^DataConstructorComplateBlock)(NSIndexPath *indexPath);
/*
 这里所有的对数据的操作仅仅是针对是数据， 不做任何UI操作
 */
@interface SRTableViewDataConstructor : NSObject

@property (nonatomic, strong) SRIndexPathArray * items;

@property (nonatomic ,copy)DataConstructorComplateBlock updateDatacomplateBlock;
- (void)constructData;
- (void)loadData;

/*
    下面这4个方法都是修改数据源的，仅对数据源进行修改，不改变UI 可在Block中刷新UI
    也可以设置updateDatacomplateBlock ,在这里就可以传nil，
    如果设置updateDatacomplateBlock，则这里的block也依然有效
    提示： 可设置updateDatacomplateBlock，之后不在回调Block中做刷新UI操作。
 */

- (void)addObject:(id<SRBaseModelProcotol>)object atSection:(NSUInteger)section complate:(DataConstructorComplateBlock)complate;

- (void)insertObject:(id<SRBaseModelProcotol>)object atIndexPath:(NSIndexPath *)indexPath complate:(DataConstructorComplateBlock)complate;

- (void)updateObject:(id<SRBaseModelProcotol>)object atIndexPath:(NSIndexPath *)indexPath complate:(DataConstructorComplateBlock)complate;

- (void)removeItemAtIndexPath:(NSIndexPath *)indexpath complate:(DataConstructorComplateBlock)complate;

@end
