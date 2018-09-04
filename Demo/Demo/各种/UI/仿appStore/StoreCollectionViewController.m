//
//  StoreCollectionViewController.m
//  Demo
//
//  Created by 邓钦武 on 2018/8/10.
//  Copyright © 2018年 demo. All rights reserved.
//

#import "StoreCollectionViewController.h"
#import "YJHeader.h"
#import "WRNavigationBar.h"
#import "StoreSubViewController.h"

@interface StoreCollectionViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong)UICollectionView *collectionView;

@property (nonatomic, strong)UICollectionViewFlowLayout *layout;

@property (nonatomic, assign)BOOL isHidding ;

@property (nonatomic, assign)NSInteger count;

@end
#warning https://github.com/YvanLiu/PushTransitionDemo 已实现
@implementation StoreCollectionViewController

- (UICollectionViewFlowLayout *)layout {
    if (!_layout) {
        _layout = [[UICollectionViewFlowLayout alloc]init];
        
        [_layout setItemSize:CGSizeMake((VIEWWIDTH - 60), (VIEWWIDTH - 60)*4/3 )];
        [_layout setScrollDirection:UICollectionViewScrollDirectionVertical];
        
        _layout.sectionInset = UIEdgeInsetsMake(30, 30, 30, 30);
        _layout.minimumLineSpacing = 30;
        _layout.minimumInteritemSpacing = 30;
    }
    return _layout;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:self.layout];
        [_collectionView setBackgroundColor:[UIColor whiteColor]];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"collection";
    self.count = 5;
    
    for (int i = 0; i < self.count; i++) {
        
        StoreSubViewController *vc = [[StoreSubViewController alloc]init];

//        [vc.view setBackgroundColor:[UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]];
        
//        [vc.view setBorderwithColor:[UIColor lightGrayColor] withWidth:10];
        
        [self addChildViewController:vc];
        
    }
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    [self.view addSubview:self.collectionView];
    
    [self.view setBackgroundColor:[UIColor redColor]];
//    [self setupScrollHideNavigationBar];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (@available(iOS 11.0, *))
    {
        [self.navigationController.navigationBar setPrefersLargeTitles:false];

    } else {
        // Fallback on earlier versions
    }
    
//    [self wr_setNavBarBackgroundAlpha:1];
//    // 设置导航栏按钮和标题颜色
    [self wr_setNavBarTintColor:[UIColor colorWithHexString:@"#91C7F7"]];
//
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
//    [self removeScrollHideNavigationBar];
    
}

#pragma mark - 上拉隐藏navigation bar
//- (void)setupScrollHideNavigationBar {
//    //    self.tableView.contentOffset
//    [self.collectionView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
//}
//
//- (void)removeScrollHideNavigationBar {
//    //remove
//    [self.collectionView removeObserver:self forKeyPath:@"contentOffset"];
//}

//#pragma mark KVO
//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
//    if ([object isEqual:self.collectionView] && [keyPath isEqualToString:@"contentOffset"]) {
//
//        CGFloat newY = [change[@"new"] CGPointValue].y;
//        CGFloat oldY = [change[@"old"] CGPointValue].y;
//        float i = newY - oldY;       //i>0上滑， i<0下滑
//        if (self.collectionView.contentOffset.y > -84 && self.collectionView.contentOffset.y <= 20) {//边界条件，此处不精确
//            if (i <=0 && _isHidding == NO && self.navigationController.navigationBar.frame.origin.y == 20) {    //下拉＋bar 已经显示的状态，不再移动
//                return;
//            }
//
//            _isHidding = NO;
//            self.navigationController.navigationBar.frame = CGRectMake(0, -64-self.collectionView.contentOffset.y, VIEWWIDTH, 64);
//
//        }else if (self.collectionView.contentOffset.y > 20) {
//
//            if (i > 10) {//更改数值大小可以控制触发 navigation bar 的滑动速度
//                _isHidding = YES;
//            }else if(i < -10) {
//                _isHidding = NO;
//            }else {
//
//            }
//        }
//        [self.navigationController setNavigationBarHidden:_isHidding animated:YES];
//    }
//}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
//    UIView *vcView = self.childViewControllers[indexPath.row].view;
//
//    [vcView setFrame:CGRectMake(0, 0, VIEWWIDTH, VIEWHEIGHT)];
//
//    [self.view addSubview:self.childViewControllers[indexPath.row].view];
    
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];

    [UIView animateWithDuration:0.1 animations:^{

        cell.bounds = self.view.bounds;

    } completion:^(BOOL finished) {

//        [UIView animateWithDuration:0.1 animations:^{
//
//            cell.transform = CGAffineTransformMakeScale(1.0, 1.0);
//
//        } completion:^(BOOL finished) {
//            //这里实现点击cell后要实现的内容
//
//
//
//        }];

    }];
    
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    
    [UIView animateWithDuration:0.2 animations:^{
        cell.transform = CGAffineTransformMakeScale(0.95, 0.95);
        
    } completion:^(BOOL finished) {
        
    }];
    
}

- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    
    [UIView animateWithDuration:0.2 animations:^{
        
        cell.transform = CGAffineTransformMakeScale(1.0, 1.0);
        
    } completion:^(BOOL finished) {
        //这里实现点击cell后要实现的内容
        
    }];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    [cell.contentView setBackgroundColor:[UIColor colorWithHexString:@"#91C7F7"]];
    
    UIView *view = self.childViewControllers[indexPath.row].view;
    
    [view setSize:cell.contentView.size];
    
    UIView *vcView = [[UIView alloc]initWithFrame:cell.bounds];
    
    vcView.layer.cornerRadius = 18;
    [vcView.layer setMasksToBounds:YES];
    
    [vcView addSubview:view];
    
    UIView *cover = [[UIView alloc]initWithFrame:cell.bounds];
    
    [cover setBackgroundColor:[UIColor clearColor]];
    
    [cell.contentView addSubview:vcView];
    [cell.contentView addSubview:cover];
    cell.contentView.layer.cornerRadius = 18;
    cell.contentView.layer.shadowColor= [UIColor blackColor].CGColor;
    cell.contentView.layer.shadowOffset=CGSizeMake(0, 0);
    cell.contentView.layer.shadowOpacity=0.2;
    cell.contentView.layer.shadowRadius= 15;
    [cell.contentView.layer setMasksToBounds:NO];
    
    return cell;
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
