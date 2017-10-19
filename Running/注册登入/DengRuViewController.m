//
//  DengRuViewController.m
//  Running
//
//  Created by Admin on 2017/10/19.
//  Copyright © 2017年 吕志杰. All rights reserved.
//
#import "WangJiPwdViewController.h"
#import "BaseNavViewController.h"
#import "DengRuViewController.h"
#import "ZhuCeViewController.h"
@interface DengRuViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *pwd;
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *yzmBtn;
@property (nonatomic, assign) BOOL isShouJiDengRu;
@end

@implementation DengRuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.btn1 setBackgroundColor:[UIColor jk_colorWithHexString:@"#FE0180"]];
    [self.btn1 setTintColor:[UIColor whiteColor]];
}
- (IBAction)shouJiDengRu:(UIButton *)sender {
    [sender setBackgroundColor:[UIColor jk_colorWithHexString:@"#FE0180"]];
    [sender setTintColor:[UIColor whiteColor]];
    [self.btn2 setBackgroundColor:[UIColor whiteColor]];
    [self.btn2 setTintColor:[UIColor jk_colorWithHexString:@"#FE0180"]];
    self.isShouJiDengRu = YES;
   
    [self.view setNeedsLayout];
    [self.view layoutIfNeeded];
    self.yzmBtn.hidden = NO;
    self.phoneNumber.placeholder = @"请输入手机号码";
    self.pwd.placeholder = @"请输入验证码";
}
- (IBAction)mimaDengRu:(UIButton *)sender {
    [sender setBackgroundColor:[UIColor jk_colorWithHexString:@"#FE0180"]];
    [sender setTintColor:[UIColor whiteColor]];
    [self.btn1 setBackgroundColor:[UIColor whiteColor]];
    [self.btn1 setTintColor:[UIColor jk_colorWithHexString:@"#FE0180"]];
    self.isShouJiDengRu = NO;
    
    [self.view setNeedsLayout];
    [self.view layoutIfNeeded];
    
    self.yzmBtn.hidden = YES;
    self.phoneNumber.placeholder = @"输入账号";
    self.pwd.placeholder = @"输入密码";
}

- (IBAction)loginClicked:(UIButton *)sender {
}

- (IBAction)registerClicked:(UIButton *)sender {
    ZhuCeViewController * vc = [[ZhuCeViewController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)forgetPwdClicked:(UIButton *)sender {
    WangJiPwdViewController * vc = [[WangJiPwdViewController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)yanZhengMa:(UIButton *)sender {
    if([UserTool isValidateMobile:self.phoneNumber.text]){
        [UserTool codeCountDownTimerWith:sender];
        
    }else{
        [MBProgressHUD showError:@"请输入正确的手机号"];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.view endEditing:YES];
}

@end
