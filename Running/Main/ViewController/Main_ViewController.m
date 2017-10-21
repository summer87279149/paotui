//
//  Main_ViewController.m
//  Running
//
//  Created by 吕志杰 on 2017/8/24.
//  Copyright © 2017年 吕志杰. All rights reserved.
//
#import "XTMapViewController.h"
#import "HeHuoRenViewController.h"
#import "WalletViewController.h"
#import "Main_ViewController.h"
#import "Main_Scroller_view.h"
#import "Top_view.h"
#import "Search_View.h"
#import "Person_Tableview.h"
#import "My_Order_ViewController.h"
#import "My_Set_TableViewController.h"

@interface Main_ViewController ()
{
    BOOL isShow;
};
@property (strong, nonatomic) UIView *style_view;//乘客／车主
//@property (strong ,nonatomic)Main_Scroller_view *main_view;
- (IBAction)person_click:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *main_view;

@property (weak, nonatomic) IBOutlet UIView *daohangBtn;
@property (weak, nonatomic) IBOutlet UILabel *startAddress;
@property (weak, nonatomic) IBOutlet UILabel *endAddress;
@property (weak, nonatomic) IBOutlet UIButton *startBtn;
@property (weak, nonatomic) IBOutlet UIButton *endBtn;
@property (weak, nonatomic) IBOutlet UIView *navView;





@property (strong ,nonatomic)Top_view *topview;
@property (strong ,nonatomic)Search_View *searchiew;
@property (nonatomic, strong) Label_Text_view *movingTextView;
@property (strong,nonatomic) Person_Tableview *persontableview;
@property (strong ,nonatomic)UIView *back_View;
@end

@implementation Main_ViewController

- (IBAction)start:(UIButton *)sender {
    XTMapViewController *vc = [[XTMapViewController alloc]init];
    vc.callback = ^(NSDictionary *dic) {
        //拿到回调的数据  经纬度和name的字典
        NSLog(@"拿到回调的数据  经纬度和name的字典,%@",dic);
        self.startAddress.text = dic[@"name"];
       
    };
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (IBAction)end:(UIButton *)sender {
    XTMapViewController *vc = [[XTMapViewController alloc]init];
    vc.callback = ^(NSDictionary *dic) {
        //拿到回调的数据  经纬度和name的字典
        NSLog(@"拿到回调的数据  经纬度和name的字典,%@",dic);
        self.endAddress.text = dic[@"name"];
    };
    [self.navigationController pushViewController:vc animated:YES];
    
}



- (Person_Tableview *)persontableview
{
    if(!_persontableview)
    {
        _persontableview = [[Person_Tableview alloc] initWithFrame:CGRectMake(-kSCREENWIDTH, 0, kSCREENWIDTH, kSCREENHEIGHT) style:UITableViewStyleGrouped];
    }
    return _persontableview;
}

- (UIView *)back_View
{
    if(!_back_View)
    {
        _back_View = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kSCREENWIDTH, kSCREENHEIGHT)];
        _back_View.backgroundColor = [UIColor blackColor];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap_click)];
        [_back_View addGestureRecognizer:tap];
        _back_View.alpha = 0.7;
    }
    return _back_View;
}

- (Top_view *)topview
{
    if(!_topview)
    {
        _topview = [[[NSBundle mainBundle] loadNibNamed:@"Top_View" owner:self options:nil] lastObject];
        _topview.frame = CGRectMake(0, 64, kSCREENWIDTH, 60);
    }
    return _topview;
}

- (Search_View *)searchiew
{
    if(!_searchiew)
    {
        _searchiew = [[[NSBundle mainBundle] loadNibNamed:@"Search_View" owner:self options:nil] lastObject];
        _searchiew.frame = CGRectMake(0, 64+60+10, kSCREENWIDTH, 60);
    }
    return _searchiew;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    isShow = YES;
// _main_view = [[Main_Scroller_view alloc] initWithFrame:self.lun_view.bounds arr:[NSMutableArray arrayWithObjects:@"相比于硅谷的科技巨头，来自中国的阿里巴",@"美国市场研究公司MKM Partners对阿里巴巴股价预期上调25%，并认为阿里是“所有高市值公司中基本面最好的”。",@"MKM提高阿里巴巴估价25%",@"gh我们一直以来都把阿里巴巴列在高市值", nil]];
   // [self.lun_view addSubview:_main_view];
    
    UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"个人中心"] style:UIBarButtonItemStylePlain target:self action:@selector(person_click:)];
    self.navigationItem.leftBarButtonItem = item;
    [self.main_view addSubview:self.mapView];
    [self.view addSubview:self.topview];
    _movingTextView = [Label_Text_view new];
    _movingTextView.frame = self.topview.gun_view.bounds;
    _movingTextView.movingText = @"预定了拼车，从南京新街口到扬州市广陵区东区大润发";
    [self.topview.gun_view addSubview:_movingTextView];
    [self.view addSubview:self.searchiew];
    [[[UIApplication sharedApplication].windows firstObject] addSubview:self.back_View];
    [self.back_View setHidden:YES];
    [[[UIApplication sharedApplication].windows firstObject] addSubview:self.persontableview];
    [self add_block];
    [self.main_view bringSubviewToFront:self.daohangBtn];
    [self.main_view bringSubviewToFront:self.navView];
//    self.
    UITapGestureRecognizer*tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(daohangBtnClick)];
    [self.daohangBtn addGestureRecognizer:tap];
}
-(void)daohangBtnClick{
    self.navView.hidden = !self.navView.hidden;
}
- (void)add_block
{
    __weak typeof(self)weakself = self;
    self.persontableview.cell_block = ^(NSInteger section_index, NSInteger row_index) {
        [weakself add_tap_click];
        if(section_index == 0 && row_index == 1)//我的订单
        {
            [weakself share_VC:[My_Order_ViewController new] story_name:@"Main" story_id:@"ORDERID"];
        }else if (section_index == 3 && row_index == 0)//系统设置
        {
            [weakself share_VC:[My_Set_TableViewController new] story_name:@"Main" story_id:@"SETID"];
        }else if (section_index == 0 && row_index == 2)//钱包
        {
            WalletViewController *vc = [[WalletViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (section_index == 2 && row_index == 0)//钱包
        {
            HeHuoRenViewController *vc = [[HeHuoRenViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
        
        
        
        
        
        
        
        
        
        
    };
}

- (void)share_VC:(UIViewController *)VC story_name:(NSString *)story_name story_id:(NSString *)story_id
{
    VC = [[UIStoryboard storyboardWithName:story_name bundle:nil] instantiateViewControllerWithIdentifier:story_id];
    VC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:VC animated:YES];
}

-(void)tap_click
{
    [self add_tap_click];
}

- (void)add_tap_click
{
    [UIView animateWithDuration:0.8 animations:^{
        self.persontableview.transform = CGAffineTransformMakeTranslation( -(kSCREENWIDTH-90), 0);
    } completion:^(BOOL finished) {
        self.back_View.hidden = YES;
        isShow = YES;
    }];
}

- (IBAction)mess_click:(id)sender {
}
- (IBAction)bottom_click:(id)sender {
}
- (IBAction)person_click:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        self.persontableview.transform = CGAffineTransformMakeTranslation(isShow == YES  ?kSCREENWIDTH-90 : -(kSCREENWIDTH-90), 0);
        self.back_View.hidden = isShow == YES  ? NO : YES;
        isShow = isShow == YES ? NO : YES;
    } completion:^(BOOL finished) {
    }];
}
@end
