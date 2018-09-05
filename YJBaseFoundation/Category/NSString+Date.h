//
//  NSString+Date.h
//  Demo
//
//  Created by 邓钦武 on 2018/8/30.
//  Copyright © 2018年 demo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Date)

/**
 获取当前年月日
 */
+(NSString *)getTodayStrYMD;
/**
 获取当前年月日 星期
 */
+(NSString *)getTodayStrYMDWeek;
/**
 获取当前时间戳
 */
+ (NSInteger *)getNowTimestamp;
/**
 根据date获取年月日
 */
+(NSString *)ymdStrWithDate:(NSDate *)date;
/**
 根据date获取年月日 + 星期
 */
+(NSString *)ymdStrWeekWithDate:(NSDate *)date;

@end
