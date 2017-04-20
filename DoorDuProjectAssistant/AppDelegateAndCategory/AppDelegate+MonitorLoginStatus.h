//
//  AppDelegate+MonitorLoginStatus.h
//  DoorDuProjectAssistant
//
//  Created by 刘和东 on 2017/4/19.
//  Copyright © 2017年 深圳市多度科技有限公司. All rights reserved.
//

#import "AppDelegate.h"

/**监听登录状态*/
@interface AppDelegate (MonitorLoginStatus)

/**监听登录状态*/
- (void)monitorLoginStatusApplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;


@end
