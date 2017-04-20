//
//  DDUserDefaults.m
//  DoorDuProjectAssistant
//
//  Created by 刘和东 on 2017/4/19.
//  Copyright © 2017年 深圳市多度科技有限公司. All rights reserved.
//

#import "DDUserDefaults.h"

@implementation DDUserDefaults

/**保存登录类型*/
+ (void)saveLoginIdentityType:(ProjectAssistantLoginIdentityType)type
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults setInteger:type forKey:@"PoliceAssistantIdentityTypePoliceAssistantIdentityType"];
    [defaults synchronize];
}
/**获取登录类型*/
+ (ProjectAssistantLoginIdentityType)getIdentityType
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    id objc = [defaults objectForKey:@"PoliceAssistantIdentityTypePoliceAssistantIdentityType"];
    if (!objc) {//如果没有，返回没有登录
        return ProjectAssistantLoginIdentityNoLoginType;
    }
    ProjectAssistantLoginIdentityType type = [objc integerValue];
    return type;
}

@end
