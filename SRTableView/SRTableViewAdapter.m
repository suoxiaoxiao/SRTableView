//
//  SRTableViewAdapter.m
//  SRTableView
//
//  Created by 索晓晓 on 2018/2/24.
//  Copyright © 2018年 SXiao.RR. All rights reserved.
//

#import "SRTableViewAdapter.h"

#import "SRBaseTableViewCell.h"

@implementation SRTableViewAdapter


- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)reloadTableViewAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:0];
}

- (UITableViewCell *)generateCellForObject:(id <SRBaseModelProcotol> )object indexPath:(NSIndexPath *)indexPath Identifier:(NSString *)identifier
{
    UITableViewCell * cell = nil;
    
    if (object) {
        
        Class cellC = [UITableViewCell class];
        
        if ([object respondsToSelector:@selector(sr_cell_class)]) {
            cellC = [object sr_cell_class];
        }
        
        cell = [[cellC alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
    }
    
    
    return cell;
}


#pragma mark - UI TableView DataSource
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return self.items.count;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.items countOfSection:section];
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id<SRBaseModelProcotol> object = [self.items objectAtIndexPath:indexPath];

    NSString * identifier  = [object sr_identify];
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];


    if (cell == nil) {
        //初始化cell
        cell = [self generateCellForObject:object indexPath:indexPath Identifier:identifier];
    }

    //更新数据
    if ([cell isKindOfClass:[SRBaseTableViewCell class]]) {
        [(SRBaseTableViewCell *)cell setObject:object];
    }

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height      = 0;
    id<SRBaseModelProcotol> object = [self.items objectAtIndexPath:indexPath];
    
    if (object) {
        if ([object respondsToSelector:@selector(sr_cell_height)]) {
            height = [object sr_cell_height];
        }
    }
    
    return height;
}

- (BOOL) tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {

    id<SRBaseModelProcotol> object = [self.items objectAtIndexPath:indexPath];
    
    if (_delegate && [_delegate respondsToSelector:@selector(tableView:canEditObject:forRowAtIndexPath:)]) {
        return [_delegate tableView:tableView canEditObject:object forRowAtIndexPath:indexPath];
    }

    return NO;
}

- (BOOL) tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {

    id<SRBaseModelProcotol> object = [self.items objectAtIndexPath:indexPath];
    if (_delegate && [_delegate respondsToSelector:@selector(tableView:canMoveObject:forRowAtIndexPath:)]) {
        return [_delegate tableView:tableView canMoveObject:object forRowAtIndexPath:indexPath];
    }

    return NO;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {

    id<SRBaseModelProcotol> object = [self.items objectAtIndexPath:indexPath];

    if (editingStyle == UITableViewCellEditingStyleDelete) {
        if (_delegate && [_delegate respondsToSelector:@selector(tableView:commitDeletingObject:forRowAtIndexPath:)]) {
            [_delegate tableView:tableView commitDeletingObject:object forRowAtIndexPath:indexPath];
        }
    }
}

//- (BOOL) tableView:(UITableView *)tableView enableGroupModeAtSection:(NSInteger)section {
//
//    if (_delegate && [_delegate respondsToSelector:@selector(tableView:enableGroupModeAtSection:)]) {
//        return [_delegate tableView:tableView enableGroupModeAtSection:section];
//    }
//
//    return NO;
//}
//
//
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (_delegate && [_delegate respondsToSelector:@selector(tableView:srHeightForHeaderInSection:)]) {
        return [_delegate tableView:tableView srHeightForHeaderInSection:section];
    }
    return 0;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (_delegate && [_delegate respondsToSelector:@selector(tableView:srViewForHeaderInSection:)]) {
        return [_delegate tableView:tableView srViewForHeaderInSection:section];
    }
    return nil;
}


//#pragma mark - UI TableView Delegate
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    id<SRBaseModelProcotol> object = [self.items objectAtIndexPath:indexPath];
    
    if (_delegate && [_delegate respondsToSelector:@selector(tableView:didSelectObject:rowAtIndexPath:)]) {
        [_delegate tableView:tableView didSelectObject:object rowAtIndexPath:indexPath];
    }
}

//#pragma mark - UI ScrollView Delegate
//- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
//
//    if ([self respondsToSelector:@selector(tableViewWillBeginDragging:)]) {
//        [self performSelector:@selector(tableViewWillBeginDragging:) withObject:scrollView];
//    }
//
//    if (_delegate && [_delegate respondsToSelector:@selector(tableViewWillBeginDragging:)]) {
//        [_delegate tableViewWillBeginDragging:(UITableView*)scrollView];
//    }
//}
//
//- (void) scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
//
//    if ([self respondsToSelector:@selector(tableViewDidEndDragging:)]) {
//        [self performSelector:@selector(tableViewDidEndDragging:) withObject:scrollView];
//    }
//
//    if (_delegate && [_delegate respondsToSelector:@selector(tableViewDidEndDragging:)]) {
//        [_delegate tableViewDidEndDragging:(UITableView*)scrollView];
//    }
//}
//
//- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
//    if (_delegate && [_delegate respondsToSelector:@selector(tableViewScrollViewWillEndDragging:withVelocity:targetContentOffset:)]) {
//        [_delegate tableViewScrollViewWillEndDragging:scrollView withVelocity:velocity targetContentOffset:targetContentOffset];
//    }
//}
//
//- (void)scrollViewDidScroll:(UIScrollView*)scrollView {
//
//    if ([self respondsToSelector:@selector(tableViewDidScroll:)]) {
//        [self performSelector:@selector(tableViewDidScroll:) withObject:scrollView];
//    }
//
//    if (_delegate && [_delegate respondsToSelector:@selector(tableViewDidScroll:)]) {
//        [_delegate tableViewDidScroll:(UITableView*)scrollView];
//    }
//
//    CGRect frame = scrollView.frame;
//    CGPoint offset = scrollView.contentOffset;
//    CGSize size = scrollView.contentSize;
//
//    if (size.height <= offset.y + frame.size.height - 30.0f) {
//        if (_delegate && [_delegate respondsToSelector:@selector(tableViewScrollBottom:)]) {
//            [_delegate tableViewScrollBottom:(UITableView*)scrollView];
//        }
//    }
//}


@end
