//
//  Map_ViewController.h
//  Running
//
//  Created by 吕志杰 on 2017/8/28.
//  Copyright © 2017年 吕志杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Map_ViewController : UIViewController
@property (strong ,nonatomic) BMKMapView* mapView;
@property (strong ,nonatomic) BMKLocationService* locService;
@end
