//
//  uiTestTableViewController.m
//  yjProject
//
//  Created by 邓钦武 on 2018/8/31.
//  Copyright © 2018年 YJProject. All rights reserved.
//

#import "uiTestTableViewController.h"
#import "LargeTitleTableViewController.h"
#import "StoreCollectionViewController.h"
#import "labelViewController.h"

@interface uiTestTableViewController ()

@property (nonatomic, strong) NSMutableArray *titleArr;

@end

@implementation uiTestTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.titleArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSDictionary *dict = self.titleArr[indexPath.row];
    [cell.textLabel setText:dict[@"name"]];
    // Configure the cell...
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary *dict = self.titleArr[indexPath.row];
    
    UIViewController *vc = dict[@"vc"];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (NSMutableArray *)titleArr {
    if (!_titleArr) {
        _titleArr = [NSMutableArray arrayWithArray:@[
                                                     @{
                                                         @"name":@"largetitle",
                                                         @"vc":[[LargeTitleTableViewController alloc]init]
                                                         },
                                                     @{
                                                         @"name":@"仿appStore",
                                                         @"vc":[[StoreCollectionViewController alloc]init]
                                                         },
                                                     @{
                                                         @"name":@"label边距",
                                                         @"vc":[[labelViewController alloc]init]
                                                         }
                                                     ]];
    }
    return _titleArr;
}

@end
