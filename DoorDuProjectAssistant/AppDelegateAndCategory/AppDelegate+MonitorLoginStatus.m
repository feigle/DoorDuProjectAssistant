//
//  AppDelegate+MonitorLoginStatus.m
//  DoorDuProjectAssistant
//
//  Created by 刘和东 on 2017/4/19.
//  Copyright © 2017年 深圳市多度科技有限公司. All rights reserved.
//

#import "AppDelegate+MonitorLoginStatus.h"

@implementation AppDelegate (MonitorLoginStatus)

- (void)monitorLoginStatusApplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //注册登录状态监听
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(loginStateChange:)
                                                 name:KNOTIFICATION_LOGINCHANGE
                                               object:nil];
    /**获取登录类型*/
    ProjectAssistantLoginIdentityType type = getLoginIdentityType();
    [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_LOGINCHANGE object:@(type)];
}
/**监听登录状态的改变*/
- (void)loginStateChange:(NSNotification *)notification
{
    ProjectAssistantLoginIdentityType identityType = [notification.object integerValue];
    switch (identityType) {
        case ProjectAssistantLoginIdentityNoLoginType:
        {/**没有登录*/
            [self initLoginRootVC];
        }
            break;
        case ProjectAssistantLoginIdentityAfterSaleType:
        {/**售后登录*/
            [self initAfterSaleRootVC];
        }
            break;
        case ProjectAssistantLoginIdentityProjectType:
        {/**工程登录*/
            [self initProjectRootVC];
        }
            break;
        case ProjectAssistantLoginIdentityAgentsType:
        {/**代理商登录*/
            [self initAfterSaleRootVC];
        }
            break;
            
        default:
            break;
    }
}

@end
