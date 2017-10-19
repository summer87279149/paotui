//
//  Say_ViewController.h
//  Running
//
//  Created by 吕志杰 on 2017/8/28.
//  Copyright © 2017年 吕志杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Say_ViewController : UIViewController
@property (strong ,nonatomic) void(^result_block)(NSString *str);
@end
