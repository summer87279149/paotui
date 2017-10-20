//
//  GoodCheZhuViewController.h
//  Running
//
//  Created by Admin on 2017/10/20.
//  Copyright © 2017年 吕志杰. All rights reserved.
//

#import "BaseViewController.h"
typedef NS_ENUM(NSUInteger,VCtype){
    TypeHeHuoRen,
    TypeGoodCheZhu,
    TypeGoodPaoTui
};
@interface GoodCheZhuViewController : BaseViewController
@property (nonatomic, assign) VCtype vctype;
@end
