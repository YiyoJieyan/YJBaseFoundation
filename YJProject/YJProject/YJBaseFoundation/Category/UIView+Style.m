//
//  UIView+Style.m
//
//  Created by 陈伟强 on 15/11/20.
//

#import "UIView+Style.h"

@implementation UIView (Style)

-(void)setBorderwithColor:(UIColor *)color withWidth:(CGFloat)width withRadius:(CGFloat)radius
{
    self.layer.borderColor = [color CGColor];
    self.layer.borderWidth = width;
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
}

-(void)setRadius:(CGFloat)radius
{
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
}

-(void)setBorderwithColor:(UIColor *)color withWidth:(CGFloat)width
{
    self.layer.borderColor = [color CGColor];
    self.layer.borderWidth = width;
    self.layer.masksToBounds = YES;
}

@end
