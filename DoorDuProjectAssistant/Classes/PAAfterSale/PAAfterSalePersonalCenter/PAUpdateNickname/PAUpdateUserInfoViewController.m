//
//  PAUpdateNicknameViewController.m
//  DoorDuProjectAssistant
//
//  Created by feigle on 2017/4/21.
//  Copyright © 2017年 深圳市多度科技有限公司. All rights reserved.
//

#import "PAUpdateUserInfoViewController.h"

@interface PAUpdateUserInfoViewController ()

@property (nonatomic, strong) UITextField *updateTextField;

@end

@implementation PAUpdateUserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self customNavigationItem];
    
    [self initUI];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [_updateTextField becomeFirstResponder];
}

/**初始化UI*/
- (void)initUI
{
    UIView *view = [ControlManager viewWithFrame:CGRectMake(0, 10, KScreenWidth, 44) backgroundColor:ColorHex(@"#ffffff")];
    view.layer.borderColor = ColorHex(@"#dddddd").CGColor;
    view.layer.borderWidth = 0.5;
    
    UITextField *textField = [ControlManager textFieldWithFrame:CGRectMake(10, 0, KScreenWidth-20, 44) font:font6Size(14) textColor:ColorHex(@"#000000")];
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    if (_orignalStr.length > 0) {
        textField.text = _orignalStr;
    }
    _updateTextField = textField;
    [view addSubview:textField];
    [self.view addSubview:view];
}

/**设置导航栏*/
- (void)customNavigationItem
{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"保存" forState:UIControlStateNormal];
    [btn setTitleColor:ColorHex(@"#04c9b3") forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:16.0];
    [btn sizeToFit];
    btn.backgroundColor = [UIColor clearColor];
    [btn addTarget:self action:@selector(navibarRightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * item=[[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = item;
    
    if (_type == UPDATE_NICKNAME) {
        self.navigationItem.title = @"昵称";
    }else {
        self.navigationItem.title = @"邮箱";
    }
}

- (void)navibarRightBtnClick:(id)sender
{
    //保存
    [self.navigationController popViewControllerAnimated:YES];
    
    //保存成功回调新昵称
    self.retrunObjectBlock(@"aaa");
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
