//
//  YJHTTPTool.m
//  Demo
//
//  Created by 邓钦武 on 2018/8/6.
//  Copyright © 2018年 demo. All rights reserved.
//

#import "YJHTTPTool.h"
#import "YJTools.h"

@implementation YJHTTPTool

+ (instancetype)sharedClient {
    
    static YJHTTPTool *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[YJHTTPTool alloc]initWithBaseURL:[NSURL URLWithString:@"https://test-ayapi.aiyoubaobei.com/ayapi"]];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        _sharedClient.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript", nil];
    });
    return _sharedClient;
    
}

+ (NSURLSessionDataTask *)postWithUrl:(NSString *)url Parameter:(NSDictionary *)parm isShowLoading:(BOOL)isShowLoading block:(void(^)(id _Nullable result ,NSError *error))callback {
    
    if (isShowLoading) {
        [YJTools showLoading];
    }
    
    NSURLSessionDataTask *task;
    
    task = [[YJHTTPTool sharedClient]POST:url parameters:parm progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
        if (isShowLoading) {
            [YJTools hideLoading];
        }
        NSNumber *code = responseObject[@"result_code"];
        
        if (code.integerValue == 1000) {
            
            if (callback) {
                callback(responseObject[@"result"],nil);
            }
            
        }else {
            
            NSError *error = [NSError errorWithDomain:responseObject[@"result_msg"] code:code.integerValue userInfo:@{@"errorMsg":responseObject[@"result_msg"]}];
            
            if (callback) {
                callback(nil,error);
            }
            
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (isShowLoading) {
            [YJTools hideLoading];
        }
        
        if (callback) {
            callback(nil,error);
        }
        
    }];
    
    return task;
}



@end
