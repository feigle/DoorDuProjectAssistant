//
//  SystemStaticInlineHeader.h
//  DoorDuProjectAssistant
//
//  Created by 刘和东 on 2017/4/19.
//  Copyright © 2017年 深圳市多度科技有限公司. All rights reserved.
//

#ifndef SystemStaticInlineHeader_h
#define SystemStaticInlineHeader_h
#import "AppDelegate.h"
#import "DDUserDefaults.h"

#pragma mark - 根据本APP定制的一些
/**保存登录身份*/
static inline void saveLoginIdentityType(ProjectAssistantLoginIdentityType type){
    [DDUserDefaults saveLoginIdentityType:type];
}
/**获取登录身份*/
static inline ProjectAssistantLoginIdentityType getLoginIdentityType(){
   return [DDUserDefaults getIdentityType];
}

#pragma mark - 通用的方法
/**AppDelegate单例*/
static inline AppDelegate * nowAppDelegate()
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

/**数据NSUserDefaults保存到本地*/
static inline void saveValueForKey(NSString *value, NSString *key) {
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:key];
    // 强行保存
    [[NSUserDefaults standardUserDefaults] synchronize];
}

/**数据根据key值NSUserDefaults从本地取出*/
static inline id restoreValueForKey(NSString *key) {
    [[NSUserDefaults standardUserDefaults] synchronize];
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

/**数据根据key值NSUserDefaults从本地移除*/
static inline void removeValueForkey(NSString * key) {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
/**拼接两个字符串*/
static inline NSString * strConcat(NSString *s1, NSString *s2) {
    return [NSString stringWithFormat:@"%@%@", s1, s2];
}
/**
 *  根据颜色的字符串得到字符串
 *
 *  @param stringToConvert 颜色对应的字符串
 *
 *  @return 返回对应的UIColor
 */
static inline UIColor * colorWithHexString(NSString * stringToConvert)
{
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    //if ([cString length] < 6) return DEFAULT_VOID_COLOR;
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    //if ([cString length] != 6) return DEFAULT_VOID_COLOR;
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    //SL_Log(@"%f:::%f:::%f",((float) r / 255.0f),((float) g / 255.0f),((float) b / 255.0f));
#define LHD_COLOR(RED, GREEN, BLUE, ALPHA)	[UIColor colorWithRed:RED green:GREEN blue:BLUE alpha:ALPHA]
    return LHD_COLOR(((float) r / 255.0f),((float) g / 255.0f),((float) b / 255.0f), 1);
}


#endif /* SystemStaticInlineHeader_h */
