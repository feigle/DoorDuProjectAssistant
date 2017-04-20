//
//  UITabBar+LHDExtend.h
//  DoorDuProjectAssistant
//
//  Created by 刘和东 on 2017/4/20.
//  Copyright © 2017年 深圳市多度科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (LHDExtend)

/**UITabBar 中item的数量*/
- (void)setTabBarItemNumbers:(NSInteger)itemNumbers;

/**
 显示小圆点
 @param color 圆点的颜色
 @param index 第几个控制器
 */
- (void)showBadgeDotColor:(UIColor *)color atItemIndex:(NSInteger)index;
/**显示红色的圆点*/
- (void)showRedBadgeAtItemIndex:(NSInteger)index;
/**隐藏圆点*/
- (void)hideBadgeAtItemIndex:(NSInteger)index;

@end
