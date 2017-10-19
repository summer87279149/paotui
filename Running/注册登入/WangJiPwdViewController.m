
//
//  WangJiPwdViewController.m
//  Running
//
//  Created by Admin on 2017/10/19.
//  Copyright © 2017年 吕志杰. All rights reserved.
//

#import "WangJiPwdViewController.h"

@interface WangJiPwdViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *yzm;
@property (weak, nonatomic) IBOutlet UITextField *pwd1;
@property (weak, nonatomic) IBOutlet UITextField *pwd2;

@end

@implementation WangJiPwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)yzmClicked:(UIButton *)sender {
    if([UserTool isValidateMobile:self.phoneNumber.text]){
        [UserTool codeCountDownTimerWith:sender];
        
    }else{
        [MBProgressHUD showError:@"请输入正确的手机号"];
    }
}

- (IBAction)wanChengClicked:(UIButton *)sender {
    
}
- (IBAction)back:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
