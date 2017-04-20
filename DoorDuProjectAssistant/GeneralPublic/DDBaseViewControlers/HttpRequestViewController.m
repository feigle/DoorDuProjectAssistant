//
//  HttpRequestViewController.m
//  DoorDuProjectAssistant
//
//  Created by 刘和东 on 2017/4/17.
//  Copyright © 2017年 深圳市多度科技有限公司. All rights reserved.
//

#import "HttpRequestViewController.h"

@interface HttpRequestViewController ()

@property (nonatomic, assign) BOOL isNeedHeaderRefresh;
@property (nonatomic, assign) BOOL isNeedFootRefresh;

@end

@implementation HttpRequestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/**存储数据源*/
- (NSMutableArray*)dataArray
{
    if (!_dataArray) {
        _dataArray=[NSMutableArray new];
    }
    return _dataArray;
}
/**头部刷新控件*/
- (UIRefreshControl *)headerRefreshControl
{
    if (!_headerRefreshControl) {
        _headerRefreshControl = [[UIRefreshControl alloc] init];
        [_headerRefreshControl addTarget:self action:@selector(headerRefreshData) forControlEvents:UIControlEventValueChanged];
    }
    return _headerRefreshControl;
}


/**
 *  添加headerRefresh
 */
- (void)addHeaderRefresh
{
    self.isNeedHeaderRefresh = YES;
}
/**
 开启上拉刷新
 */
-(void)beginHeaderRefresh
{
    if (!self.headerRefreshControl.isRefreshing) {
        [self.headerRefreshControl beginRefreshing];
    }
}
/**
 *  结束headerRefresh刷新
 */
- (void)endHeaderRefresh
{
    if (self.headerRefreshControl.isRefreshing) {
        [self.headerRefreshControl endRefreshing];
    }
}
/**
 *  移除headerRefresh
 */
- (void)removeHeaderRefresh
{
    [self endHeaderRefresh];
    [self.headerRefreshControl removeFromSuperview];
    self.isNeedHeaderRefresh = NO;
    _headerRefreshControl = nil;
}
/**
 *  子类下拉刷新-请求数据写在这里，子类复用
 */
- (void)headerRefreshData
{
    [self beginHeaderRefresh];
    self.page = 1;self.pagesize = 10;self.dataTotal = 999;
    self.isFinish = NO;
}

- (MJRefreshAutoNormalFooter *)footerRefreshControl
{
    if (!_footerRefreshControl) {
        _footerRefreshControl = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footRefreshData)];
    }
    return _footerRefreshControl;
}

/**
 *  添加FootRefresh
 */
- (void)addFootRefresh
{
    self.isNeedFootRefresh = YES;
}
/**
 开启下拉刷新
 */
-(void)beginFootRefresh
{
    if (!self.footerRefreshControl.isRefreshing) {
        [self.footerRefreshControl beginRefreshing];
    }
}
/**
 *  结束FootRefresh刷新
 */
- (void)endFootRefresh
{
    if (self.footerRefreshControl.isRefreshing) {
        [self.footerRefreshControl endRefreshing];
    }
}
/**
 移除下拉刷新
 */
- (void)removeFootRefresh
{
    [self endFootRefresh];
    [self.footerRefreshControl removeFromSuperview];
    self.isNeedFootRefresh = NO;
    _footerRefreshControl = nil;
}
/**
 *  子类下拉刷新-请求数据写在这里，子类复用
 */
- (void)footRefreshData
{
    self.page++;
}

/**
 * 提示没有更多的数据
 */
- (void)endFootRefreshNoMoreData
{
    [self.footerRefreshControl endRefreshingWithNoMoreData];
}
/*
 * 重置没有更多的数据（消除没有更多数据的状态）
 */
- (void)resetFootRefreshNoMoreData
{
    [self.footerRefreshControl resetNoMoreData];
}


/**
 停止刷新
 */
- (void)endRefresh
{
    if (self.isNeedHeaderRefresh) {
        [self endHeaderRefresh];
    }
    if (self.isNeedFootRefresh) {
        [self endFootRefresh];
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
