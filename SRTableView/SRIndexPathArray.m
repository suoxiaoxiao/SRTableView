//
//  SRIndexPathArray.m
//  SRTableView
//
//  Created by 索晓晓 on 2018/2/24.
//  Copyright © 2018年 SXiao.RR. All rights reserved.
//

#import "SRIndexPathArray.h"


@interface SRIndexPathArray ()

@property (nonatomic ,strong)NSMutableArray *indexArray;

@end

@implementation SRIndexPathArray

- (NSMutableArray *)indexArray
{
    if (! _indexArray) {
        _indexArray = [NSMutableArray array];
    }
    return _indexArray;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (NSInteger)count
{
    return self.indexArray.count;
}

- (void)removeAllObjects
{
    [self.indexArray removeAllObjects];
}

- (void)addObject:(_Nonnull id)object
{
    if (object == nil) {
        return ;
    }
    
    if ([object isKindOfClass:[NSArray class]]) {
        
        object = [NSMutableArray arrayWithArray:object];
        
        [self.indexArray addObject:object];
        
        return ;
        
    }
    
    if (self.indexArray && self.indexArray.count >0) {
        NSMutableArray *t = [self.indexArray lastObject];
        [t addObject:object];
        return ;
    }
    
    NSMutableArray *t = [NSMutableArray array];
    [t addObject:object];
    [self.indexArray addObject:t];
    
}
- (void)removeObjectAtIndex:(NSUInteger)index
{
    if (self.indexArray.count > 0) {
        
        NSMutableArray *t = [self.indexArray lastObject];
        
        if (t.count > index) {
            
            [t removeObjectAtIndex:index];
            
        }else{
            NSAssert(NO, @"SRIndexPathArray 的 removeObjectAtIndex方法传入的index值超出范围");
        }
        
    }
    
}
- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(_Nonnull id)anObject
{
    if (self.indexArray.count > 0) {
        
        NSMutableArray *t = [self.indexArray lastObject];
        
        if (t.count > index) {
            
            [t replaceObjectAtIndex:index withObject:anObject];
            
        }else{
            NSAssert(NO, @"SRIndexPathArray 的 replaceObjectAtIndex:withObject 方法传入的index值超出范围");
        }
        
    }
}
- (void)insertObject:(_Nonnull id)anObject atIndex:(NSUInteger)index
{
    if (self.indexArray.count > 0) {
        
        NSMutableArray *t = [self.indexArray lastObject];
        
        if (t.count >= index) {
            
            [t insertObject:anObject atIndex:index];
            
        }else{
            NSAssert(NO, @"SRIndexPathArray 的 insertObject:atIndex 方法传入的index值超出范围");
        }
        
    }
}

- (_Nonnull id)objectAtIndex:(NSInteger)index
{
    if (self.indexArray.count > 0) {
        
        NSMutableArray *t = [self.indexArray lastObject];
        
        if (t.count > index) {
            
            return [t objectAtIndex:index];
            
        }else{
            NSAssert(NO, @"SRIndexPathArray 的 objectAtIndex 方法传入的index值超出范围");
        }
        
    }
    return @"";
}

- (_Nonnull id)objectAtIndexPath:( NSIndexPath* _Nonnull )indexPath
{
    
    //两种可能， 看是否是分组数据
    if ( self.indexArray.count >= 2) {//Group
        
        NSInteger section = indexPath.section;
        NSInteger row = indexPath.row;
        
        if (self.indexArray.count > section) {
            
            NSMutableArray *secArray = self.indexArray[section];
            
            if (secArray.count > row) {
                
                return secArray[row];
                
            }
            
        }
        
        NSAssert(NO, @"SRIndexPathArray 的 objectAtIndexPath: 方法传入的indexPath值超出范围");
        
        
    }else if(self.indexArray.count == 1){//Plain
        
        NSInteger section = indexPath.section;
        NSInteger row = indexPath.row;
        
        if (self.indexArray.count > section) {
            
            NSMutableArray *secArray = self.indexArray[section];
            
            if (secArray.count > row) {
                
                return secArray[row];
                
            }
            
        }
        
        NSAssert(NO, @"SRIndexPathArray 的 objectAtIndexPath: 方法传入的indexPath值超出范围");
        
    }
    
    return @"";
}

@end

@implementation SRIndexPathArray (Plain)

@end

@implementation SRIndexPathArray (Group)

- (NSInteger)countOfSection:(NSInteger)section
{
//    if (self.indexArray.count > section) {
    
        NSMutableArray *t = self.indexArray;
        
        if (t.count > section) {
            
            if ([t[section] isKindOfClass:[NSArray class]]) {
                return [t[section] count];
            }
            
        }else{
            
            NSAssert(NO, @"SRIndexPathArray(Group) 的 countOfSection 方法传入的section值超出范围");
        }
        
//    }
    return 0;
}

- (void)insertObject:(_Nonnull id)anObject atSection:(NSUInteger)section atIndex:(NSUInteger)index
{
    
//    if (self.indexArray.count > 0) {
    
    NSMutableArray *t = self.indexArray;
        
        if (t.count > section) {
            
            NSMutableArray *goal = t[section];
            
            if ([goal isKindOfClass:[NSArray class]]) {
                
                if (goal.count >= index) {
                    
                    [goal insertObject:anObject atIndex:index];
                    
                }else{
                    
                    NSAssert(NO, @"SRIndexPathArray(Group) 的 insertObject:atSection:atIndex 方法传入的index值超出范围");
                }
                
                
            }else{
                
                NSAssert(NO, @"SRIndexPathArray(Group) 的 insertObject:atSection:atIndex 方法中section 对应的数据不是数组");
                
            }
            
        }else{
            
            NSAssert(NO, @"SRIndexPathArray(Group) 的 insertObject:atSection:atIndex 方法传入的section值超出范围");
        }
        
//    }
    
}



- (void)replaceObjectAtSection:(NSUInteger)section AtIndex:(NSUInteger)index  withObject:(_Nonnull id)anObject
{
//    if (self.indexArray.count > 0) {
    
    NSMutableArray *t = self.indexArray;
        
        if (t.count > section) {
            
            NSMutableArray *goal = t[section];
            
            if ([goal isKindOfClass:[NSArray class]]) {
                
                if (goal.count >= index) {
                    
                    [goal replaceObjectAtIndex:index withObject:anObject];
                    
                }else{
                    
                    NSAssert(NO, @"SRIndexPathArray(Group) 的 replaceObjectAtSection:AtIndex:withObject 方法传入的index值超出范围");
                }
                
                
            }else{
                
                NSAssert(NO, @"SRIndexPathArray(Group) 的 replaceObjectAtSection:AtIndex:withObject 方法中section 对应的数据不是数组");
                
            }
            
        }else{
            
            NSAssert(NO, @"SRIndexPathArray(Group) 的 replaceObjectAtSection:AtIndex:withObject 方法传入的section值超出范围");
        }
        
//    }
}
- (void)removeObjectAtSection:(NSUInteger)section AtIndex:(NSUInteger)index
{
//    if (self.indexArray.count > 0) {
    
        NSMutableArray *t = self.indexArray;
        
        if (t.count > section) {
            
            NSMutableArray *goal = t[section];
            
            if ([goal isKindOfClass:[NSArray class]]) {
                
                if (goal.count >= index) {
                    
                    [goal removeObjectAtIndex:index];
                    
                }else{
                    
                    NSAssert(NO, @"SRIndexPathArray(Group) 的 removeObjectAtSection:AtIndex 方法传入的index值超出范围");
                }
                
                
            }else{
                
                NSAssert(NO, @"SRIndexPathArray(Group) 的 removeObjectAtSection:AtIndex 方法中section 对应的数据不是数组");
                
            }
            
        }else{
            
            NSAssert(NO, @"SRIndexPathArray(Group) 的 removeObjectAtSection:AtIndex 方法传入的section值超出范围");
        }
        
//    }
}


@end

