//
//  NSString+Date.m
//  Demo
//
//  Created by 邓钦武 on 2018/8/30.
//  Copyright © 2018年 demo. All rights reserved.
//

#import "NSString+Date.h"

@implementation NSString (Date)

/**
 获取当前年月日
 */
+(NSString *)getTodayStrYMD
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    formatter.locale = [[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateTime = [formatter stringFromDate:[NSDate date]];
    return dateTime;
}

/**
 获取当前年月日 星期
 */
+(NSString *)getTodayStrYMDWeek
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd EEEE"];
    NSString *dateTime = [formatter stringFromDate:[NSDate date]];
    return dateTime;
}

+(NSString *)ymdStrWithDate:(NSDate *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.locale = [[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateTime = [formatter stringFromDate:date];
    return dateTime;
}

+(NSString *)ymdStrWeekWithDate:(NSDate *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.locale = [[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"];
    [formatter setDateFormat:@"yyyy-MM-dd EEEE"];
    NSString *dateTime = [formatter stringFromDate:date];
    return dateTime;
}

+ (NSInteger)getNowTimestamp {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    formatter.locale = [[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"];
    
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    NSDate *datenow = [NSDate date];//现在时间
    
    NSLog(@"设备当前的时间:%@",[formatter stringFromDate:datenow]);
    
    //时间转时间戳的方法:
    
    NSInteger timeSp = [[NSNumber numberWithDouble:[datenow timeIntervalSince1970]] integerValue];
    
//    NSLog(@"设备当前的时间戳:%ld",(long)timeSp); //时间戳的值
    
    return timeSp;
    
}

@end
