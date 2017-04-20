//
//  PALoginViewController.m
//  DoorDuProjectAssistant
//
//  Created by 刘和东 on 2017/4/19.
//  Copyright © 2017年 深圳市多度科技有限公司. All rights reserved.
//

#import "PALoginViewController.h"

@interface PALoginViewController ()

/**账号输入框*/
@property (nonatomic,strong) UITextField * accountTextField;
/**密码输入框*/
@property (nonatomic,strong) UITextField * passwordTextField;
/**登录按钮*/
@property (nonatomic,strong) UIButton * loginButton;

@end

@implementation PALoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"登录";
    [self configUI];
}
#pragma mark - 点击事件处理
/**登录点击事件处理*/
- (void)loginBtnClicked
{
    
}

#pragma mark - 布局UI界面
- (void)configUI
{
    /**输入账号布局*/
    UIView * accountBgView = [self createInputBgViewWithTitle:@"账号" palceholder:@"请输入账号" tfTag:100];
    accountBgView.top6 = 10;
    [self.view addSubview:accountBgView];
    /**输入密码布局*/
    UIView * passwordBgView = [self createInputBgViewWithTitle:@"密码" palceholder:@"请输入密码" tfTag:100];
    passwordBgView.top6 = accountBgView.bottom6+1;
    [self.view addSubview:passwordBgView];
    /**登录按钮布局*/
    self.loginButton.top6 = passwordBgView.bottom6+10;
    [self.view addSubview:self.loginButton];
}

#pragma mark - 懒加载
- (UIButton *)loginButton
{
    if (!_loginButton) {
        _loginButton = [ControlManager buttonTitle:@"登录" font:font6Size(32/2.0) textColor:[UIColor whiteColor] frame:CGRectMake6(15, 0, kScreen6Width-30, 88/2.0) target:self selector:@selector(loginBtnClicked)];
        _loginButton.backgroundColor = navBarTintColor;
        ViewRadius(_loginButton, 4);
    }
    return _loginButton;
}
#pragma mark - 自定义界面
/**
 创建输入框当前行

 @param title 标题
 @param placeholder placeholder
 @param tfTag tf的tag值
 @return 返回背景view
 */
- (UIView *)createInputBgViewWithTitle:(NSString *)title palceholder:(NSString *)placeholder tfTag:(NSInteger)tfTag
{
    UIView * bgView = [ControlManager viewWithFrame:CGRectMake6(0, 0, kScreen6Width, 88/2.0) backgroundColor:[UIColor whiteColor]];
    
    return bgView;
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
