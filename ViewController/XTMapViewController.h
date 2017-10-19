//
//  XTMapViewController.h
//  Running
//
//  Created by Admin on 2017/10/19.
//  Copyright © 2017年 吕志杰. All rights reserved.
//

#import "BaseViewController.h"
typedef void (^CallBack)(NSDictionary*);
@interface XTMapViewController : BaseViewController
@property (nonatomic, copy) CallBack callback;
@end
