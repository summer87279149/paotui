//
//  Main_ViewController.m
//  Running
//
//  Created by 吕志杰 on 2017/8/24.
//  Copyright © 2017年 吕志杰. All rights reserved.
//

#import "Main_ViewController.h"
#import "Main_Scroller_view.h"

@interface Main_ViewController ()
@property (weak, nonatomic) IBOutlet UIView *style_view;//乘客／车主
@property (weak, nonatomic) IBOutlet UIView *Mess_view;//右边信息页面
@property (weak, nonatomic) IBOutlet UIImageView *header_image;
- (IBAction)mess_click:(id)sender;//右边信息按钮
@property (weak, nonatomic) IBOutlet UIView *question_view;
@property (weak, nonatomic) IBOutlet UIView *lun_view;

@property (weak, nonatomic) IBOutlet UIButton *bottom_btn;
@property (weak, nonatomic) IBOutlet UIButton *bottom_click;
@property (strong ,nonatomic)Main_Scroller_view *main_view;
@end

@implementation Main_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setHidden: YES];
    _style_view.clipsToBounds = NO;
    _style_view.layer.shadowOffset = CGSizeMake(3,3);
    _Mess_view.clipsToBounds = NO;
    _Mess_view.layer.shadowOffset = CGSizeMake(0,0);
    _question_view.clipsToBounds = NO;
    _question_view.layer.shadowOffset = CGSizeMake(3,3);
    _bottom_btn.clipsToBounds = NO;
    _bottom_btn.layer.shadowOffset = CGSizeMake(3,3);
    _main_view = [[Main_Scroller_view alloc] initWithFrame:self.lun_view.bounds arr:[NSMutableArray arrayWithObjects:@"相比于硅谷的科技巨头，来自中国的阿里巴",@"美国市场研究公司MKM Partners对阿里巴巴股价预期上调25%，并认为阿里是“所有高市值公司中基本面最好的”。",@"MKM提高阿里巴巴估价25%",@"gh我们一直以来都把阿里巴巴列在高市值", nil]];
    [self.lun_view addSubview:_main_view];
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

- (IBAction)mess_click:(id)sender {
}
- (IBAction)bottom_click:(id)sender {
}
@end
