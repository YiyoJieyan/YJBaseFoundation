//
//  YJTools.m
//  Demo
//
//  Created by 邓钦武 on 2018/8/7.
//  Copyright © 2018年 demo. All rights reserved.
//

#import "YJTools.h"
#import <SVProgressHUD/SVProgressHUD.h>

#define VIEWWIDTH               [UIScreen mainScreen].bounds.size.width
#define VIEWHEIGHT              [UIScreen mainScreen].bounds.size.height

@implementation YJTools

+ (void)showMessage:(NSString *)msg {
    
    [SVProgressHUD showImage:[UIImage imageNamed:@""] status:msg];
    [SVProgressHUD setMinimumSize:CGSizeMake(160, 90)];
    [SVProgressHUD setBackgroundColor:[[UIColor blackColor]colorWithAlphaComponent:0.5f]];
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    [SVProgressHUD setCornerRadius:8];
    [self hideSVP];
    
}

+ (void)showLoading {
    
    [SVProgressHUD setMinimumSize:CGSizeMake(90, 90)];
    [SVProgressHUD setBackgroundColor:[[UIColor blackColor]colorWithAlphaComponent:0.5f]];
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    [SVProgressHUD setCornerRadius:8];
    [SVProgressHUD show];
    
}

+ (void)hideLoading {
    [SVProgressHUD dismiss];
}

+ (void)hideSVP {
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        sleep(2.5);
        dispatch_async(dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
    });
}
@end
