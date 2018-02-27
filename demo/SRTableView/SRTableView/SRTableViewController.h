//
//  SRTableViewController.h
//  SRTableView
//
//  Created by 索晓晓 on 2018/2/24.
//  Copyright © 2018年 SXiao.RR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SRTableViewAdapter.h"
#import "SRTableView.h"
#import "SRTableViewDataConstructor.h"


@interface SRTableViewController : UIViewController

@property (nonatomic ,strong)SRTableView *tableView;
@property (nonatomic ,strong)SRTableViewAdapter *adapter;

@property (nonatomic , assign)UITableViewStyle tableViewStyle;


- (void)constructorData;

@end
