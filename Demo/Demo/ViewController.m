//
//  ViewController.m
//  Demo
//
//  Created by 邓钦武 on 2018/8/6.
//  Copyright © 2018年 demo. All rights reserved.
//

#import "ViewController.h"
#import "YJHTTPTool.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UITextView *tv;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)click:(id)sender {
    //
    /**
     "ay_parent_info_id" = 256729028674988f6df;
     pageNum = 0;
     productCategory = 1;
     token = fd085eae91e6440bae9ff43fd4233f47;
     */
    NSDictionary *parm = @{
                           @"ay_parent_info_id" : @"255729028674988f6df",
                           @"pageNum" : @"0",
                           @"productCategory" : @"1",
                           @"token" : @"fd085eae91e6440bae9ff43fd4233f47"
                           };
    
    [YJHTTPTool postWithUrl:@"shop/GoodsController/getGoodsListByCategory" Parameter:parm isShowLoading:NO block:^(id  _Nullable result, NSError *error) {
        if (!error) {
            
//            [self.tv setText:result];
            NSLog(@"%@",result);
            
        }else {
            
            NSError *errors = error;
            
            NSLog(@"%zd\n",errors.code);
            NSLog(@"%@",error.domain);
            
        }
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
