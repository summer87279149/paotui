//
//  ZhuCeViewController.m
//  Running
//
//  Created by Admin on 2017/10/18.
//  Copyright © 2017年 吕志杰. All rights reserved.
//

#import "ZhuCeViewController.h"
#import "UIViewController+CameraAndPhoto.h"
@interface ZhuCeViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *YongHuZhuCeView;
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (strong, nonatomic)  UIButton *btmBtn;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *yanZhengMa;
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *pwd;
@property (weak, nonatomic) IBOutlet UITextField *tuiJianMa;
@property (weak, nonatomic) IBOutlet UITextField *changYongLuXian;
@property (weak, nonatomic) IBOutlet UIScrollView *scroll;
@property (weak, nonatomic) IBOutlet UIView *cheZhuZhuCe;
@property (nonatomic, assign) BOOL isYongHuZhuCe;
@end

@implementation ZhuCeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self setupview];
    self.isYongHuZhuCe = YES;
    [self.btn1 setBackgroundColor:[UIColor jk_colorWithHexString:@"#FE0180"]];
    [self.btn1 setTintColor:[UIColor whiteColor]];
    [self.scroll addSubview:self.btmBtn];
    [self.btmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.scroll).multipliedBy(0.8);
        make.top.mas_equalTo(self.YongHuZhuCeView.mas_bottom).offset(20);
        make.centerX.mas_equalTo(self.YongHuZhuCeView);
        make.height.mas_equalTo(60);
    }];
}
- (IBAction)yongHuZhuCeClicked:(UIButton *)sender {
    [sender setBackgroundColor:[UIColor jk_colorWithHexString:@"#FE0180"]];
    [sender setTintColor:[UIColor whiteColor]];
    [self.btn2 setBackgroundColor:[UIColor whiteColor]];
    [self.btn2 setTintColor:[UIColor jk_colorWithHexString:@"#FE0180"]];
     self.isYongHuZhuCe = YES;
    self.cheZhuZhuCe.hidden  = YES;
    [self.btmBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.scroll).multipliedBy(0.8);
        make.top.mas_equalTo(self.YongHuZhuCeView.mas_bottom).offset(20);
        make.centerX.mas_equalTo(self.YongHuZhuCeView);
        make.height.mas_equalTo(60);
    }];
    [self.view setNeedsLayout];
    [self.view layoutIfNeeded];
   
}
- (IBAction)xuanShenFenZheng:(UIButton *)sender {
    self.xt_block = ^(NSData *data) {
        [sender setBackgroundImage:[UIImage imageWithData:data] forState:UIControlStateNormal];
    };
     [self openImagePickerWithType:XTCameraTypeA4Paper];
}

- (IBAction)cheZhuZhuCeClicked:(UIButton *)sender {
    [sender setBackgroundColor:[UIColor jk_colorWithHexString:@"#FE0180"]];
    [sender setTintColor:[UIColor whiteColor]];
    [self.btn1 setBackgroundColor:[UIColor whiteColor]];
    [self.btn1 setTintColor:[UIColor jk_colorWithHexString:@"#FE0180"]];
     self.isYongHuZhuCe = NO;
    self.cheZhuZhuCe.hidden  = NO;
    [self.btmBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.scroll).multipliedBy(0.8);
    make.top.mas_equalTo(self.YongHuZhuCeView.mas_bottom).offset(20+320);
        make.centerX.mas_equalTo(self.YongHuZhuCeView);
        make.height.mas_equalTo(60);
    }];
    [self.view setNeedsLayout];
    [self.view layoutIfNeeded];
}

- (IBAction)yanzhengma:(id)sender {
    if([UserTool isValidateMobile:self.phoneNumber.text]){
        [UserTool codeCountDownTimerWith:sender];
        
    }else{
        [MBProgressHUD showError:@"请输入正确的手机号"];
    }
}
- (IBAction)back:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    if(self.isYongHuZhuCe){
      self.scroll.contentSize = CGSizeMake(kSCREENWIDTH, kSCREENHEIGHT+160);
    }else{
      self.scroll.contentSize = CGSizeMake(kSCREENWIDTH, kSCREENHEIGHT+160+320);
    }
}

