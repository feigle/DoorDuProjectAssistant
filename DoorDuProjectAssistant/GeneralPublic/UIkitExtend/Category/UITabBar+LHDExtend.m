//
//  UITabBar+LHDExtend.m
//  DoorDuProjectAssistant
//
//  Created by 刘和东 on 2017/4/20.
//  Copyright © 2017年 深圳市多度科技有限公司. All rights reserved.
//

#import "UITabBar+LHDExtend.h"
#import <objc/runtime.h>

static char const keyLHDExtendTabBarItemNumbers;

@implementation UITabBar (LHDExtend)

/**UITabBar 中item的数量*/
- (void)setTabBarItemNumbers:(NSInteger)itemNumbers
{
    objc_setAssociatedObject(self, &keyLHDExtendTabBarItemNumbers, @(itemNumbers), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

/**
 显示小圆点
 @param color 圆点的颜色
 @param index 第几个控制器
 */
- (void)showBadgeDotColor:(UIColor *)color atItemIndex:(NSInteger)index
{
    [self hideBadgeAtItemIndex:index];
    UIView *badgeView = [[UIView alloc]init];
    badgeView.tag = 888 + index;
    badgeView.layer.cornerRadius = 4;//圆形
    badgeView.backgroundColor = color;//
    CGRect tabFrame = self.frame;
    NSNumber * itemNumbersObjc = objc_getAssociatedObject(self, &keyLHDExtendTabBarItemNumbers);
    NSInteger tabbarItemNums = 1;
    if (itemNumbersObjc) {
        tabbarItemNums = [itemNumbersObjc integerValue];
    }
    //确定小红点的位置
    float percentX = (index +0.6) / tabbarItemNums;
    CGFloat x = ceilf(percentX * tabFrame.size.width);
    CGFloat y = ceilf(0.1 * tabFrame.size.height);
    badgeView.frame = CGRectMake(x, y, 8, 8);//
    [self addSubview:badgeView];
}
/**显示红色的圆点*/
- (void)showRedBadgeAtItemIndex:(NSInteger)index
{
    [self showBadgeDotColor:[UIColor redColor] atItemIndex:index];
}
/**隐藏圆点*/
- (void)hideBadgeAtItemIndex:(NSInteger)index
{
    //按照tag值进行移除
    for (UIView *subView in self.subviews) {
        if (subView.tag == 888+index) {
            [subView removeFromSuperview];
        }
    }
}


@end
