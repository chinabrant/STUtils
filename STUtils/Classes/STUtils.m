//
//  STUtils.m
//  STUtils
//
//  Created by sjwu on 16/9/7.
//  Copyright © 2016年 brant. All rights reserved.
//

#import "STUtils.h"

@implementation STUtils

/**
 *  计算字符串的高度
 *
 *  @param text     要计算高度的字符串
 *  @param width    最大宽度
 *  @param fontSize 字体大小
 *
 *  @return 计算好的高度
 */
+ (CGFloat)textHeight:(NSString *)text limitWidth:(CGFloat)width fontSize:(int)fontSize {
    return [text boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName : [UIFont systemFontOfSize:fontSize] } context:nil].size.height;
}

/**
 *  计算字符串的宽度
 *
 *  @param text     要计算宽度的字符串
 *  @param width    最大高度
 *  @param fontSize 字体大小
 *
 *  @return 计算好的高度
 */
+ (CGFloat)textWidth:(NSString *)text limitHeight:(CGFloat)height fontSize:(int)fontSize {
    return [text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName : [UIFont systemFontOfSize:fontSize] } context:nil].size.width;
}

@end