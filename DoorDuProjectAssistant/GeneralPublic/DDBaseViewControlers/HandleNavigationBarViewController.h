//
//  HandleNavigationBarViewController.h
//  DoorDuProjectAssistant
//
//  Created by 刘和东 on 2017/4/17.
//  Copyright © 2017年 深圳市多度科技有限公司. All rights reserved.
//

#import "DDBaseViewController.h"

@interface HandleNavigationBarViewController : DDBaseViewController

#pragma mark - 设置文字
// 设置导航栏右侧按钮title
- (void)setRightItemWithTitle:(NSString*)title;
- (void)setRightItemsWithTitles:(NSArray *)titles;

#pragma mark - 设置图片
// 设置导航栏左侧按钮图标
- (void)setLeftItemImageName:(NSString*)imageName;
// 设置导航栏右侧按钮图标
- (void)setRightItemImageName:(NSString*)imageName;
//设置导航栏右侧多个按钮
- (void)setRightItemsImageNames:(NSArray *)imageNames;

//NaviBarItem点击事件
- (void)navLeftItemClick:(NSInteger)index;
- (void)navRightItemClick:(NSInteger)index;

- (void)pushVC:(UIViewController *)vc;

- (void)pushVC:(UIViewController *)vc animated:(BOOL)animated;


@end
