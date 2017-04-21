//
//  PAUpdatePwdViewController.m
//  DoorDuProjectAssistant
//
//  Created by feigle on 2017/4/21.
//  Copyright © 2017年 深圳市多度科技有限公司. All rights reserved.
//

#import "PAUpdatePwdViewController.h"

@interface PAUpdatePwdViewController ()

//旧密码输入框
@property (nonatomic, strong) UITextField *originalField;
//新密码输入框
@property (nonatomic, strong) UITextField *pwdField;
//新密码输入框（确认）
@property (nonatomic, strong) UITextField *rePwdField;

@end

@implementation PAUpdatePwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"修改密码";
    
    [self initUI];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [_originalField becomeFirstResponder];
}

- (void)initUI
{
    UIView *view = [ControlManager viewWithFrame:CGRectMake(0, 10, KScreenWidth, 44*3+1) backgroundColor:[UIColor whiteColor]];
    
    _originalField = [self textFieldWithFrame:CGRectMake(10, 0, KScreenWidth-20, 44) placehold:@"请输入旧密码"];
    UILabel *line = [self lineWithFrame:CGRectMake(0, 44.5, KScreenWidth, 0.5)];
    [view addSubview:line];
    
    _pwdField = [self textFieldWithFrame:CGRectMake(10, 44.5, KScreenWidth-20, 44) placehold:@"请输入新密码"];
    line = [self lineWithFrame:CGRectMake(0, 44.5+44, KScreenWidth, 0.5)];
    [view addSubview:line];
    
    _rePwdField = [self textFieldWithFrame:CGRectMake(10, 44.5+44.5, KScreenWidth-20, 44) placehold:@"请确认新密码"];
    
    [view addSubview:_originalField];
    [view addSubview:_pwdField];
    [view addSubview:_rePwdField];
    
    UIButton *confirmBtn = [ControlManager buttonTitle:@"确认修改" frame:CGRectMake(10, 44*3+1+20, KScreenWidth-20, 44) target:self selector:@selector(confirmUpdatePwd:)];
    [confirmBtn setBackgroundImage:[UIImage createImageWithColor:[UIColor colorWithRed:34/255.0 green:200/255.0 blue:179/255.0 alpha:1] size:CGSizeMake(1, 1)] forState:UIControlStateNormal];
    confirmBtn.layer.cornerRadius = 5;
    confirmBtn.clipsToBounds = YES;
    [self.view addSubview:confirmBtn];
    
    [self.view addSubview:view];
}

/**确认修改响应*/
- (void)confirmUpdatePwd:(id)sender
{
    
}

- (UITextField *)textFieldWithFrame:(CGRect)frame placehold:(NSString *)placehold
{
    UITextField *textField = [ControlManager textFieldWithFrame:frame font:font6Size(16) textColor:[UIColor blackColor] placeholder:placehold];
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    return textField;
}

- (UILabel *)lineWithFrame:(CGRect)rect
{
    UILabel *line = [ControlManager lableFrame:rect font:font6Size(1) textColor:ColorHex(@"#dddddd")];
    line.backgroundColor = ColorHex(@"#dddddd");
    
    return line;
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
