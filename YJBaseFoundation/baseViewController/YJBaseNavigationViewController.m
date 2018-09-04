//
//  YJBaseNavigationViewController.m
//  Demo
//
//  Created by 邓钦武 on 2018/8/6.
//  Copyright © 2018年 demo. All rights reserved.
//

#import "YJBaseNavigationViewController.h"

@interface YJBaseNavigationViewController ()

@end

@implementation YJBaseNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];//#8B4A4C
    
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
//    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]init];
//    
//    backItem.title = @"";
//    [viewController.navigationItem setBackBarButtonItem:backItem];
    if (self.childViewControllers.count != 0) {
        [viewController setHidesBottomBarWhenPushed:YES];
    }
    [super pushViewController:viewController animated:YES];
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
