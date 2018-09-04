//
//  UIView+Metrics.h
//  TXZS_Communication
//
//  Created by 陈伟强 on 15-11-18.
//  Copyright (c) 2015年 广州卓训网络科技有限公司 All rights reserved.
//

#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)

@interface UIView (Metrics)

@property (assign, nonatomic) CGFloat top;
@property (assign, nonatomic) CGFloat bottom;
@property (assign, nonatomic) CGFloat left;
@property (assign, nonatomic) CGFloat right;

@property (assign, nonatomic) CGPoint offset;
@property (assign, nonatomic) CGPoint position;

@property (assign, nonatomic) CGFloat x;
@property (assign, nonatomic) CGFloat y;
@property (assign, nonatomic) CGFloat w;
@property (assign, nonatomic) CGFloat h;

@property (assign, nonatomic) CGFloat width;
@property (assign, nonatomic) CGFloat height;
@property (assign, nonatomic) CGSize size;

@property (assign, nonatomic) CGFloat centerX;
@property (assign, nonatomic) CGFloat centerY;
@property (assign, nonatomic) CGPoint origin;
@property (readonly, nonatomic) CGPoint	boundsCenter;

@end

#endif
