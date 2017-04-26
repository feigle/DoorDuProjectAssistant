//
//  SystemMacroHeader.h
//  DoorDuProjectAssistant
//
//  Created by 刘和东 on 2017/4/19.
//  Copyright © 2017年 深圳市多度科技有限公司. All rights reserved.
//
/**全部的宏定义*/
#ifndef SystemMacroHeader_h
#define SystemMacroHeader_h

/***圆角的设置**/
/************** View 圆角和加边框 *******************/
#define ViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]];\
[View setClipsToBounds:YES];\
//[View.layer  setShouldRasterize:YES];\
[View.layer  setRasterizationScale:[UIScreen mainScreen].scale]


/************** View 圆角 *******************/
#define ViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View setClipsToBounds:YES];\
//[View.layer  setShouldRasterize:YES];\
[View.layer  setRasterizationScale:[UIScreen mainScreen].scale]

/**************Debug输出*******************/
/**
 *  如果是调试模式，如果不是调试模式，就什么都不做
 *  __VA_ARGS__ 表示见面...的参数列表
 */
#if DDPAReleaseStatus
#define NSLog(...) {}
#else
#define NSLog(fmt, ...)   NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#endif


#define WeakSelf typeof(self) __weak weakSelf = self;
#define StrongSelf typeof(weakSelf) __strong strongSelf = weakSelf;


#endif /* SystemMacroHeader_h */
