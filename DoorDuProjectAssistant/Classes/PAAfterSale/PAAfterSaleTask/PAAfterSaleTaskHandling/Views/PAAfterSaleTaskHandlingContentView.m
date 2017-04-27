//
//  PAAfterSaleTaskHandlingContentView.m
//  DoorDuProjectAssistant
//
//  Created by 刘和东 on 2017/4/26.
//  Copyright © 2017年 深圳市多度科技有限公司. All rights reserved.
//

#import "PAAfterSaleTaskHandlingContentView.h"

@interface PAAfterSaleTaskHandlingContentView ()

/**倒计时*/
@property (nonatomic,strong) UILabel * countdownLabel;
/**结束日期*/
@property (nonatomic,strong) UILabel * finishDateLabel;
/**任务主题*/
@property (nonatomic,strong) UILabel * taskThemeLabel;
/**任务类型*/
@property (nonatomic,strong) UILabel * taskTypeLabel;
/**客户姓名*/
@property (nonatomic,strong) UILabel * clientNameLabel;
/**联系方式*/
@property (nonatomic,strong) UILabel * contactWayLabel;
/**地址*/
@property (nonatomic,strong) UILabel * addressLabel;
/**描述*/
@property (nonatomic,strong) UILabel * desLabel;
/**批注*/
@property (nonatomic,strong) UILabel * postilLabel;

@end

@implementation PAAfterSaleTaskHandlingContentView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self configUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configUI];
    }
    return self;
}

