//
//  PAAfterSaleMainTabBarController.m
//  DoorDuProjectAssistant
//
//  Created by 刘和东 on 2017/4/19.
//  Copyright © 2017年 深圳市多度科技有限公司. All rights reserved.
//

#import "PAAfterSaleMainTabBarController.h"
#import "PAAfterSaleHomePageViewController.h"
#import "PAAfterSaleTaskViewController.h"
#import "PAAfterSalePersonalCenterViewController.h"

@interface PAAfterSaleMainTabBarController ()

@end

@implementation PAAfterSaleMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self configTabBarControllers];
}

#pragma mark -  UITabBar 与子空间初始化
- (void)configTabBarControllers
{
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:ColorHex(@"#989898"), NSForegroundColorAttributeName, [UIFont systemFontOfSize:10],NSFontAttributeName,nil] forState:UIControlStateNormal];
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:navBarTintColor, NSForegroundColorAttributeName, [UIFont systemFontOfSize:10],NSFontAttributeName,nil] forState:UIControlStateSelected];
    NSArray * controllers = @[NSStringFromClass([PAAfterSaleHomePageViewController class]), NSStringFromClass([PAAfterSaleTaskViewController class]),NSStringFromClass([PAAfterSalePersonalCenterViewController class])];
    NSArray * selectedArray = @[@"PAAfterSaleMainTabBarHomePageSelectedImage",@"PAAfterSaleMainTabBarTaskSelectedImage",@"PAAfterSaleMainTabBarPersonalCenterSelectedImage"];
    NSArray * normalArray = @[@"PAAfterSaleMainTabBarHomePageNormalImage", @"PAAfterSaleMainTabBarTaskNormalImage", @"PAAfterSaleMainTabBarPersonalCenterNormalImage"];
    NSArray * titles = @[@"主页", @"任务",@"我的"];
    NSMutableArray * controllerSS = [NSMutableArray array];
    int i = 0;
    for (NSString * controllerName in controllers) {
        Class class = NSClassFromString(controllerName);
        UIViewController * parent = [[class alloc] init];
        UINavigationController * nv = [[UINavigationController alloc] initWithRootViewController:parent];
        parent.tabBarItem = [self createTabBarItem:titles[i] image:normalArray[i] selectedImage:selectedArray[i]];
        [controllerSS addObject:nv];
        i++;
    }
    self.tabBar.clipsToBounds = YES;
    self.tabBar.opaque = YES;
    self.viewControllers = controllerSS;
    

}
- (UITabBarItem *)createTabBarItem:(NSString *)title image:(NSString *)imageName selectedImage:(NSString *)selectedImageName
{
    UIImage * image = [UIImage imageNamed:imageName];
    UIImage * selImage = [UIImage imageNamed:selectedImageName];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    selImage = [selImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem * item = [[UITabBarItem alloc] initWithTitle:title image:image selectedImage:selImage];
    
    item.titlePositionAdjustment = UIOffsetMake(0, -3);
    return item;
}
#pragma mark - 隐藏tabBar
+ (void)tabBarHidden:(BOOL)hidden
{
    
}
- (void)tabBarHidden:(BOOL)hidden
{
    static BOOL tabBarHidden = NO;
    if (tabBarHidden == hidden) {
        return;
    }
    tabBarHidden = hidden;
    //    if (!hidden) {
    //        tabBarController.tabBar.hidden = NO;
    //    }
    [UIView animateWithDuration:0.3 animations:^{
        CGRect tabFrame = self.tabBar.frame;
        if (tabBarHidden) {
            tabFrame.origin.y = KScreenHeight;
        }else{
            tabFrame.origin.y = KScreenHeight - tabFrame.size.height;
        }
        self.tabBar.frame = tabFrame;
    } completion:^(BOOL finished) {
        //        tabBarController.tabBar.hidden = hidden;
    }];
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
