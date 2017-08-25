//
//  Main_Scroller_view.h
//  Running
//
//  Created by 吕志杰 on 2017/8/24.
//  Copyright © 2017年 吕志杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Main_Scroller_view : UIView<UIScrollViewDelegate>
{
        NSMutableArray *imageArray;
}
@property (nonatomic, strong) NSTimer *timer;
@property (strong, nonatomic)  UIScrollView *MainScrollerView;
@property (strong,nonatomic) UILabel *main_lab;
- (instancetype)initWithFrame:(CGRect)frame arr:(NSMutableArray *)arr;
@property (strong, nonatomic) UIPageControl *pageControl;
@end
