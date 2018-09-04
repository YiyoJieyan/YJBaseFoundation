//
//  NSString+Util.h
//  yjProject
//
//  Created by 邓钦武 on 2018/8/30.
//  Copyright © 2018年 YJProject. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Util)

/**
 返回内容高度(筛选\n)
 */
+(CGFloat)getHeightWithString:(NSString *)string width:(CGFloat)width size:(NSInteger)size isBold:(BOOL)isBold;
/**
 ASCII 编码
 */
+ (NSString *)getASCIIStr:(NSString *)content;
/**
 ASCII 解码
 */
+ (NSString *)decodeASCIIStr:(NSString *)content;


@end
