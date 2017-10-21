//
//  Map_ViewController.m
//  Running
//
//  Created by 吕志杰 on 2017/8/28.
//  Copyright © 2017年 吕志杰. All rights reserved.
//

#import "Map_ViewController.h"

@interface Map_ViewController ()<BMKMapViewDelegate,BMKLocationServiceDelegate>

@end

@implementation Map_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mapView = [[BMKMapView alloc]initWithFrame:self.view.bounds];
    _locService = [[BMKLocationService alloc] init];
    _locService.delegate = self;
    _mapView.showsUserLocation = NO;//先关闭显示的定位图层
    _mapView.zoomLevel = 18;
    _mapView.userTrackingMode = BMKUserTrackingModeFollow;//设置定位的状态
    //    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(location_click) userInfo:nil repeats:NO];
    _mapView.showsUserLocation = YES;//显示定位图层
    [_locService startUserLocationService];
    [self.view addSubview:self.mapView];
}



//- (void)location_click
//{
//    _mapView.userTrackingMode = BMKUserTrackingModeNone;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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

- (void)willStartLocatingUser
{
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
}

- (void)dealloc {
    if (self.mapView) {
        self.mapView = nil;
    }
}

@end
