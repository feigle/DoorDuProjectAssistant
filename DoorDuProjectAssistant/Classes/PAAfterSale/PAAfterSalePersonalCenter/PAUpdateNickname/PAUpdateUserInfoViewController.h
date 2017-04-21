//
//  PAUpdateNicknameViewController.h
//  DoorDuProjectAssistant
//
//  Created by feigle on 2017/4/21.
//  Copyright © 2017年 深圳市多度科技有限公司. All rights reserved.
//

/**昵称更新*/
#import "HandleNavigationBarViewController.h"

typedef NS_ENUM(NSUInteger, UpdateType) {
    UPDATE_NICKNAME = 0,
    UPDATE_EMAIL    = 1
};

@interface PAUpdateUserInfoViewController : HandleNavigationBarViewController

@property (nonatomic, assign) UpdateType type;
/**
 原始数据内容
 */
@property (nonatomic, strong) NSString *orignalStr;

@end
