//
//  WalletViewController.m
//  Running
//
//  Created by Admin on 2017/10/20.
//  Copyright © 2017年 吕志杰. All rights reserved.
//

#import "WalletViewController.h"

@interface WalletViewController ()<UITableViewDelegate,UITableViewDataSource,DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>
@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong) NSMutableArray *cellArr;
@property (nonatomic, strong) UIView *headerView;
@end

@implementation WalletViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableview];
}
-(void)chongzhi{
    
}
-(void)tixian{
    
}
#pragma mark - tableviewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
-(UITableView*)tableview{
    if(!_tableview){
        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-64) style:UITableViewStylePlain];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.emptyDataSetSource = self;
        _tableview.emptyDataSetDelegate = self;
        _tableview.tableHeaderView = self.headerView;
        _tableview.tableFooterView = [UIView new];
        _tableview.rowHeight = UITableViewAutomaticDimension;
    }
    return _tableview;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return self.cellArr.count;
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *tableCell = @"CellIdentifier";
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:tableCell];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                          reuseIdentifier:tableCell];
    }
    
    if (self.cellArr) {
        cell.textLabel.text = @"2017-10-10";
        cell.detailTextLabel.text = @"从****到*****跑腿";
        UILabel *label = [[UILabel alloc]init];
        label.text = @"+50";
        label.font = [UIFont systemFontOfSize:14];
        UIView *red = [UIView new];
        red.frame = CGRectMake(0, 0, 50, 50);
        [red addSubview:label];
        label.frame = CGRectMake(0, 0, 50, 50);
        cell.accessoryView = red;
         cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}
//-height

-(NSMutableArray*)cellArr{
    if(!_cellArr){
        _cellArr = [NSMutableArray array];
    }
    return _cellArr;
}



-(UIView*)headerView{
    if(!_headerView){
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 320)];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"wallet"]];
        [_headerView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(_headerView);
            make.width.height.mas_equalTo(120);
            make.top.mas_equalTo(_headerView).offset(20);
        }];
        
        UILabel *label = [[UILabel alloc]init];
        [_headerView addSubview:label];
        label.text = @"余额(元)每周五可提现";
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(_headerView);
            make.top.mas_equalTo(imageView.mas_bottom).offset(10);
        }];
        UILabel *priceLabel = [[UILabel alloc]init];
        [_headerView addSubview:priceLabel];
        priceLabel.tag = 1111;//价格btn的tag
        priceLabel.text = @"10000";
        priceLabel.font = [UIFont systemFontOfSize:20];
        priceLabel.textColor = [UIColor jk_colorWithHexString:@"#FF0077"];
        [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(_headerView);
            make.top.mas_equalTo(label.mas_bottom).offset(10);
        }];
        
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [btn setTitle:@"提现" forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor jk_colorWithHexString:@"#FF0077"]];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.layer.cornerRadius = 5;
        btn.layer.masksToBounds = YES;
        [_headerView addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(_headerView).multipliedBy(0.8);
            make.centerX.mas_equalTo(_headerView);
            make.top.mas_equalTo(priceLabel.mas_bottom).offset(20);
            make.height.mas_equalTo(50);
        }];
        [btn addTarget:self action:@selector(tixian) forControlEvents:UIControlEventTouchUpInside];
        
        UILabel *baozhengjin = [[UILabel alloc]init];
        [_headerView addSubview:baozhengjin];
        baozhengjin.text = @"保证金(未缴)";
        baozhengjin.textColor = [UIColor lightGrayColor];
        [baozhengjin mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(btn).offset(15);
            make.top.mas_equalTo(btn.mas_bottom).offset(10);
        }];
        
        
        UIButton *baozhengjinBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [baozhengjinBtn setTitle:@"立即充保证金200元" forState:UIControlStateNormal];
        [baozhengjinBtn setTitleColor:[UIColor jk_colorWithHexString:@"#FF0077"] forState:UIControlStateNormal];
        [_headerView addSubview:baozhengjinBtn];
        [baozhengjinBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(baozhengjin.mas_right).offset(10);
//            make.top.mas_equalTo(btn.mas_bottom).offset(10);
            make.centerY.mas_equalTo(baozhengjin);
        }];
        [baozhengjinBtn addTarget:self action:@selector(chongzhi) forControlEvents:UIControlEventTouchUpInside];
    }
    return _headerView;
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
