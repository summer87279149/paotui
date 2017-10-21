//
//  WaitingViewController.h
//  Running
//
//  Created by Admin on 2017/10/21.
//  Copyright © 2017年 吕志杰. All rights reserved.
//

#import "BaseViewController.h"

@interface WaitingViewController : BaseViewController
@property (strong ,nonatomic) BMKMapView* mapView;
@property (strong ,nonatomic) BMKLocationService* locService;
@end
