//
//  UIView+Style.h
//
//  Created by 陈伟强 on 15/11/20.
//

#import <UIKit/UIKit.h>

@interface UIView (Style)
/**设置圆角边框*/
-(void)setBorderwithColor:(UIColor *)color withWidth:(CGFloat)width withRadius:(CGFloat)radius;
/**设置圆角*/
-(void)setRadius:(CGFloat)radius;

/**设置边框*/
-(void)setBorderwithColor:(UIColor *)color withWidth:(CGFloat)width;
@end
