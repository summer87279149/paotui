//
//  LunScrollerView.h
//  2017
//
//  Created by lvzhijie on 2016/11/2.
//  Copyright © 2016年 lvzhijie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LunScrollerView : UIView

@property (strong ,nonatomic) void (^imageClickBlock)(NSInteger index);

- (instancetype)initWithFrame:(CGRect)frame title_array:(NSMutableArray *)title_array;

- (void)setUpScrollerView:(NSArray *)imageURLS;

@end
