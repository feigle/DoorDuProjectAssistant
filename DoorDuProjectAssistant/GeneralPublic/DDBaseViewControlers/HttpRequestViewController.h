//
//  HttpRequestViewController.h
//  DoorDuProjectAssistant
//
//  Created by 刘和东 on 2017/4/17.
//  Copyright © 2017年 深圳市多度科技有限公司. All rights reserved.
//

#import "HandleNavigationBarViewController.h"
#import "MJRefresh.h"

@interface HttpRequestViewController : HandleNavigationBarViewController

@property (nonatomic,strong) NSMutableArray *dataArray;
/**头部刷新控件*/
@property (nonatomic,strong) UIRefreshControl * headerRefreshControl;
/**尾部刷新控件*/
@property (nonatomic,strong) MJRefreshAutoNormalFooter * footerRefreshControl;

/**
 *  添加headerRefresh
 */
- (void)addHeaderRefresh;
/**
 开启上拉刷新
 */
-(void)beginHeaderRefresh;
/**
 *  结束headerRefresh刷新
 */
- (void)endHeaderRefresh;
/**
 *  移除headerRefresh
 */
- (void)removeHeaderRefresh;
/**
 *  子类下拉刷新-请求数据写在这里，子类复用
 */
- (void)headerRefreshData;



/**
 *  添加FootRefresh
 */
- (void)addFootRefresh;
/**
 开启下拉刷新
 */
-(void)beginFootRefresh;
/**
 *  结束FootRefresh刷新
 */
- (void)endFootRefresh;
/**
 移除下拉刷新
 */
- (void)removeFootRefresh;
/**
 *  子类下拉刷新-请求数据写在这里，子类复用
 */
- (void)footRefreshData;



/**
 * 提示没有更多的数据
 */
- (void)endFootRefreshNoMoreData;
/*
 * 重置没有更多的数据（消除没有更多数据的状态）
 */
- (void)resetFootRefreshNoMoreData;

/**
 停止刷新
 */
- (void)endRefresh;


@end
