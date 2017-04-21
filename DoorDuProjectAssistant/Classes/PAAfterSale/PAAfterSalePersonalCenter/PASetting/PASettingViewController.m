//
//  PASettingViewController.m
//  DoorDuProjectAssistant
//
//  Created by feigle on 2017/4/21.
//  Copyright © 2017年 深圳市多度科技有限公司. All rights reserved.
//

#import "PASettingViewController.h"
#import "PAUpdatePwdViewController.h"

@interface PASettingViewController ()

@end

@implementation PASettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"设置";
    
    [self initUI];
}

- (void)initUI
{
    CGRect tableRect = CGRectMake(0, 0, KScreenWidth, KScreenHeight-64);
    UITableView *tableView = [[UITableView alloc] initWithFrame:tableRect style:UITableViewStyleGrouped];
    tableView.delegate=self;
    tableView.dataSource=self;
    tableView.separatorColor = ColorHex(@"#dddddd");
    tableView.showsVerticalScrollIndicator = NO;
    tableView.showsHorizontalScrollIndicator = NO;
    tableView.scrollEnabled = NO;
    
    [self.view addSubview:tableView];
}

- (UILabel *)logoutLabel
{
    UILabel *logoutLabel = [ControlManager lableFrame:CGRectMake(0, 0, KScreenWidth, 44.0) font:font6Size(16) textColor:[UIColor redColor]];
    logoutLabel.textAlignment = NSTextAlignmentCenter;
    logoutLabel.text = @"退出";
    return logoutLabel;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    if (0 == indexPath.section) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"updatePwd"];
        cell.textLabel.text = @"修改密码";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else if(1 == indexPath.section) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"logout"];
        [cell addSubview:[self logoutLabel]];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = indexPath.section;
    
    if (0 == section) {
        PAUpdatePwdViewController *updatePwdVC = [PAUpdatePwdViewController new];
        [self pushVC:updatePwdVC];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
