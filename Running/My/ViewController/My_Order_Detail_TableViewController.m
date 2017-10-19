//
//  My_Order_Detail_TableViewController.m
//  Running
//
//  Created by 吕志杰 on 2017/8/29.
//  Copyright © 2017年 吕志杰. All rights reserved.
//

#import "My_Order_Detail_TableViewController.h"

@interface My_Order_Detail_TableViewController ()

@end

@implementation My_Order_Detail_TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return section == 10 ? 10 : 0.0001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return section == 0 ? 10 : 0.0001;
}

@end
