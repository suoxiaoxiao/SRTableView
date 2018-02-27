//
//  SRTableViewDataConstructor.m
//  SRTableView
//
//  Created by 索晓晓 on 2018/2/26.
//  Copyright © 2018年 SXiao.RR. All rights reserved.
//

#import "SRTableViewDataConstructor.h"

@implementation SRTableViewDataConstructor

- (SRIndexPathArray *)items
{
    if (!_items) {
        _items = [[SRIndexPathArray alloc] init];
    }
    return _items;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)addObject:(id<SRBaseModelProcotol>)object atSection:(NSUInteger)section complate:(DataConstructorComplateBlock)complate
{
    if (object == nil) {
        return ;
    }
    NSInteger row = [self.items countOfSection:section];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
    
    [self.items insertObject:object atSection:section atIndex:row];
    
    if (self.updateDatacomplateBlock) {
        self.updateDatacomplateBlock(indexPath);
    }
    
    if (complate) {
        complate(indexPath);
    }
}

- (void)insertObject:(id<SRBaseModelProcotol>)object atIndexPath:(NSIndexPath *)indexPath complate:(DataConstructorComplateBlock)complate
{
    if (object == nil) {
        return ;
    }
    
    [self.items insertObject:object atSection:indexPath.section atIndex:indexPath.row];
    
    if (self.updateDatacomplateBlock) {
        self.updateDatacomplateBlock(indexPath);
    }
    
    if (complate) {
        complate(indexPath);
    }
}

- (void)updateObject:(id<SRBaseModelProcotol>)object atIndexPath:(NSIndexPath *)indexPath complate:(DataConstructorComplateBlock)complate
{
    if (object == nil) {
        return ;
    }
    
    [self.items replaceObjectAtSection:indexPath.section AtIndex:indexPath.row withObject:object];
    
    if (self.updateDatacomplateBlock) {
        self.updateDatacomplateBlock(indexPath);
    }
    
    if (complate) {
        complate(indexPath);
    }
}

- (void)removeItemAtIndexPath:(NSIndexPath *)indexPath complate:(DataConstructorComplateBlock)complate
{
    
    [self.items removeObjectAtSection:indexPath.section AtIndex:indexPath.row];
    
    if (self.updateDatacomplateBlock) {
        self.updateDatacomplateBlock(indexPath);
    }
    
    if (complate) {
        complate(indexPath);
    }
}

- (void)loadData{}
- (void)constructData{}

@end
