//
//  DDUserDefaults.h
//  DoorDuProjectAssistant
//
//  Created by 刘和东 on 2017/4/19.
//  Copyright © 2017年 深圳市多度科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

/**简单的记录数据*/
@interface DDUserDefaults : NSObject

/**保存登录类型*/
+ (void)saveLoginIdentityType:(ProjectAssistantLoginIdentityType)type;
/**获取登录类型*/
+ (ProjectAssistantLoginIdentityType)getIdentityType;


@end
