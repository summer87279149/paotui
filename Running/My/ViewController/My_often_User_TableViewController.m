//
//  My_often_User_TableViewController.m
//  Running
//
//  Created by 吕志杰 on 2017/8/30.
//  Copyright © 2017年 吕志杰. All rights reserved.
//

#import "My_often_User_TableViewController.h"
#import "My_Often_TableViewCell.h"

@interface My_often_User_TableViewController ()
- (IBAction)add_click:(id)sender;

@end

@implementation My_often_User_TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 100;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 8;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    My_Often_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"often_cell" forIndexPath:indexPath];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return section == 9 ? 20 : 0.0001;
}

- (IBAction)add_click:(id)sender {
    PINGCHNAGSTORYBOARD(@"Main", @"ADDID");
}
@end
