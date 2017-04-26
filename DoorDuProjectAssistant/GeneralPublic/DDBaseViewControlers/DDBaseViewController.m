//
//  DDBaseViewController.m
//  DoorDuProjectAssistant
//
//  Created by 刘和东 on 2017/4/17.
//  Copyright © 2017年 深圳市多度科技有限公司. All rights reserved.
//

#import "DDBaseViewController.h"
#import "SDWebImageManager.h"
#import "UIImage+LHDTools.h"

@interface DDBaseViewController ()

@end

@implementation DDBaseViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.page = 1;
        self.pagesize = 10;
        self.dataTotal = 9999;
        self.fistRequestData = YES;
    }
    return self;
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.view endEditing:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = ColorHex(@"#EFEFF4");
    [self configSetupBase];
}

- (void)configSetupBase
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:ColorHex(@"#000000"),NSForegroundColorAttributeName,font6Size(36/2.0),NSFontAttributeName,nil]];
    
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    //设置导航栏左右标题的文字颜色
    self.navigationController.navigationBar.tintColor = navBarTintColor;
    //默认带有一定透明效果，可以使用以下方法去除系统效果
    [self.navigationController.navigationBar setTranslucent:NO];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage createImageWithColor:[UIColor whiteColor] size:CGSizeMake(1, 1)]
                                                 forBarPosition:UIBarPositionAny
                                                     barMetrics:UIBarMetricsDefault];
    /**这样去除下划线- 灰色的分割线*/
//    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    [self.navigationController.navigationBar setShadowImage:[UIImage createImageWithColor:[UIColor colorWithRed:0.97 green:0.96 blue:0.97 alpha:1.00] size:CGSizeMake(1, 1)]];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}


- (void)returnObjectCallBlock:(__autoreleasing CallBackReturnObjectDataBlock)block
{
    self.retrunObjectBlock = block;
}

- (void)returnRefreshCallBlock:(__autoreleasing CallBackRefreshDataBlock)block
{
    self.retrunRefreshBlock = block;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    NSLog(@"dealloc:%@",NSStringFromClass([self class]));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@"didReceiveMemoryWarning:%@",NSStringFromClass([self class]));
    SDWebImageManager * sdm = [SDWebImageManager sharedManager];
    [sdm cancelAll];
    [sdm.imageCache clearMemory];
    [[SDImageCache sharedImageCache] setValue:nil forKey:@"memCache"];
    //    [[YYImageCache sharedCache].memoryCache removeAllObjects];
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
