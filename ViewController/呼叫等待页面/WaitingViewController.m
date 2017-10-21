//
//  WaitingViewController.m
//  Running
//
//  Created by Admin on 2017/10/21.
//  Copyright © 2017年 吕志杰. All rights reserved.
//

#import "WaitingViewController.h"

@interface WaitingViewController ()<BMKMapViewDelegate,BMKLocationServiceDelegate>
{
//    BMKPointAnnotation*animatedAnnotation;
   NSInteger secondsCountDown ;
}
@property (nonatomic, strong) BMKPointAnnotation*animatedAnnotation;
//创建定时器(因为下面两个方法都使用,所以定时器拿出来设置为一个属性)
@property(nonatomic,strong)NSTimer*countDownTimer;
@property (weak, nonatomic) IBOutlet UIView *infoView;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;

@end

@implementation WaitingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"呼叫等待";
    self.mapView = [[BMKMapView alloc]initWithFrame:self.view.bounds];
    _locService = [[BMKLocationService alloc] init];
     _locService.delegate = self;
   
    _mapView.showsUserLocation = NO;//先关闭显示的定位图层
    _mapView.zoomLevel = 18;
    _mapView.userTrackingMode = BMKUserTrackingModeFollow;//设置定位的状态
//  NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(location_click) userInfo:nil repeats:NO];
    _mapView.showsUserLocation = YES;//显示定位图层
    [_locService startUserLocationService];
    [self.view addSubview:self.mapView];
    [self.view bringSubviewToFront:self.infoView];
    
    
    
    //设置定时器
    secondsCountDown = 300;
    _countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDownAction) userInfo:nil repeats:YES];
    //启动倒计时后会每秒钟调用一次方法 countDownAction
    
    //设置倒计时显示的时间
//    NSString *str_hour = [NSString stringWithFormat:@"%02ld",secondsCountDown/3600];//时
//    NSString *str_minute = [NSString stringWithFormat:@"%02ld",(secondsCountDown%3600)/60];//分
//    NSString *str_second = [NSString stringWithFormat:@"%02ld",secondsCountDown%60];//秒
//    NSString *format_time = [NSString stringWithFormat:@"%@:%@",str_minute,str_second];

    
}
//实现倒计时动作
-(void)countDownAction{
    //倒计时-1
    secondsCountDown--;
    //重新计算 时/分/秒
//    NSString *str_hour = [NSString stringWithFormat:@"%02ld",secondsCountDown/3600];
    
    NSString *str_minute = [NSString stringWithFormat:@"%02ld",(secondsCountDown%3600)/60];
    
    NSString *str_second = [NSString stringWithFormat:@"%02ld",secondsCountDown%60];
    
    NSString *format_time = [NSString stringWithFormat:@"%@:%@",str_minute,str_second];
    //修改倒计时标签及显示内容
    self.timeLabel.text=[NSString stringWithFormat:@"%@",format_time];
    //当倒计时到0时做需要的操作，比如验证码过期不能提交
    if(secondsCountDown==0){
        [_countDownTimer invalidate];
        _countDownTimer = nil;
    }
}

-(BMKPointAnnotation*)animatedAnnotation{
    if(!_animatedAnnotation){
         _animatedAnnotation = [[BMKPointAnnotation alloc]init];
        [_mapView addAnnotation:_animatedAnnotation];
    }
    return _animatedAnnotation;
}
//- (void)location_click
//{
//    _mapView.userTrackingMode = BMKUserTrackingModeNone;
//}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.mapView viewWillAppear];
    self.mapView.delegate = self;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.locService stopUserLocationService];
    [self.mapView viewWillDisappear];
    self.mapView.delegate = nil;
}

-(void)willStartLocatingUser{
    NSLog(@"start locate");
}
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation//用户方向更新后，会调用此函数
{
    [self.mapView updateLocationData:userLocation];
    
    NSLog(@"heading is %@",userLocation.heading);
}

- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    [self.mapView updateLocationData:userLocation];
    
    //    CLLocationCoordinate2D coor;
    //    coor.latitude = 40.115;
    //    coor.longitude = 116.404;
    self.animatedAnnotation.coordinate = userLocation.location.coordinate;
    self.animatedAnnotation.title = @"接单等待:5:00";
   
}

- (void)dealloc {
    if (self.mapView) {
        self.mapView = nil;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id <BMKAnnotation>)annotation
{
    BMKAnnotationView * view = nil;
    //动画annotation
    if (annotation == self.animatedAnnotation) {
        NSString *AnnotationViewID = @"AnimatedAnnotation";
        view = [[BMKAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:AnnotationViewID];
        view.image = [UIImage imageNamed:@"test"];
  
    }
    return view;
}


@end
