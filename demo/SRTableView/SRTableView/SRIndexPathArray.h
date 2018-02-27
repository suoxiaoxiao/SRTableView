//
//  SRIndexPathArray.h
//  SRTableView
//
//  Created by 索晓晓 on 2018/2/24.
//  Copyright © 2018年 SXiao.RR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SRIndexPathArray : NSObject


- (NSInteger)count;

- (void)addObject:(_Nonnull id)object;

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(_Nonnull id)anObject;

- (void)insertObject:(_Nonnull id)anObject atIndex:(NSUInteger)index;

- (void)removeObjectAtIndex:(NSUInteger)index;

- (void)removeAllObjects;

- (_Nonnull id)objectAtIndex:(NSInteger)index;

- (_Nonnull id)objectAtIndexPath:( NSIndexPath* _Nonnull )indexPath;

@end

@interface SRIndexPathArray (Plain)


@end

@interface SRIndexPathArray (Group)


- (NSInteger)countOfSection:(NSInteger)section;

- (void)insertObject:(_Nonnull id)anObject atSection:(NSUInteger)section atIndex:(NSUInteger)index;

- (void)replaceObjectAtSection:(NSUInteger)section AtIndex:(NSUInteger)index  withObject:(_Nonnull id)anObject;

- (void)removeObjectAtSection:(NSUInteger)section AtIndex:(NSUInteger)index;

@end
