//
//  NSAttributedString+LHDHandleTools.h
//  DoorDuProjectAssistant
//
//  Created by 刘和东 on 2017/4/25.
//  Copyright © 2017年 深圳市多度科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSAttributedString (LHDHandleTools)

/**宽度固定*/
- (CGSize)returnSizeWithWidth:(CGFloat)width;
/**高度固定*/
- (CGSize)returnSizeWithHeight:(CGFloat)height;


@end
