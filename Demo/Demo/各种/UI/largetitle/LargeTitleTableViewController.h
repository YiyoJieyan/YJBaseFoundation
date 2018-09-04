//
//  LargeTitleTableViewController.h
//  Demo
//
//  Created by 邓钦武 on 2018/8/9.
//  Copyright © 2018年 demo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LargeTitleTableViewControllerDelegate <NSObject>

@optional

- (void)clickCellIndex:(NSInteger)index;

@end

@interface LargeTitleTableViewController : UITableViewController

@property (nonatomic, weak)id<LargeTitleTableViewControllerDelegate>delegate;

@end
