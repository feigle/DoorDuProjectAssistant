//
//  PAAfterSaleTaskHandlingCollectionViewCell.m
//  DoorDuProjectAssistant
//
//  Created by 刘和东 on 2017/4/25.
//  Copyright © 2017年 深圳市多度科技有限公司. All rights reserved.
//

#import "PAAfterSaleTaskHandlingCollectionViewCell.h"

@interface PAAfterSaleTaskHandlingCollectionViewCell ()

/**上面的背景view*/
@property (nonatomic,strong) UIView * topBgView;
/**任务状态*/
@property (nonatomic,strong) UIImageView * taskStateImageView;
/**任务编号*/
@property (nonatomic,strong) UILabel * serialNumberLabel;

/**查看任务*/
@property (nonatomic,strong) UIButton * lookOverTaskButton;
/**任务反馈*/
@property (nonatomic,strong) UIButton * taskFeedbackButton;

@end

@implementation PAAfterSaleTaskHandlingCollectionViewCell

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

#pragma mark - 点击事件处理
/**查看任务点击*/
- (void)lookOverTaskButtonClicked
{
    
}
/**任务反馈*/
- (void)taskFeedbackButtonClicked
{
    
}

- (void)configUI
{
    ViewRadius(self, 5);
    self.backgroundColor = [UIColor whiteColor];
    self.contentView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.topBgView];
#pragma mark - 布局上面的view
    [self.topBgView addSubview:self.taskStateImageView];
    [self.topBgView addSubview:self.serialNumberLabel];
    self.taskStateImageView.right = self.topBgView.width;
    self.taskStateImageView.image = [UIImage imageNamed:@"PAAfterSaleTaskurgencyTaskImage"];
#pragma mark - 布局中间内容view
    
#pragma mark - 布局底部的view
    [self.contentView addSubview:self.lookOverTaskButton];
    [self.contentView addSubview:self.taskFeedbackButton];
    self.taskFeedbackButton.x6 = self.lookOverTaskButton.right6+15;
    self.lookOverTaskButton.bottom6 = self.contentView.height6-15;
    self.taskFeedbackButton.bottom = self.lookOverTaskButton.bottom;
    UIView * lineView = [ControlManager viewWithFrame:CGRectMake(0, 0, self.contentView.width, 0.5) backgroundColor:[UIColor colorWithRed:0.92 green:0.92 blue:0.92 alpha:1.00]];
    lineView.top6 = self.lookOverTaskButton.top6 - 15;
    [self.contentView addSubview:lineView];
}

#pragma mark - 懒加载
- (UIView *)topBgView
{
    if (!_topBgView) {
        _topBgView = [ControlManager viewWithFrame:CGRectMake6(0, 0, self.contentView.width, 80/2.0) backgroundColor:ColorHex(@"#FAFAFA")];
    }
    return _topBgView;
}
- (UIImageView *)taskStateImageView
{
    if (!_taskStateImageView) {
        _taskStateImageView = [ControlManager imageViewWithFrame:CGRectMake6(0, 0, 83/2.0, 80/2.0)];
    }
    return _taskStateImageView;
}
- (UILabel *)serialNumberLabel
{
    if (!_serialNumberLabel) {
        _serialNumberLabel = [ControlManager lableFrame:CGRectMake6(15, 0, 0, 0) title:@"任务编号" font:font6Size(32/2.0) textColor:ColorHex(@"#000000")];
        _serialNumberLabel.height = font6Size(32/2.0).lineHeight;
        _serialNumberLabel.width6 = self.topBgView.width6 - self.taskStateImageView.width6 - 30;
        _serialNumberLabel.centerY = self.topBgView.height/2.0;
    }
    return _serialNumberLabel;
}
- (UIButton *)lookOverTaskButton
{
    if (!_lookOverTaskButton) {
        _lookOverTaskButton = [ControlManager buttonTitle:@"查看任务" font:font6Size(28/2.0) textColor:navBarTintColor frame:CGRectMake6(15, 0, (self.topBgView.width6-45)/2.0, 76/2.0) target:self selector:@selector(lookOverTaskButtonClicked)];
        ViewBorderRadius(_lookOverTaskButton, 4, 0.5, navBarTintColor);
    }
    return _lookOverTaskButton;
}
- (UIButton *)taskFeedbackButton
{
    if (!_taskFeedbackButton) {
        
        _taskFeedbackButton = [ControlManager buttonTitle:@"任务反馈" font:font6Size(28/2.0) textColor:[UIColor whiteColor] frame:CGRectMake6(15, 0, (self.topBgView.width6-45)/2.0, 76/2.0) target:self selector:@selector(taskFeedbackButtonClicked)];
        _taskFeedbackButton.backgroundColor = navBarTintColor;
        ViewRadius(_taskFeedbackButton, 4);
    }
    return _taskFeedbackButton;
}

@end
