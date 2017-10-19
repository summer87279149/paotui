//
//  Go_Buy_TableViewController.m
//  Running
//
//  Created by 吕志杰 on 2017/8/31.
//  Copyright © 2017年 吕志杰. All rights reserved.
//

#import "Go_Buy_TableViewController.h"
#import "LunScrollerView.h"

@interface Go_Buy_TableViewController ()
@property (weak, nonatomic) IBOutlet UIView *header_view;
@property (nonatomic, strong) LunScrollerView *scrollView;

@end

@implementation Go_Buy_TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.scrollView = [[LunScrollerView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200) title_array:nil];
    [_header_view  addSubview:_scrollView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    return cell;
}

@end
