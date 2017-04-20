//
//  DDTableViewController.h
//  DoorDuProjectAssistant
//
//  Created by 刘和东 on 2017/4/17.
//  Copyright © 2017年 深圳市多度科技有限公司. All rights reserved.
//

#import "HttpRequestViewController.h"

@interface DDTableViewController : HttpRequestViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,assign) UITableViewStyle tableViewStyle;

@end
