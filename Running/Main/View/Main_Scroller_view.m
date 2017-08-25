//
//  Main_Scroller_view.m
//  Running
//
//  Created by 吕志杰 on 2017/8/24.
//  Copyright © 2017年 吕志杰. All rights reserved.
//

#import "Main_Scroller_view.h"

@implementation Main_Scroller_view

- (instancetype)initWithFrame:(CGRect)frame arr:(NSMutableArray *)arr
{
    if(self = [super initWithFrame:frame])
    {
        _MainScrollerView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 21)];
        [self addSubview:_MainScrollerView];
        imageArray = [NSMutableArray array];
         [self setScrollview:_MainScrollerView lab:_main_lab array:arr];
        imageArray = arr;
        self.pageControl = [[UIPageControl alloc] init];
        self.pageControl.numberOfPages = arr.count;
    }
    return self;
}

-(void)setScrollview:(UIScrollView *)ScrollView lab:(UILabel *)lab array:(NSMutableArray *)array
{
    for (int i = 0; i < array.count; i++)
    {
        lab = [UILabel new];
        CGFloat imageX = i * 21;
        lab.frame = CGRectMake(0, imageX, kSCREENWIDTH-68, 21);
        lab.text = array[i];
        lab.textColor = [UIColor blackColor];
        [lab setFont:[UIFont systemFontOfSize:15.0]];
        UITapGestureRecognizer *TapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapClick:)];
        [lab addGestureRecognizer:TapGestureRecognizer];
        [ScrollView addSubview:lab];
    }
    ScrollView.showsHorizontalScrollIndicator = NO;
    ScrollView.showsVerticalScrollIndicator = NO;
    CGFloat contentW = array.count *21;
    ScrollView.contentSize = CGSizeMake( 0,contentW);
    //分页
    ScrollView.pagingEnabled = YES;
    ScrollView.delegate = self;
    [self addTimer];
}

// 手势开始时调用
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self removeTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    //开启定时器
    [self addTimer];
}

//开启
- (void)addTimer{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
}

- (void)TapClick:(UIGestureRecognizer*)sender
{
    CGFloat x = _MainScrollerView.contentOffset.y;
    int page = x /  21;
    NSLog(@"success%d",page);
}

- (void)nextImage
{
    int page = (int)self.pageControl.currentPage;
    if (page == imageArray.count-1)
    {
        page = 0;
    }
    else
    {
        page++;
    }
    CGFloat x = page * 21;
    [_MainScrollerView setContentOffset:CGPointMake(0,x) animated:YES];
}

// scrollview滚动的时候调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"滚动中");
    CGFloat x = scrollView.contentOffset.y;
    int page = x /  21;
    self.pageControl.currentPage = page;
}

//关闭
- (void)removeTimer
{
    [self.timer invalidate];
}


@end
