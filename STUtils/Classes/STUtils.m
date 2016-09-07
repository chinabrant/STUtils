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

/**
 * 计算时间撮
 */
+ (NSString *)formatDate:(NSDate *)date {
    
    NSDate *now = [NSDate date];
    NSTimeInterval t1 = [now timeIntervalSinceReferenceDate];
    NSTimeInterval t2 = [date timeIntervalSinceReferenceDate];
    NSTimeInterval t = [[NSTimeZone defaultTimeZone] secondsFromGMT];
    NSInteger d1 = (t1 + t) / (24 * 60 * 60);
    NSInteger d2 = (t2 + t) / (24 * 60 * 60);
    NSInteger days = d2 - d1;
    if (fabs(t1 - t2) < 60)
    {
        return @"刚刚";
    }
    switch (days)
    {
        case -2: return @"前天";
        case -1: return @"昨天";
        case 0: {
            int hour = (int)((t1  - t2)/3600);
            if(hour == 0)
                return [[@((int)MAX((t1 - t2) / 60, 1)) stringValue] stringByAppendingString:@"分钟前"];
            else
                return [[@(hour) stringValue] stringByAppendingString:@"小时前"];
        }
    }
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    return [formatter stringForObjectValue:date];
}

@end
