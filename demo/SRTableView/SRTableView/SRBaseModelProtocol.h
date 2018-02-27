//
//  SRBaseModelProtocol.h
//  SRTableView
//
//  Created by 索晓晓 on 2018/2/24.
//  Copyright © 2018年 SXiao.RR. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SRBaseModelProcotol <NSObject>

//使用前缀+下划线分开命名， 防止冲突

@property (nonatomic, strong) Class sr_cell_class;  //cell的类名
@property (nonatomic, copy) NSString* sr_identify; //cell的唯一ID
@property (nonatomic, assign) float sr_cell_height; //cell的高度

//这里使用delegate用来cell回传事件，在cell的setObject中使用
@property (nonatomic, weak) id sr_delegate;


@end


