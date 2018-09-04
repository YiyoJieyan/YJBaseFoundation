//
//  LargeTitleTableViewController.m
//  Demo
//
//  Created by 邓钦武 on 2018/8/9.
//  Copyright © 2018年 demo. All rights reserved.
//

#import "LargeTitleTableViewController.h"
#import "testDelegate.h"
#import "NSString+Date.h"

@interface LargeTitleTableViewController ()<testDelegate>

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
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
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

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 4;
}

- (UIRefreshControl *)refreshC {
    if (!_refreshC) {
        _refreshC = [[UIRefreshControl alloc]init];
        [_refreshC addTarget:self action:@selector(doSome) forControlEvents:UIControlEventValueChanged];
    }
    return _refreshC;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    [cell.textLabel setText:[NSString stringWithFormat:@"%zd",indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    NSLog(@"%@ --- %ld",[NSString getTodayStrYMD],[NSString getNowTimestamp]);
    
    NSLog(@"%d",[self calculateSubStringCount:@"/n"]);
    
    if ([self.delegate respondsToSelector:@selector(clickCellIndex:)]) {
        [self.delegate clickCellIndex:indexPath.row];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (int)calculateSubStringCount:(NSString *)str

{
    
    ////@"abcd123abcdrgabc"
    
    //@"abc"
    
    int count = 0;
    
    NSRange range = [@"alskdjlasdjlaksjdlakdjalskdjaslkdjaslkdjasd /n qoiwueoiuoiskajhhaksjdhakjsdhakjdh/n aosiuoieuuiqyekjhkdjhfksjdhfkjhjkh /n" rangeOfString:@"/n"];
    
    if (range.location == NSNotFound)
        
    {
        
        return count;
        
    }
    
    //声明一个临时字符串,记录截取之后的字符串
    
    NSString * subStr = @"alskdjlasdjlaksjdlakdjalskdjaslkdjaslkdjasd /n qoiwueoiuoiskajhhaksjdhakjsdhakjdh/n aosiuoieuuiqyekjhkdjhfksjdhfkjhjkh /n";
    
    while (range.location != NSNotFound) {
        
        //只要进入循环就要count++
        
        count++;
        
        //每次记录之后,把找到的字串截取掉
        
        //range.location + range.length 得出的结果就是我们要截取的字符串起始索引的位置
        
        subStr = [subStr substringFromIndex:range.location + range.length];
        
        
        
        NSLog(@"subStr %@",subStr);
        
        //每一次截取之后,要判断一些,截取完成剩余部分字符串,是否还有子串存在
        
        //如果存在,我们的while循环会继续运行,如果不存在while循环结束
        
        range = [subStr rangeOfString:str];
        
        
        
        NSLog(@"rang %@",NSStringFromRange(range));
        
        NSLog(@"location=%lu",range.location);
        
        
        
    }
    
    return count;
    
}

- (void)vcConnect {
    
    NSLog(@"协议执行...");
    
}



@end
