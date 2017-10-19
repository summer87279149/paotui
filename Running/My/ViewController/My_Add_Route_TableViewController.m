//
//  My_Add_Route_TableViewController.m
//  Running
//
//  Created by 吕志杰 on 2017/8/30.
//  Copyright © 2017年 吕志杰. All rights reserved.
//

#import "My_Add_Route_TableViewController.h"

@interface My_Add_Route_TableViewController ()
- (IBAction)ok_click:(id)sender;

@end

@implementation My_Add_Route_TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self add_tap];
}

- (void)add_tap
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap_click)];
    [self.view addGestureRecognizer:tap];
}

- (void)tap_click
{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 8;
}

- (IBAction)ok_click:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
