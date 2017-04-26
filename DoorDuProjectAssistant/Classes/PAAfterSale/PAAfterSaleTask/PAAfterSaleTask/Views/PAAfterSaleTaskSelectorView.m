//
//  PAAfterSaleTaskSelectorView.m
//  DoorDuProjectAssistant
//
//  Created by 刘和东 on 2017/4/24.
//  Copyright © 2017年 深圳市多度科技有限公司. All rights reserved.
//

#import "PAAfterSaleTaskSelectorView.h"

@interface PAAfterSaleTaskSelectorView ()

/**解决中指示条宽度*/
@property (nonatomic,assign) CGFloat handlingTaskIndicateWidth;
/**已解决指示条宽度*/
@property (nonatomic,assign) CGFloat resolvedTaskIndicateWidth;
/**已关闭指示条宽度*/
@property (nonatomic,assign) CGFloat closedTaskIndicateWidth;

/**下面的指示view*/
@property (nonatomic,strong) UIView * indicateView;

/**选中了第几个*/
@property (nonatomic,assign) NSInteger selectedIndex;

@end

@implementation PAAfterSaleTaskSelectorView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self configUI];
    }
    return self;
}

- (void)clickedLabel:(UILabel *)label
{
    if (self.selectedIndex == label.tag - 100) {
        return;
    }
    self.selectedIndex = label.tag - 100;
    [self moveIndicateView];
    if (self.retrunObjectBlock) {
        self.retrunObjectBlock(@(label.tag-100));
    }
}

/**移动*/
- (void)moveIndicateView
{
    CGFloat indicateViewWidth = self.handlingTaskIndicateWidth;
    if (self.selectedIndex == 1) {
        indicateViewWidth = self.resolvedTaskIndicateWidth;
    }
    if (self.selectedIndex == 2) {
        indicateViewWidth = self.closedTaskIndicateWidth;
    }
    [UIView animateWithDuration:0.3 animations:^{
        self.indicateView.width = indicateViewWidth;
    }];
    [UIView animateWithDuration:0.35 animations:^{
        self.indicateView.centerX = self.width/3.0/2.0+self.width/3.0*self.selectedIndex;
    }];
}

- (void)configUI
{
    self.backgroundColor = [UIColor whiteColor];
    self.height6 = 96/2.0;
    self.width = KScreenWidth;
    NSArray * titlesArray = @[@"解决中",@"已解决",@"已关闭"];
    self.handlingTaskIndicateWidth = [@"解决中" returnSizeWithFont:font6Size(32/2.0) color:ColorHex(@"#3F3F3F") height:font6Size(32/2.0).lineHeight].width;
    self.resolvedTaskIndicateWidth = self.handlingTaskIndicateWidth;
    self.closedTaskIndicateWidth = self.handlingTaskIndicateWidth;
    self.indicateView.width = self.handlingTaskIndicateWidth;
    for (NSInteger i = 0; i < titlesArray.count; i++) {
        UILabel * label = [ControlManager lableFrame:CGRectMake(i*self.width/3.0, 0, self.width/3.0, self.height) title:titlesArray[i] font:font6Size(32/2.0) textColor:ColorHex(@"#3F3F3F") textAligment:NSTextAlignmentCenter];
        label.tag = i+100;
        WeakSelf
        [label addLHDClickedHandle:^(id sender) {
            StrongSelf
            [strongSelf clickedLabel:sender];
        }];
        [self addSubview:label];
    }
    [self addSubview:self.indicateView];
    self.indicateView.centerX = self.width/3.0/2.0;
    self.indicateView.bottom = self.height;
    self.selectedIndex = 0;
}
/**解决中的个数*/
- (void)setHandlingTaskNumber:(NSInteger)handlingTaskNumber
{
    _handlingTaskNumber = handlingTaskNumber;
    NSString * handlingNumberStr = [NSString stringWithFormat:@" %ld",handlingTaskNumber];
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@", @"解决中", handlingNumberStr]];
    [attributedString beginEditing];
    [attributedString addAttribute:NSForegroundColorAttributeName value:ColorHex(@"#3F3F3F") range:NSMakeRange(0, attributedString.length)];
    [attributedString addAttribute:NSFontAttributeName value:font6Size(32/2.0) range:NSMakeRange(0, attributedString.length)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:ColorHex(@"#E52112") range:NSMakeRange(@"解决中".length, handlingNumberStr.length)];
    [attributedString endEditing];
    UILabel * label = (UILabel *)[self viewWithTag:100];
    label.attributedText = attributedString;
    self.handlingTaskIndicateWidth = [attributedString returnSizeWithHeight:font6Size(32/2.0).lineHeight].width;
    [self moveIndicateView];
}
/**已解决的个数*/
- (void)setResolvedTaskNumber:(NSInteger)resolvedTaskNumber
{
    _resolvedTaskNumber = resolvedTaskNumber;
    NSString * handlingNumberStr = [NSString stringWithFormat:@" %ld",resolvedTaskNumber];
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@", @"已解决", handlingNumberStr]];
    [attributedString beginEditing];
    [attributedString addAttribute:NSForegroundColorAttributeName value:ColorHex(@"#3F3F3F") range:NSMakeRange(0, attributedString.length)];
    [attributedString addAttribute:NSFontAttributeName value:font6Size(32/2.0) range:NSMakeRange(0, attributedString.length)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:ColorHex(@"#F5A623") range:NSMakeRange(@"已解决".length, handlingNumberStr.length)];
    [attributedString endEditing];
    UILabel * label = (UILabel *)[self viewWithTag:101];
    label.attributedText = attributedString;
    self.resolvedTaskIndicateWidth = [attributedString returnSizeWithHeight:font6Size(32/2.0).lineHeight].width;
    [self moveIndicateView];

}
/**已关闭的个数*/
- (void)setClosedTaskNumber:(NSInteger)closedTaskNumber
{
    _closedTaskNumber = closedTaskNumber;
    NSString * handlingNumberStr = [NSString stringWithFormat:@" %ld",closedTaskNumber];
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@", @"已关闭", handlingNumberStr]];
    [attributedString beginEditing];
    [attributedString addAttribute:NSForegroundColorAttributeName value:ColorHex(@"#3F3F3F") range:NSMakeRange(0, attributedString.length)];
    [attributedString addAttribute:NSFontAttributeName value:font6Size(32/2.0) range:NSMakeRange(0, attributedString.length)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:ColorHex(@"#04C9B3") range:NSMakeRange(@"已关闭".length, handlingNumberStr.length)];
    [attributedString endEditing];
    UILabel * label = (UILabel *)[self viewWithTag:102];
    label.attributedText = attributedString;
    self.closedTaskIndicateWidth = [attributedString returnSizeWithHeight:font6Size(32/2.0).lineHeight].width;
    [self moveIndicateView];
}

- (UIView *)indicateView
{
    if (!_indicateView) {
        _indicateView = [ControlManager viewWithFrame:CGRectMake(0, 0, 0, 2)];
        _indicateView.backgroundColor = ColorHex(@"#04C9B3");
    }
    return _indicateView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
