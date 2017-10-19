//
//  Run_Pay_Result_TableViewController.m
//  Running
//
//  Created by 吕志杰 on 2017/8/29.
//  Copyright © 2017年 吕志杰. All rights reserved.
//

#import "Run_Pay_Result_TableViewController.h"

@interface Run_Pay_Result_TableViewController ()
@property (weak, nonatomic) IBOutlet UIView *header_View;

@end

@implementation Run_Pay_Result_TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return section == 10 ? 45 : 0.0001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return section == 0 ? 10 : 0.0001;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIButton *order_btn_list = [UIButton new];
    [order_btn_list setTitle:@"* 您还可以在“我的订单”查看订单信息" forState:UIControlStateNormal];
    [order_btn_list setTitleColor:[UIColor colorWithRed:255/255.0 green:82/255.0 blue:0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [order_btn_list.titleLabel setFont:[UIFont systemFontOfSize:14.0]];
    [order_btn_list addTarget:self action:@selector(order_click) forControlEvents:UIControlEventTouchUpInside];
    return section == 10 ? order_btn_list : nil;
}

- (void)order_click
{
    PINGCHNAGSTORYBOARD(@"Main", @"ORDERID");
}

@end
