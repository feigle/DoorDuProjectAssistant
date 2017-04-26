//
//  PAAfterSaleTaskSelectorView.h
//  DoorDuProjectAssistant
//
//  Created by 刘和东 on 2017/4/24.
//  Copyright © 2017年 深圳市多度科技有限公司. All rights reserved.
//

#import "DDBaseView.h"

/**选择器-用于选择：解决中、已解决、已关闭*/
@interface PAAfterSaleTaskSelectorView : DDBaseView

/**解决中的个数*/
@property (nonatomic,assign) NSInteger handlingTaskNumber;
/**已解决的个数*/
@property (nonatomic,assign) NSInteger resolvedTaskNumber;
/**已关闭的个数*/
@property (nonatomic,assign) NSInteger closedTaskNumber;

@end
