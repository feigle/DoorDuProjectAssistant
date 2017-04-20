//
//  AppDelegate.h
//  DoorDuProjectAssistant
//
//  Created by 刘和东 on 2017/4/17.
//  Copyright © 2017年 深圳市多度科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PALoginViewController.h"
#import "PAAfterSaleMainTabBarController.h"

/**目前定了  4个  工程，售后，代理商，  其他*/
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/**登录控制器*/
@property (nonatomic,strong) PALoginViewController * loginViewController;

/**没有登录的*/
- (void)initLoginRootVC;
/**售后登录*/
- (void)initAfterSaleRootVC;
/**工程登录*/
- (void)initProjectRootVC;
/**代理商登录*/
- (void)initAgentsRootVC;


@end

