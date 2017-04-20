//
//  DDBaseTableViewCell.m
//  DoorDuProjectAssistant
//
//  Created by 刘和东 on 2017/4/17.
//  Copyright © 2017年 深圳市多度科技有限公司. All rights reserved.
//

#import "DDBaseTableViewCell.h"

@implementation DDBaseTableViewCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.cellHeightt = 0;
}

- (void)returnObjectCallBlock:(__autoreleasing CallBackReturnObjectDataBlock)block
{
    self.retrunObjectBlock = block;
}

- (void)returnRefreshCallBlock:(__autoreleasing CallBackRefreshDataBlock)block
{
    self.retrunRefreshBlock = block;
}

+ (CGFloat)cellHeight
{
    return 0;
}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    NSLog(@"dealloc:%@",NSStringFromClass([self class]));
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
