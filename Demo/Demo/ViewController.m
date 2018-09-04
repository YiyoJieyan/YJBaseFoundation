//
//  ViewController.m
//  Demo
//
//  Created by 邓钦武 on 2018/8/6.
//  Copyright © 2018年 demo. All rights reserved.
//

#import "ViewController.h"
#import "YJHeader.h"
#import "LargeTitleTableViewController.h"
#import "StoreCollectionViewController.h"
#import "StoreSubViewController.h"
#import "lockTableViewController.h"
#import "uiTestTableViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,LargeTitleTableViewControllerDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableview;

@property (nonatomic, strong)NSArray *array;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    [self.tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];

    self.title = @"XJB";
   
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //设置Large Title偏好设置为True
    if (@available(iOS 11.0, *))
    {
        [self.navigationController.navigationBar setPrefersLargeTitles:true];
        
    } else {
        // Fallback on earlier versions
        
    }
}

- (void)clickCellIndex:(NSInteger)index {
    
    UITableViewCell *cell = [self.tableview cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    
    [cell.textLabel setText:[NSString stringWithFormat:@"选择了 %zd 行",index]];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary *dc = self.array[indexPath.row];
    
    
    
    if (indexPath.row == 0) {
        
        LargeTitleTableViewController *vc = [[LargeTitleTableViewController alloc]init];
        vc.delegate = self;
        [self.navigationController pushViewController:vc animated:YES];
        
    }else {
        
        UIViewController *vc;
        vc.title = dc[@"title"];
        vc = dc[@"vc"];
        [self.navigationController pushViewController:vc animated:YES];
        
    }
    
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    [cell.textLabel setText:self.array[indexPath.row][@"title"]];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
}

- (NSArray *)array {
    if (!_array) {
        _array = @[@{@"title":@"代理",@"vc":@""},@{@"title":@"UI",@"vc":[[uiTestTableViewController alloc]init]},@{@"title":@"锁",@"vc":[[lockTableViewController alloc]init]}];
    }
    return _array;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
