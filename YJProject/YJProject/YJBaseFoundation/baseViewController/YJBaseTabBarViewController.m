//
//  YJBaseTabBarViewController.m
//  Demo
//
//  Created by 邓钦武 on 2018/8/6.
//  Copyright © 2018年 demo. All rights reserved.
//

#import "YJBaseTabBarViewController.h"
#import "YJBaseNavigationViewController.h"
#import "YJHomeTableViewController.h"

@interface YJBaseTabBarViewController ()

@end

@implementation YJBaseTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    YJHomeTableViewController *home = [[YJHomeTableViewController alloc]init];
    [home setTitle:@"啧"];
    [self setChildViewController:home withImageName:@"tab_icon_home" withSelectedImageName:@"tab_icon_home" withTitle:@"啧"];
    
}

-(void)setChildViewController:(UIViewController *)childViewController withImageName:(NSString *)imageName withSelectedImageName:(NSString *)selectedImageName withTitle:(NSString *)title
{
    //设置标题
    //    childViewController.title = title;
    childViewController.tabBarItem.title = title;
    
    //设置图片
    childViewController.tabBarItem.image = [UIImage imageNamed:imageName];
    childViewController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName]imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    
    //添加导航栏
    YJBaseNavigationViewController *nav = [[YJBaseNavigationViewController alloc]initWithRootViewController:childViewController];
    [self addChildViewController:nav];
    
    //RECT(VIEWWIDTH - 55,VIEWHEIGHT - 64 - 64,50, 50)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
