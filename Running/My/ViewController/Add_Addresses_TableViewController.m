//
//  Add_Addresses_TableViewController.m
//  Running
//
//  Created by 吕志杰 on 2017/8/30.
//  Copyright © 2017年 吕志杰. All rights reserved.
//

#import "Add_Addresses_TableViewController.h"

@interface Add_Addresses_TableViewController ()
- (IBAction)finish_click:(id)sender;

@end

@implementation Add_Addresses_TableViewController

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

- (IBAction)finish_click:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
