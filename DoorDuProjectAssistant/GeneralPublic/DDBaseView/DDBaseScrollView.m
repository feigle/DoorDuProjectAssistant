//
//  DDBaseScrollView.m
//  DoorDuProjectAssistant
//
//  Created by 刘和东 on 2017/4/26.
//  Copyright © 2017年 深圳市多度科技有限公司. All rights reserved.
//

#import "DDBaseScrollView.h"

@implementation DDBaseScrollView

- (void)returnObjectCallBlock:(__autoreleasing CallBackReturnObjectDataBlock)block
{
    self.retrunObjectBlock = block;
}

- (void)returnRefreshCallBlock:(__autoreleasing CallBackRefreshDataBlock)block
{
    self.retrunRefreshBlock = block;
}

- (void)pushVC:(UIViewController *)vc
{
    [self pushVC:vc animated:YES];
}

- (void)pushVC:(UIViewController *)vc animated:(BOOL)animated
{
    [self.superViewController.navigationController pushViewController:vc animated:animated];
}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    NSLog(@"dealloc:%@",NSStringFromClass([self class]));
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
