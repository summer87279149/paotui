//
//  UIView.h
//  2017
//
//  Created by lvzhijie on 2017/1/5.
//  Copyright © 2017年 lvzhijie. All rights reserved.
//

#import <UIKit/UIKit.h>
IB_DESIGNABLE
@interface UIView(IB)
@property (nonatomic, assign) IBInspectable NSInteger cornerRadius;
@property (assign,nonatomic ) IBInspectable float     borderWidth;
@property (assign,nonatomic ) IBInspectable UIColor   *borderColor;
@property (assign,nonatomic ) IBInspectable UIColor *shadowColor;
@property (assign,nonatomic ) IBInspectable float shadowRadius;
@property (assign,nonatomic ) IBInspectable float shadowOpacity;
@end
