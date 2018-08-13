//
//  StoreSubViewController.m
//  Demo
//
//  Created by 邓钦武 on 2018/8/10.
//  Copyright © 2018年 demo. All rights reserved.
//

#import "StoreSubViewController.h"
#import "WRNavigationBar.h"

@interface StoreSubViewController ()

@property (nonatomic, strong)UIScrollView *scrollView;
@property (nonatomic, strong)UIView *topView;
@property (nonatomic, strong)UIImageView *coverImage;
@property (nonatomic, strong)UIView *titleView;

@end

@implementation StoreSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self.view addSubview:self.scrollView];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(VIEWWIDTH - 60, 64, 40, 40)];
    [btn setTitle:@"X" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.5]];
    [btn setRadius:20];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(dissmiss:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
    [self.scrollView addSubview:self.topView];
    
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.scrollView);
        make.left.mas_equalTo(self.view);
        make.width.mas_equalTo(VIEWWIDTH);
        make.height.mas_equalTo((VIEWWIDTH - 60)*4/3);
    }];
    
    [self.coverImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.topView);
        make.left.mas_equalTo(self.topView);
        make.right.mas_equalTo(self.topView);
        make.height.mas_equalTo((VIEWWIDTH - 60)*4/3);
    }];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
//    self.navigationController.navigationBarHidden = YES;
    [self wr_setNavBarBackgroundAlpha:0];
    // 设置导航栏按钮和标题颜色
    [self wr_setNavBarTintColor:[UIColor whiteColor]];
    if (@available(iOS 11.0, *))
    {
        [self.navigationController.navigationBar setPrefersLargeTitles:false];
        
    } else {
        // Fallback on earlier versions
    }
//    // 设置导航栏按钮和标题颜色
//    [self wr_setNavBarTintColor:[UIColor colorWithHexString:@"#91C7F7"]];
    //
}

- (void)dissmiss:(UIButton *)btn {
    [btn.superview removeFromSuperview];
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, VIEWWIDTH, VIEWHEIGHT)];
        [_scrollView setContentSize:CGSizeMake(0, VIEWHEIGHT * 2)];
    }
    return _scrollView;
}

- (UIView *)topView {
    if (!_topView) {
        _topView = [UIView new];
        [_topView addSubview:self.coverImage];
        
    }
    return _topView;
}

- (UIImageView *)coverImage {
    if (!_coverImage) {
        _coverImage = [[UIImageView alloc]init];
        [_coverImage setImage:[UIImage imageNamed:@"cover2"]];
        _coverImage.contentMode = UIViewContentModeScaleAspectFill;
        [_coverImage setBorderwithColor:[UIColor clearColor] withWidth:.1];
    }
    return _coverImage;
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
