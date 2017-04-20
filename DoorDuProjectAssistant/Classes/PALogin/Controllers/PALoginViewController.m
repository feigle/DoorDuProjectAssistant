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
