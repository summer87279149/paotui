//
//  My_Order_ViewController.m
//  Running
//
//  Created by 吕志杰 on 2017/8/29.
//  Copyright © 2017年 吕志杰. All rights reserved.
//

#import "My_Order_ViewController.h"
@interface My_Order_ViewController ()
@property (strong,nonatomic)First_TableViewController *firstVc;/**<第一个控制器*/
@property (strong,nonatomic)Second_TableViewController *secondVc;/**<第二个控制器*/
@property (strong,nonatomic)Three_TableViewController *thirdVc;/**<第三个控制器*/
@property (strong,nonatomic)Four_TableViewController *fourVc;/**<第四个控制器*/
@end

@implementation My_Order_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self add_seg];
}

- (void)add_seg
{
    WJSegmentMenuVc *segmentMenuVc = [[WJSegmentMenuVc alloc]initWithFrame:CGRectMake(0, 64+40,kSCREENWIDTH, 49)];
    segmentMenuVc.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:segmentMenuVc];
    segmentMenuVc.titleFont = [UIFont systemFontOfSize:16];
    segmentMenuVc.unlSelectedColor = [UIColor darkGrayColor];
    segmentMenuVc.selectedColor = [UIColor colorWithRed:251/255.0 green:23/255.0 blue:33/255.0 alpha:1.0];
    segmentMenuVc.MenuVcSlideType = WJSegmentMenuVcSlideTypeSlide;
    segmentMenuVc.SlideColor = [UIColor colorWithRed:251/255.0 green:23/255.0 blue:33/255.0 alpha:1.0];
    segmentMenuVc.advanceLoadNextVc = YES;
    
    NSArray *titles = @[@"全部",@"待付款",@"待发货",@"待收货"];
    self.firstVc = [First_TableViewController new];;
    self.secondVc = [Second_TableViewController new];
    self.thirdVc = [Three_TableViewController new];
    self.fourVc = [Four_TableViewController new];
    NSArray *vcArr = @[self.firstVc,self.secondVc,self.thirdVc,self.fourVc];
    
    /* 导入数据 */
    [segmentMenuVc addSubVc:vcArr subTitles:titles];
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
