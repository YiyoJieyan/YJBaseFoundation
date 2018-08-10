//
//  LargeTitleTableViewController.m
//  Demo
//
//  Created by 邓钦武 on 2018/8/9.
//  Copyright © 2018年 demo. All rights reserved.
//

#import "LargeTitleTableViewController.h"

@interface LargeTitleTableViewController ()

@property (nonatomic, strong)UIRefreshControl *refreshC;

@end

@implementation LargeTitleTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"largeTitle";
    
    self.tableView.refreshControl = self.refreshC;
//    //设置Large Title偏好设置为True
//    if (@available(iOS 11.0, *))
//    {
//        [self.navigationController.navigationBar setPrefersLargeTitles:true];
//        
//    } else {
//        // Fallback on earlier versions
//    }
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //设置Large Title偏好设置为false
//    if (@available(iOS 11.0, *))
//    {
//        [self.navigationController.navigationBar setPrefersLargeTitles:false];
//
//    } else {
//        // Fallback on earlier versions
//
//    }
    
}

- (void)doSome {
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

- (UIRefreshControl *)refreshC {
    if (!_refreshC) {
        _refreshC = [[UIRefreshControl alloc]init];
        [_refreshC addTarget:self action:@selector(doSome) forControlEvents:UIControlEventValueChanged];
    }
    return _refreshC;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

@end
