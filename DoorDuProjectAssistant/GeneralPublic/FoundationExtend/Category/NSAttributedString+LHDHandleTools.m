//
//  NSAttributedString+LHDHandleTools.m
//  DoorDuProjectAssistant
//
//  Created by 刘和东 on 2017/4/25.
//  Copyright © 2017年 深圳市多度科技有限公司. All rights reserved.
//

#import "NSAttributedString+LHDHandleTools.h"
#include <CoreText/CoreText.h>

@implementation NSAttributedString (LHDHandleTools)

/**宽度固定*/
- (CGSize)returnSizeWithWidth:(CGFloat)width
{
    CGSize targetSize = CGSizeMake(width, CGFLOAT_MAX);
//    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)self);
//    CGSize size = CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRangeMake(0, (CFIndex)[self length]), NULL, targetSize, NULL);
//    CFRelease(framesetter);
//    return size;
    return [self boundingRectWithSize:targetSize options:NSStringDrawingUsesLineFragmentOrigin context:nil].size;
}
/**高度固定*/
- (CGSize)returnSizeWithHeight:(CGFloat)height
{
    CGSize targetSize = CGSizeMake(CGFLOAT_MAX,  height);
//    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)self);
//    CGSize size = CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRangeMake(0, (CFIndex)[self length]), NULL, targetSize, NULL);
//    CFRelease(framesetter);
    //    return size;
    return [self boundingRectWithSize:targetSize options:NSStringDrawingUsesLineFragmentOrigin context:nil].size;
}

@end
