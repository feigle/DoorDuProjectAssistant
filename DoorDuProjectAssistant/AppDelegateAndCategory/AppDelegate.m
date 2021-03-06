//
//  AppDelegate.m
//  DoorDuProjectAssistant
//
//  Created by 刘和东 on 2017/4/17.
//  Copyright © 2017年 深圳市多度科技有限公司. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+MonitorLoginStatus.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    [self configAppDelegateApplication:application didFinishLaunchingWithOptions:launchOptions];
    
    return YES;
}

/**初始化AppDelegate的各个category*/
#pragma mark - AppDelegate的各个category
- (void)configAppDelegateApplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    /**监听登录*/
    [self monitorLoginStatusApplication:application didFinishLaunchingWithOptions:launchOptions];
}


/**没有登录的*/
- (void)initLoginRootVC
{
    PALoginViewController * loginVC = [[PALoginViewController alloc] init];
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:loginVC];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
}
/**售后登录*/
- (void)initAfterSaleRootVC
{
    PAAfterSaleMainTabBarController * tabBarVC = [[PAAfterSaleMainTabBarController alloc] init];
    self.window.rootViewController = tabBarVC;
    [self.window makeKeyAndVisible];
}
/**工程登录*/
- (void)initProjectRootVC
{
    
}
/**代理商登录*/
- (void)initAgentsRootVC
{
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