- (void)configUI
{
#pragma mark - 布局-  倒计时 && 结束日期
    [self addSubview:self.countdownLabel];
    [self addSubview:self.finishDateLabel];
    [self addSubview:[self lineViewTop:self.finishDateLabel.bottom+15*kScreen6ScaleH-0.5]];
#pragma mark - 布局-  主题 && 任务类型 && 客户姓名 && 联系方式 && 地址
    CGFloat titleWidth = [@"任务类型" returnSizeWithFont:font6Size(28/2.0) color:ColorHex(@"#999999") height:font6Size(28/2.0).lineHeight].width+2;
    CGFloat titleHeight = font6Size(28/2.0).lineHeight;
    /**主题*/
    UILabel * taskThemeTitleLabel = [self titleLabelWithTitle:@"主题" frame:CGRectMake6(15, 0, titleWidth, titleHeight)];
    taskThemeTitleLabel.top6 = self.finishDateLabel.bottom6+15+15;
    [self addSubview:taskThemeTitleLabel];
    [self addSubview:self.taskThemeLabel];
    self.taskThemeLabel.x6 = taskThemeTitleLabel.right6+10;
    self.taskThemeLabel.top = taskThemeTitleLabel.top;
    self.taskThemeLabel.width6 = self.width6- taskThemeTitleLabel.right6-20;
    /**任务类型*/
    UILabel * taskTypeTitleLabel = [self titleLabelWithTitle:@"任务类型" frame:CGRectMake6(15, 0, titleWidth, titleHeight)];
    taskTypeTitleLabel.top6 = taskThemeTitleLabel.bottom6+10;
    [self addSubview:taskTypeTitleLabel];
    [self addSubview:self.taskTypeLabel];
    self.taskTypeLabel.width = self.taskThemeLabel.width;
    self.taskTypeLabel.x6 = taskTypeTitleLabel.right6+10;
    self.taskTypeLabel.top = taskTypeTitleLabel.top;
    /**客户姓名*/
    UILabel * clientNameTitleLabel = [self titleLabelWithTitle:@"客户姓名" frame:CGRectMake6(15, 0, titleWidth, titleHeight)];
    clientNameTitleLabel.top6 = taskTypeTitleLabel.bottom6+10;
    [self addSubview:clientNameTitleLabel];
    [self addSubview:self.clientNameLabel];
    self.clientNameLabel.width = self.taskThemeLabel.width;
    self.clientNameLabel.x6 = clientNameTitleLabel.right6+10;
    self.clientNameLabel.top = clientNameTitleLabel.top;
    /**联系方式*/
    UILabel * contactWayTitleLabel = [self titleLabelWithTitle:@"联系方式" frame:CGRectMake6(15, 0, titleWidth, titleHeight)];
    contactWayTitleLabel.top6 = clientNameTitleLabel.bottom6+10;
    [self addSubview:contactWayTitleLabel];
    [self addSubview:self.contactWayLabel];
    self.contactWayLabel.width = self.taskThemeLabel.width;
    self.contactWayLabel.x6 = contactWayTitleLabel.right6+10;
    self.contactWayLabel.top = contactWayTitleLabel.top;
    /**地址*/
    UILabel * addressTitleLabel = [self titleLabelWithTitle:@"地址" frame:CGRectMake6(15, 0, titleWidth, titleHeight)];
    addressTitleLabel.top6 = contactWayTitleLabel.bottom6+10;
    [self addSubview:addressTitleLabel];
    [self addSubview:self.addressLabel];
    self.addressLabel.width = self.taskThemeLabel.width;
    self.addressLabel.x6 = addressTitleLabel.right6+10;
    self.addressLabel.top = addressTitleLabel.top;
    /**添加分割线*/
    UIView * lineAddressView =[self lineViewTop:addressTitleLabel.bottom+15*kScreen6ScaleH-0.5];
    lineAddressView.x6 = 15;
    [self addSubview:lineAddressView];
#pragma mark - 布局--   描述
    UILabel * desTitleLabel = [self titleLabelWithTitle:@"描述" frame:CGRectMake6(15, 0, titleWidth, titleHeight)];
    desTitleLabel.top6 = lineAddressView.bottom6+15;
    [self addSubview:desTitleLabel];
}
/**倒计时*/
- (UILabel *)countdownLabel
{
    if (!_countdownLabel) {
        _countdownLabel = [ControlManager lableFrame:CGRectMake6(15, 15, self.width6-30, 0) title:@"倒计时：3天15小时20分" font:font6Size(28/2.0) textColor:ColorHex(@"#E52112")];
        _countdownLabel.height = font6Size(28/2.0).lineHeight;
    }
    return _countdownLabel;
}
/**结束日期*/
- (UILabel *)finishDateLabel
{
    if (!_finishDateLabel) {
        _finishDateLabel = [ControlManager lableFrame:CGRectMake6(15, 15, self.width6-30, 0) title:@"结束日期：2017-03-18 18:00:00" font:font6Size(28/2.0) textColor:ColorHex(@"#999999")];
        _finishDateLabel.height = font6Size(28/2.0).lineHeight;
        _finishDateLabel.top6 = self.countdownLabel.bottom6+10;
    }
    return _finishDateLabel;
}
/**任务主题*/
- (UILabel *)taskThemeLabel
{
    if (!_taskThemeLabel) {
        _taskThemeLabel = [ControlManager lableFrame:CGRectZero title:@"任务主题" font:font6Size(28/2.0) textColor:ColorHex(@"#000000")];
        _taskThemeLabel.height = font6Size(28/2.0).lineHeight;
    }
    return _taskThemeLabel;
}
/**任务类型*/
- (UILabel *)taskTypeLabel
{
    if (!_taskTypeLabel) {
        _taskTypeLabel = [ControlManager lableFrame:CGRectZero title:@"任务类型" font:font6Size(28/2.0) textColor:ColorHex(@"#000000")];
        _taskTypeLabel.height = font6Size(28/2.0).lineHeight;
    }
    return _taskTypeLabel;
}
/**客户姓名*/
- (UILabel *)clientNameLabel
{
    if (!_clientNameLabel) {
        _clientNameLabel = [ControlManager lableFrame:CGRectZero title:@"客户姓名" font:font6Size(28/2.0) textColor:ColorHex(@"#000000")];
        _clientNameLabel.height = font6Size(28/2.0).lineHeight;
    }
    return _clientNameLabel;
}
/**联系方式*/
- (UILabel *)contactWayLabel
{
    if (!_contactWayLabel) {
        _contactWayLabel = [ControlManager lableFrame:CGRectZero title:@"联系方式" font:font6Size(28/2.0) textColor:ColorHex(@"#000000")];
        _contactWayLabel.height = font6Size(28/2.0).lineHeight;
    }
    return _contactWayLabel;
}
/**地址*/
- (UILabel *)addressLabel
{
    if (!_addressLabel) {
        _addressLabel = [ControlManager lableFrame:CGRectZero title:@"地址" font:font6Size(28/2.0) textColor:ColorHex(@"#000000")];
        _addressLabel.height = font6Size(28/2.0).lineHeight;
    }
    return _addressLabel;
}
/**描述*/
- (UILabel *)desLabel
{
    if (!_desLabel) {
        _desLabel = [ControlManager lableFrame:CGRectZero title:@"描述" font:font6Size(28/2.0) textColor:ColorHex(@"#000000")];
        _desLabel.height = font6Size(28/2.0).lineHeight;
    }
    return _desLabel;
}
/**批注*/
- (UILabel *)postilLabel
{
    if (!_postilLabel) {
        _postilLabel = [ControlManager lableFrame:CGRectZero title:@"批注" font:font6Size(28/2.0) textColor:ColorHex(@"#000000")];
        _postilLabel.height = font6Size(28/2.0).lineHeight;
    }
    return _postilLabel;
}
#pragma mark - 工厂
/**一条分割线*/
- (UIView *)lineViewTop:(CGFloat)top
{
    UIView * lineView = [ControlManager viewWithFrame:CGRectMake(0, top, self.width, 0.5) backgroundColor:[UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1.00]];
    return lineView;
}
/**标题title的label*/
- (UILabel *)titleLabelWithTitle:(NSString *)title frame:(CGRect)frame
{
    UILabel * label = [ControlManager lableFrame:frame title:title font:font6Size(28/2.0) textColor:ColorHex(@"#999999")];
    return label;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
