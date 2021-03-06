//
//  Out_Food_ViewController.m
//  Running
//
//  Created by 吕志杰 on 2017/8/30.
//  Copyright © 2017年 吕志杰. All rights reserved.
//

#import "Out_Food_ViewController.h"
#import "Run_Detail_View.h"
#import "Say_ViewController.h"
#import "Run_Pay_Result_TableViewController.h"

@interface Out_Food_ViewController ()
//{
//    BOOL isKuai;
//    BOOL isPing;
//}
@property (nonatomic, assign) BOOL isKuai;
@property (nonatomic, assign) BOOL isPing;
@property (weak, nonatomic) IBOutlet UIView *main_view;
@property (strong ,nonatomic) UIButton *start_btn;
@property (strong ,nonatomic) Run_Detail_View *run_view;

@end

@implementation Out_Food_ViewController

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

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isKuai = NO;
    self.isPing = NO;
    self.main_view.clipsToBounds = YES;
    [self.view addSubview:self.run_view];
    [self.view addSubview:self.start_btn];
    [self add_tap];
    [self add_run_view_block];
    __weak typeof(self)weakself = self;
    self.run_view.say_block = ^{
        Say_ViewController *say_VC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SAYID"];
        say_VC.result_block = ^(NSString *str) {
            weakself.run_view.main_textview.text = str;
        };
        [weakself.navigationController pushViewController: say_VC animated:YES];
    };
}

- (void)add_run_view_block
{
    __weak typeof(self)weakself = self;
    self.run_view.kuai_block = ^{
        weakself.isKuai = !weakself.isKuai;
        weakself.run_view.kuai_img.image = [UIImage imageNamed: weakself.isKuai == NO ? @"没选择":@"选中" ];
        if(weakself.isKuai){
            weakself. isPing = NO;
            weakself.run_view.ping_img.image = [UIImage imageNamed:weakself.isPing == NO ?  @"没选择":@"选中"];
        }else{
            weakself. isPing = YES;
            weakself.run_view.ping_img.image = [UIImage imageNamed:weakself.isPing == NO ?  @"没选择":@"选中"];
        }
    };
    self.run_view.ping_block = ^{
        weakself.isPing = !weakself.isPing;
        weakself.run_view.ping_img.image = [UIImage imageNamed:weakself.isPing == NO ?  @"没选择":@"选中"];
        
        if(weakself.isPing){
            weakself.isKuai = NO;
            weakself.run_view.kuai_img.image = [UIImage imageNamed: weakself.isKuai == NO ? @"没选择":@"选中" ];
        }else{
            weakself.isKuai = YES;
            weakself.run_view.kuai_img.image = [UIImage imageNamed: weakself.isKuai == NO ? @"没选择":@"选中" ];
        }
    };
    self.run_view.four_lab.text = @"联系电话";
    self.run_view.four_textfield.placeholder = @"输入手机号码";
    self.run_view.five_lab.text = @"跑腿类型";
    self.run_view.five_first_lab.text = @"机动车";
    self.run_view.five_second_lab.text = @"非机动车";
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

@end
