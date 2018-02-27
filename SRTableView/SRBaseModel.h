//
//  SRBaseModel.h
//  SRTableView
//
//  Created by 索晓晓 on 2018/2/24.
//  Copyright © 2018年 SXiao.RR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SRBaseModelProtocol.h"

@interface SRBaseModel : NSObject <SRBaseModelProcotol>

@end



@interface SRListModel : SRBaseModel

@property (nonatomic ,strong)NSMutableArray *sr_models;

@end




