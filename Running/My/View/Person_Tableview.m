//
//  Person_Tableview.m
//  Running
//
//  Created by 吕志杰 on 2017/8/28.
//  Copyright © 2017年 吕志杰. All rights reserved.
//

#import "Person_Tableview.h"
#import "Person_TableViewCell.h"
#import "Person_top_View.h"

@implementation Person_Tableview

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if(self = [super initWithFrame:frame style:style])
    {
        [self registerNib:[UINib nibWithNibName:@"Person_TableViewCell" bundle:nil] forCellReuseIdentifier:@"person_cell"];
        self.delegate = self;
        self.dataSource = self;
        self.backgroundColor = [UIColor colorWithRed:250/255.0 green:250/255.0 blue:250/255.0 alpha:1.0];
        self.separatorColor = [UIColor clearColor];
        self.title_Array = [NSMutableArray arrayWithObjects:@[@"我的发布",@"我的订单",@"个人钱包"],@[@"消息中心",@"车主认证"],@[@"合伙人入口",@"一键分享",@"使用指南"],@[@"系统设置"], nil];
        self.image_Array = [NSMutableArray arrayWithObjects:@[@"发布",@"我的订单",@"个人中心 - 钱包"],@[@"消息中心",@"车主认证"],@[@"合伙人",@"分享",@"使用指南"],@[@"系统设置"], nil];
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0 || section == 2)
    {
        return 3;
    }else if (section == 1)
    {
        return 2;
    }else
    {
        return 1;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return section == 0 ? 130 : 8;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.0001;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    Person_top_View *view = [[[NSBundle mainBundle] loadNibNamed:@"Person_top_View" owner:self options:nil] lastObject];
    return section == 0 ? view : nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Person_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"person_cell" forIndexPath:indexPath];
    cell.title_lab.text = self.title_Array[indexPath.section][indexPath.row];
    cell.top_image.image = [UIImage imageNamed:self.image_Array[indexPath.section][indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.cell_block(indexPath.section,indexPath.row);
}

@end
