//
//  PAAfterSalePersonalCenterViewController.m
//  DoorDuProjectAssistant
//
//  Created by 刘和东 on 2017/4/19.
//  Copyright © 2017年 深圳市多度科技有限公司. All rights reserved.
//

#import "PAAfterSalePersonalCenterViewController.h"
#import "PAUpdateUserInfoViewController.h"
#import "PAAboutProjectAssistantViewController.h"
#import "PASettingViewController.h"

@interface PAAfterSalePersonalCenterViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tView;

@property (nonatomic, strong) NSArray *cellTitles;  //单元格标题

@end

@implementation PAAfterSalePersonalCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.fd_prefersNavigationBarHidden = YES;
    
    _tView = [self tableView];
    [self.view addSubview:_tView];
    
    _cellTitles = @[@"昵称", @"邮箱", @"关于", @"设置"];
}

- (UITableView *)tableView
{
    CGRect tableRect = CGRectMake(0, 0, KScreenWidth, KScreenHeight-44);
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:tableRect style:UITableViewStyleGrouped];
    tableView.delegate=self;
    tableView.dataSource=self;
    tableView.separatorColor = ColorHex(@"#dddddd");
    tableView.showsVerticalScrollIndicator = NO;
    tableView.showsHorizontalScrollIndicator = NO;
    tableView.scrollEnabled = NO;
    
    return tableView;
}

- (UIView *)headView
{
    UIView *view  = [ControlManager viewWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenWidth/2.0) backgroundColor:[UIColor clearColor]];
    UIImageView *bgImageView = [ControlManager imageViewWithFrame:view.bounds];
    bgImageView.image = [UIImage imageNamed:@"setting_head_bg"];
    
    UIButton *headThumbBtn = [ControlManager buttonNormalImage:@"setting_default_head" hightLightImage:@"setting_default_head" frame:CGRectMake6(0, 0, 64, 64) target:self selector:@selector(selectHeadThumbnail:)];
    headThumbBtn.center = view.center;
    
    [view addSubview:bgImageView];
    [view addSubview:headThumbBtn];
    return view;
}


/**选择投降*/
- (void)selectHeadThumbnail:(id)sender
{
    
}

#pragma mark -- UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger row = 0;
    (section == 0) ? (row = 3) : (row = 1);
    return row;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section != 0) {
        return nil;
    }
    
    return [self headView];
}

#pragma mark -- UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section != 0) {
        return 0;
    }
    
    return KScreenWidth/2.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseName = @"cell";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseName];
    
    NSInteger row = indexPath.row;
    NSInteger section = indexPath.section;
    
    cell.textLabel.text = _cellTitles[row+section*3];
    cell.textLabel.textColor = ColorHex(@"0a0a0a");
    cell.textLabel.font = font6Size(16);
    
    NSString *detailTitle = nil;
    if (0 == section && 0 == row) {
        detailTitle = @"张三";
    }else if(0 == section && 1 == row) {
        detailTitle = @"***@doordu.com";
    }else {
        detailTitle = @"";
    }
    cell.detailTextLabel.text = detailTitle;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    NSInteger section = indexPath.section;
    if (0 == section) {
        if (0 == row) {
            PAUpdateUserInfoViewController *nicknameVC = [[PAUpdateUserInfoViewController alloc] init];
            nicknameVC.hidesBottomBarWhenPushed = YES;
            // 设置更新成功回调
            MJWeakSelf
            nicknameVC.retrunObjectBlock = ^(id objc) {
                NSString *newNickNameStr = (NSString *)objc;
                // 更新数据源
                // .....
                
                NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
                [weakSelf.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            };
            nicknameVC.orignalStr = @"张三";
            nicknameVC.type = UPDATE_NICKNAME;
            [self pushVC:nicknameVC];
        }else if (1 == row) {
            PAUpdateUserInfoViewController *emailVC = [[PAUpdateUserInfoViewController alloc] init];
            emailVC.hidesBottomBarWhenPushed = YES;
            // 设置更新成功回调
            MJWeakSelf
            emailVC.retrunObjectBlock = ^(id objc) {
                NSString *newEmailStr = (NSString *)objc;
                // 更新数据源
                // .....
                
                NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
                [weakSelf.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            };
            emailVC.orignalStr = @"****@182.com";
            emailVC.type = UPDATE_EMAIL;
            [self pushVC:emailVC];
        }else if (2 == row) {
            PAAboutProjectAssistantViewController *aboutVC = [PAAboutProjectAssistantViewController new];
            aboutVC.hidesBottomBarWhenPushed = YES;
            [self pushVC:aboutVC];
        }
    }else if(1 == section) {
        PASettingViewController *settingVC = [PASettingViewController new];
        settingVC.hidesBottomBarWhenPushed = YES;
        [self pushVC:settingVC];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
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
