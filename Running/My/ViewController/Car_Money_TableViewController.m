//
//  Car_Money_TableViewController.m
//  Running
//
//  Created by 吕志杰 on 2017/8/30.
//  Copyright © 2017年 吕志杰. All rights reserved.
//

#import "Car_Money_TableViewController.h"
#import "Car__Money_TableViewCell.h"

@interface Car_Money_TableViewController ()

@end

@implementation Car_Money_TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 134;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.0001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Car__Money_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"car_cell" forIndexPath:indexPath];
    
    return cell;
}

@end
