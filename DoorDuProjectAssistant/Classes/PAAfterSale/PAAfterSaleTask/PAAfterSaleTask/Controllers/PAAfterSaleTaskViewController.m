//
//  PAAfterSaleTaskViewController.m
//  DoorDuProjectAssistant
//
//  Created by 刘和东 on 2017/4/19.
//  Copyright © 2017年 深圳市多度科技有限公司. All rights reserved.
//

#import "PAAfterSaleTaskViewController.h"
#import "PAAfterSaleTaskSelectorView.h"
#import "PAAfterSaleTaskClosedViewController.h"
#import "PAAfterSaleTaskHandlingViewController.h"
#import "PAAfterSaleTaskResolvedViewController.h"


@interface PAAfterSaleTaskViewController ()

/**选项卡*/
@property (nonatomic,strong) PAAfterSaleTaskSelectorView * taskSelectorView;
/**容纳各个控制器的view*/
@property (nonatomic,strong) UIScrollView * contentScorllView;

@end

@implementation PAAfterSaleTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"任务";
    [self configUI];
}

- (void)configUI
{
    [self.view addSubview:self.taskSelectorView];
    [self.view addSubview:self.contentScorllView];
    self.taskSelectorView.handlingTaskNumber = 5;
    self.taskSelectorView.resolvedTaskNumber = 5000;
    self.taskSelectorView.closedTaskNumber = 15;
#pragma mark - 解决中控制器
    PAAfterSaleTaskHandlingViewController * handlingVC = [[PAAfterSaleTaskHandlingViewController alloc] init];
    handlingVC.view.frame = self.contentScorllView.bounds;
    handlingVC.superViewController = self;
    [self addChildViewController:handlingVC];
    [self.contentScorllView addSubview:handlingVC.view];
#pragma mark - 已解决控制器
    PAAfterSaleTaskResolvedViewController * resolvedVC = [[PAAfterSaleTaskResolvedViewController alloc] init];
    resolvedVC.view.frame = self.contentScorllView.bounds;
    resolvedVC.superViewController = self;
    resolvedVC.view.x = KScreenWidth;
    [self addChildViewController:resolvedVC];
    [self.contentScorllView addSubview:resolvedVC.view];
#pragma mark - 已关闭控制器
    PAAfterSaleTaskClosedViewController * closedVC = [[PAAfterSaleTaskClosedViewController alloc] init];
    closedVC.view.frame = self.contentScorllView.bounds;
    closedVC.view.x = KScreenWidth*2;
    closedVC.superViewController = self;
    [self addChildViewController:closedVC];
    [self.contentScorllView addSubview:closedVC.view];
    self.contentScorllView.contentSize = CGSizeMake(KScreenWidth*3, self.contentScorllView.height);
}

#pragma mark - 懒加载
/**选项卡*/
- (PAAfterSaleTaskSelectorView *)taskSelectorView
{
    if (!_taskSelectorView) {
        _taskSelectorView = [[PAAfterSaleTaskSelectorView alloc] init];
        WeakSelf
        [_taskSelectorView returnObjectCallBlock:^(id objc) {
            NSInteger row = [objc integerValue];
            NSLog(@"row：%ld",row);
            StrongSelf
            strongSelf.contentScorllView.contentOffset = CGPointMake(row*KScreenWidth, 0);
        }];
    }
    return _taskSelectorView;
}
/**容纳各个控制器的view*/
- (UIScrollView *)contentScorllView
{
    if (!_contentScorllView) {
        _contentScorllView = [ControlManager scrollViewWithFrame:CGRectMake(0, self.taskSelectorView.bottom, self.view.width, KScreenHeight-self.taskSelectorView.height-64-49) isBounces:NO isShowIndicator:NO];
        _contentScorllView.scrollEnabled = NO;
    }
    return _contentScorllView;
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
