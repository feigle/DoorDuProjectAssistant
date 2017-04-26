//
//  DDBaseScrollView.h
//  DoorDuProjectAssistant
//
//  Created by 刘和东 on 2017/4/26.
//  Copyright © 2017年 深圳市多度科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SystemBlockDefinitionHeader.h"

@interface DDBaseScrollView : UIScrollView

@property (nonatomic,weak) UIViewController * superViewController;

/**
 返回一个对象，数据回调
 */
@property (nonatomic,copy) CallBackReturnObjectDataBlock retrunObjectBlock;
- (void)returnObjectCallBlock:(__autoreleasing CallBackReturnObjectDataBlock)block;
/**
 是否需要刷新，数据回调
 */
@property (nonatomic,copy) CallBackRefreshDataBlock retrunRefreshBlock;
- (void)returnRefreshCallBlock:(__autoreleasing CallBackRefreshDataBlock)block;

- (void)pushVC:(UIViewController *)vc;

- (void)pushVC:(UIViewController *)vc animated:(BOOL)animated;


@end