-(UIButton*)btmBtn{
    if(!_btmBtn){
        _btmBtn = [[UIButton alloc]init];
        [_btmBtn setTitle:@"确定" forState:UIControlStateNormal];
        [_btmBtn setBackgroundColor:[UIColor jk_colorWithHexString:@"#FE0180"]];
        _btmBtn.layer.cornerRadius = 5;
        [_btmBtn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btmBtn;
}
-(void)btnClicked{
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.view endEditing:YES];
}
//#pragma mark - ui
//-(void)setupview{
//    self.manager = [[RETableViewManager alloc] initWithTableView:self.tableview];
//
//    //section1
//    RETableViewSection *section1 = [RETableViewSection sectionWithHeaderView:nil footerView:self.footerView];
//    [self.manager addSection:section1];
//    self.name = [RETextItem itemWithTitle:@"姓名" value:nil placeholder:@"填写用户姓名"];
//    self.idCard = [RENumberItem itemWithTitle:@"身份证号" value:@"" placeholder:@"填写本人身份证号（仅用于认证）"];
//    self.creditCard = [RENumberItem itemWithTitle:@"银行卡号" value:@"" placeholder:@"提现银行卡号(仅用于提现)"];
//    [section1 addItem:self.name];
//    [section1 addItem:self.idCard];
//    [section1 addItem:self.creditCard];
//}
//
//#pragma mark - tableview
//-(UITableView*)tableview{
//    if(!_tableview){
//        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-64) style:UITableViewStylePlain];
//        _tableview.delegate = self;
////        _tableview.tableHeaderView = self.headerView;
////        _tableview.tableFooterView = self.section2FooterView;
//        [self.view addSubview:_tableview];
//    }
//    return _tableview;
//}
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 60;
//}
//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return 0;
//}
//
//-(UIView*)footerView{
//    if (!_footerView) {
//        _footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 44)];
//        UIButton *btn = [UIButton XT_createBtnWithTitle:@"查看支持的银行" TitleColor:[UIColor blackColor] TitleFont:@15 cornerRadio:nil BGColor:[UIColor whiteColor] Borderline:nil BorderColor:nil target:self Method:@selector(footerViewBtnClicked:)];
//        [_footerView addSubview:btn];
//        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.right.mas_equalTo(_footerView).offset(-10);
//            make.width.mas_equalTo(100*k_scale);
//            make.height.mas_equalTo(30);
//            make.top.mas_equalTo(_footerView);
//        }];
//    }
//    return _footerView;
//}
////-(UIView*)headerView{
////    if(!_headerView){
////        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 60*k_scaleHeight)];
////        _headerView.backgroundColor = [UIColor whiteColor];
////        UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"BaseInfoIMG.png"]];
////        [_headerView addSubview:image];
////        [image mas_makeConstraints:^(MASConstraintMaker *make) {
////            make.centerX.mas_equalTo(_headerView);
////            make.width.mas_equalTo(image.mas_height).multipliedBy(4);
////            make.height.mas_equalTo(50*k_scaleHeight);
////            make.top.mas_equalTo(_headerView);
////        }];
////        //        UIView *v = [self makePortrait];
////        //        [_headerView addSubview:v];
////        //        [v mas_makeConstraints:^(MASConstraintMaker *make) {
////        //            make.centerX.mas_equalTo(_headerView);
////        //            make.width.and.height.mas_equalTo(100*k_scale);
////        //            make.top.mas_equalTo(_headerView.mas_bottom).offset(10);
////        //        }];
////
////    }
////    return _headerView;
////}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//-(UIView*)registView{
//    if(!_registView){
//        _registView = [UIView new];
//    }
//    return _registView;
//}


@end
