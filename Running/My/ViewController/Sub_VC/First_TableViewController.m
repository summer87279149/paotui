//
//  First_TableViewController.m
//  Running
//
//  Created by 吕志杰 on 2017/8/29.
//  Copyright © 2017年 吕志杰. All rights reserved.
//

#import "First_TableViewController.h"
#import "Run_Pay_Result_TableViewController.h"

@interface First_TableViewController ()

@end

@implementation First_TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    My_Order_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PINGCHNAGSTORYBOARD(@"Main", @"ORDERDETAILID");
}

@end
