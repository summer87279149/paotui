//
//  My_Set_TableViewController.m
//  Running
//
//  Created by 吕志杰 on 2017/8/30.
//  Copyright © 2017年 吕志杰. All rights reserved.
//

#import "My_Set_TableViewController.h"

@interface My_Set_TableViewController ()

@end

@implementation My_Set_TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 100;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.0001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 8;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0 &&indexPath.row == 0)
    {
        PINGCHNAGSTORYBOARD(@"Main", @"OFTENID");
    }else if (indexPath.section == 0 &&indexPath.row == 1)
    {
         PINGCHNAGSTORYBOARD(@"Main", @"ROUTEID");
    }
}

@end
