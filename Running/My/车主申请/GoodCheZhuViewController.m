//
//  GoodCheZhuViewController.m
//  Running
//
//  Created by Admin on 2017/10/20.
//  Copyright © 2017年 吕志杰. All rights reserved.
//
#import "UIViewController+CameraAndPhoto.h"
#import "GoodCheZhuViewController.h"

@interface GoodCheZhuViewController ()
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *idCard;
@property (weak, nonatomic) IBOutlet UITextField *address;
@property (weak, nonatomic) IBOutlet UITextField *money;
@property (weak, nonatomic) IBOutlet UIButton *btnMan;
@property (weak, nonatomic) IBOutlet UIButton *btnWoman;
@property (nonatomic, assign) BOOL isMan;
@property (weak, nonatomic) IBOutlet UIView *hehuoView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *hehuoViewHeight;//合伙金额 view height
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *zhuangbeiViewHeight;//装备金额 view height
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tuijianmaViewHeight;//推荐码 view height
@property (weak, nonatomic) IBOutlet UILabel *zhuangBeiJinELabek;

@end

@implementation GoodCheZhuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    switch (self.vctype) {
        case TypeHeHuoRen:
            self.zhuangbeiViewHeight = 0;
            break;
        case TypeGoodCheZhu:
            self.hehuoViewHeight = 0;
            self.tuijianmaViewHeight = 0;
            self.zhuangBeiJinELabek.text = @"贴纸金额";
            break;
        case TypeGoodPaoTui:
            self.hehuoViewHeight = 0;
            self.tuijianmaViewHeight = 0;
            break;
        default:
            break;
    }
    self.isMan = YES;
}
- (IBAction)manBtn:(UIButton *)sender {
    self.isMan = YES;
    [self.btnMan setImage:[UIImage imageNamed: @"选中"] forState:UIControlStateNormal];
    [self.btnWoman setImage:[UIImage imageNamed: @"没选择"] forState:UIControlStateNormal];
}
- (IBAction)womanBtn:(UIButton *)sender {
    
    self.isMan = NO;
    [self.btnWoman setImage:[UIImage imageNamed: @"选中"] forState:UIControlStateNormal];
    [self.btnMan setImage:[UIImage imageNamed: @"没选择"] forState:UIControlStateNormal];
}
- (IBAction)chooseImg:(UIButton *)sender {
    self.xt_block = ^(NSData *data) {
        [sender setBackgroundImage:[UIImage imageWithData:data] forState:UIControlStateNormal];
    };
    [self openImagePickerWithType:XTCameraTypeA4Paper];
}
- (IBAction)submit:(UIButton *)sender {
    
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
