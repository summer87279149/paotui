//
//  Go_ViewController.m
//  Running
//
//  Created by 吕志杰 on 2017/8/30.
//  Copyright © 2017年 吕志杰. All rights reserved.
//

#import "Go_ViewController.h"
#import "Run_Detail_View.h"
#import "Say_ViewController.h"
#import "Run_Pay_Result_TableViewController.h"
#import "Go_Buy_TableViewController.h"

@interface Go_ViewController ()
{
    BOOL isKuai;
    BOOL isPing;
}
@property (strong ,nonatomic) Run_Detail_View *run_view;
@property (strong ,nonatomic) UIButton *start_btn;
@property (weak, nonatomic) IBOutlet UIView *main_view;
@property (strong ,nonatomic) UIButton *first_btn;
@property (strong ,nonatomic) UIButton *second_btn;
@property (strong ,nonatomic) Go_Buy_TableViewController *buy_VC;
@end

@implementation Go_ViewController

- (Go_Buy_TableViewController *)buy_VC
{
    if(!_buy_VC)
    {
        _buy_VC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"BUYID"];;
        _buy_VC.view.frame = CGRectMake(0, 104, kSCREENWIDTH, kSCREENHEIGHT-104-49);
    }
    return _buy_VC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    isKuai = isPing = YES;
    self.main_view.clipsToBounds = YES;
    [self.view addSubview:self.run_view];
    [self.view addSubview:self.start_btn];
    [self add_tap];
    [self add_run_view_block];
    __weak typeof(self)weakself = self;
    self.run_view.say_block = ^{
        //NOXUNHUANSTORYBOARD(@"Main", @"SAYID");
        Say_ViewController *say_VC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SAYID"];
        say_VC.result_block = ^(NSString *str) {
            weakself.run_view.main_textview.text = str;
        };
        [weakself.navigationController pushViewController: say_VC animated:YES];
    };
    [self add_btn];
    [self.view addSubview:self.buy_VC.view];
    [self.buy_VC.view setHidden:YES];
}

- (void)add_btn
{
    _first_btn = [[UIButton alloc] initWithFrame:CGRectMake(16, 64, kSCREENWIDTH/2-16, 38)];
    [_first_btn setTitle:@"帮我送" forState:UIControlStateNormal];
    [_first_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _first_btn.layer.borderColor = [UIColor whiteColor].CGColor;
    [_first_btn setBackgroundColor:[UIColor colorWithRed:255/255.0 green:0/255.0 blue:110/255.0 alpha:1.0]];
    _first_btn.layer.borderWidth = 1.0;
    [_first_btn.titleLabel setFont:[UIFont systemFontOfSize:14.0]];
    [_first_btn addTarget:self action:@selector(first_click:) forControlEvents:UIControlEventTouchUpInside];
    
    _second_btn = [[UIButton alloc] initWithFrame:CGRectMake(kSCREENWIDTH/2, 64, kSCREENWIDTH/2-16, 38)];
    [_second_btn setTitle:@"帮我买" forState:UIControlStateNormal];
    _second_btn.layer.borderColor = [UIColor whiteColor].CGColor;
    [_second_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _second_btn.layer.borderWidth = 1.0;
    [_second_btn.titleLabel setFont:[UIFont systemFontOfSize:14.0]];
    [_second_btn setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    [self.view addSubview:_first_btn];
    [self.view addSubview:_second_btn];
    [_second_btn addTarget:self action:@selector(second_click:) forControlEvents:UIControlEventTouchUpInside];
}

- (UIButton *)start_btn
{
    if(!_start_btn)
    {
        _start_btn = [[UIButton alloc] initWithFrame:CGRectMake(15, self.view.frame.size.height == 568 ? (self.view.frame.size.height-40-343-64-49-44)/2+(40+343+64) : (self.view.frame.size.height-40-400-64-49-44)/2+(40+400+64) , kSCREENWIDTH-30, 44)];
        _start_btn.backgroundColor = [UIColor colorWithRed:255/255.0 green:0/255.0 blue:119/255.0 alpha:1.0];
        [_start_btn setTitle:@"开始呼叫" forState:UIControlStateNormal];
        [_start_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _start_btn.layer.cornerRadius = 6.0;
        [_start_btn addTarget:self action:@selector(start_click) forControlEvents:UIControlEventTouchUpInside];
    }
    return _start_btn;
}

- (IBAction)right_click:(id)sender {
    PINGCHNAGSTORYBOARD(@"Main", @"CARID");
}

- (Run_Detail_View *)run_view
{
    if(!_run_view)
    {
        _run_view = [[[NSBundle mainBundle] loadNibNamed:@"Run_Detail_View" owner:self options:nil] lastObject];
        _run_view.frame = CGRectMake(15, 40+64, kSCREENWIDTH-30, self.view.frame.size.height == 568 ?  343 : 400);
    }
    return _run_view;
}

- (IBAction)publish_click:(id)sender {
}

- (void)add_run_view_block
{
    __weak typeof(self)weakself = self;
    self.run_view.kuai_block = ^{
        weakself.run_view.kuai_img.image = [UIImage imageNamed: isKuai == YES ? @"选中" : @"没选择"];
        isKuai = isKuai == YES ? NO : YES;
    };
    self.run_view.ping_block = ^{
        weakself.run_view.ping_img.image = [UIImage imageNamed:isPing == YES ? @"选中" : @"没选择"];
        isPing = isPing == YES ? NO : YES;
    };
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

- (void)start_click//开始呼叫
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:@"亲，您需要支付1元服务费即可呼叫车主接单哦～" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"立即支付" style:UIAlertActionStyleDefault  handler:^(UIAlertAction * _Nonnull action) {
        Run_Pay_Result_TableViewController *pay_vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"RUNPAYID"];
        pay_vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:pay_vc animated:YES];
        // PINGCHNAGSTORYBOARD(@"Main", @"RUNPAYID");
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alertController animated:YES completion:nil];
}

-(void)first_click:(UIButton *)btn
{
    [btn setBackgroundColor:[UIColor colorWithRed:255/255.0 green:0/255.0 blue:110/255.0 alpha:1.0]];
    self.second_btn.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.second_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.buy_VC.view setHidden:YES];
    [self.run_view setHidden:NO];

}

- (void)second_click:(UIButton *)btn
{
    [btn setBackgroundColor:[UIColor colorWithRed:255/255.0 green:0/255.0 blue:110/255.0 alpha:1.0]];
    self.first_btn.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.first_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.buy_VC.view setHidden:NO];
    [self.run_view setHidden:YES];
    
}

@end
