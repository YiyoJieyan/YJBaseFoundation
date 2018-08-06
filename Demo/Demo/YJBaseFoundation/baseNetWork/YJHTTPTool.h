//
//  YJHTTPTool.h
//  Demo
//
//  Created by 邓钦武 on 2018/8/6.
//  Copyright © 2018年 demo. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface YJHTTPTool : AFHTTPSessionManager

+ (NSURLSessionDataTask *)postWithUrl:(NSString *)url Parameter:(NSDictionary *)parm isShowLoading:(BOOL)isShowLoading block:(void(^)(NSDictionary *result ,NSError *error))callback;

@end
