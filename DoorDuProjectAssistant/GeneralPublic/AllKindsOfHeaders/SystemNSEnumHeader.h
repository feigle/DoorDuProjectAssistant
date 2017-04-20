//
//  SystemNSEnumHeader.h
//  DoorDuProjectAssistant
//
//  Created by 刘和东 on 2017/4/19.
//  Copyright © 2017年 深圳市多度科技有限公司. All rights reserved.
//
/**全局的枚举*/
#ifndef SystemNSEnumHeader_h
#define SystemNSEnumHeader_h

/***工程助手中，登录的角色*/
/**目前定了  4个  售后，工程，，代理商，  其他*/
typedef NS_ENUM(NSInteger,ProjectAssistantLoginIdentityType) {
    ProjectAssistantLoginIdentityNoLoginType = 0,/**没有登录*/
    ProjectAssistantLoginIdentityAfterSaleType = 1,/**售后*/
    ProjectAssistantLoginIdentityProjectType = 2,/**工程*/
    ProjectAssistantLoginIdentityAgentsType = 3,/**代理商*/
};


#endif /* SystemNSEnumHeader_h */
