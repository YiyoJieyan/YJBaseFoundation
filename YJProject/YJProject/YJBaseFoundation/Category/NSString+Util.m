//
//  NSString+Util.m
//  yjProject
//
//  Created by 邓钦武 on 2018/8/30.
//  Copyright © 2018年 YJProject. All rights reserved.
//

#import "NSString+Util.h"

@implementation NSString (Util)

//+(CGFloat)getHeightWithString:(NSString *)string width:(CGFloat)width size:(NSInteger)size isBold:(BOOL)isBold{
//    
//    if (!string || [string isKindOfClass:[NSNull class]] ) {
//        return 44;
//    }
//    NSDictionary *attri;
//    if (isBold) {
//        attri = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:size]};
//    }else{
//        attri = @{NSFontAttributeName: [UIFont systemFontOfSize:size]};
//    }
//    CGSize sizeToFit = [string boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:attri context:nil].size;
//    
//    int count = [self calculateSubStringCount:string subStrs:@"\n"];
//    
//    return sizeToFit.height + count * 17;
//    
//}

+ (int)calculateSubStringCount:(NSString *)str subStrs:(NSString *)subSt {
    
    int count = 0;
    
    NSRange range = [str rangeOfString:subSt];
    
    if (range.location == NSNotFound) {
        return count;
    }
    //声明一个临时字符串,记录截取之后的字符串
    NSString * subStr = str;
    
    while (range.location != NSNotFound) {
        //只要进入循环就要count++
        count++;
        //每次记录之后,把找到的字串截取掉
        //range.location + range.length 得出的结果就是我们要截取的字符串起始索引的位置
        subStr = [subStr substringFromIndex:range.location + range.length];
        NSLog(@"subStr %@",subStr);
        //每一次截取之后,要判断一些,截取完成剩余部分字符串,是否还有子串存在
        //如果存在,我们的while循环会继续运行,如果不存在while循环结束
        range = [subStr rangeOfString:str];
        
    }
    return count;
}

+ (NSString *)getASCIIStr:(NSString *)content {
    
    NSString *uniStr = [NSString stringWithUTF8String:[content UTF8String]];
    NSData *uniData = [uniStr dataUsingEncoding:NSNonLossyASCIIStringEncoding];
    NSString *asciiStr = [[NSString alloc] initWithData:uniData encoding:NSUTF8StringEncoding];
    
    return asciiStr;
}

+ (NSString *)decodeASCIIStr:(NSString *)content {
    
    if (!content) {
        return @"";
    }
    
    const char *jsonString = [content UTF8String];
    NSData *jsonData = [NSData dataWithBytes:jsonString length:strlen(jsonString)];
    NSString *str = [[NSString alloc] initWithData:jsonData encoding:NSNonLossyASCIIStringEncoding];
    
    return str;
}

@end
