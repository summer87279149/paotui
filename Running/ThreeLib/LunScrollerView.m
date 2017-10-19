//
//  LunScrollerView.m
//  2017
//
//  Created by lvzhijie on 2016/11/2.
//  Copyright © 2016年 lvzhijie. All rights reserved.
//
#define  FIRST_ARRAY @[@"最近交易",@"杠杆比例",@"总交易手数",@"交易周期",@"跟随资金",@"最近交易",@"杠杆比例",@"杠杆比例"]
#define  SECOND_ARRAY @[@"交易笔数",@"盈利交易",@"亏损交易",@"做多盈利交易",@"做空利交易",@"跟随资金",@"最近交易",@"杠杆比例"]
#define  THREE_ARRAY @[@"平均盈利",@"平均亏损",@"最大盈利点数",@"最大亏损点数",@"平均盈利点数",@"平均盈利",@"平均亏损",@"最大盈利点数"]
#define  FOUR_ARRAY @[@"平均亏损点数",@"盈利点数",@"平均持仓时间",@"跟随获利点数",@"预期回报",@"平均盈利",@"平均亏损",@"最大盈利点数"]
#define  FIVE_ARRAY @[@"标准差",@"活跃度",@"夏普比例",@"最大回撤",@"lzj",@"平均盈利",@"平均亏损",@"最大盈利点数"]
#define Kinterval  2
#import "LunScrollerView.h"
#import "Lun_View.h"

@interface LunScrollerView ()<UIScrollViewDelegate>

@property (nonatomic,strong) UIScrollView *scrollerView;
@property (nonatomic,strong) UIPageControl *pageController;
@property (nonatomic,strong) NSTimer *timer;
@property (nonatomic,strong) UILabel *timeLab;
@property (nonatomic,strong) NSMutableArray *all_array;
@end

@implementation LunScrollerView

- (NSMutableArray *)all_array
{
    if(!_all_array)
    {
        _all_array = [NSMutableArray arrayWithObjects:FIRST_ARRAY,SECOND_ARRAY,THREE_ARRAY,FOUR_ARRAY,FIVE_ARRAY, nil];
    }
    return _all_array;
}

- (instancetype)initWithFrame:(CGRect)frame title_array:(NSMutableArray *)title_array{
    self = [super initWithFrame:frame];
    if (self) {
        self.scrollerView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        self.scrollerView.delegate = self;
        self.scrollerView.showsHorizontalScrollIndicator = NO;
        self.scrollerView.pagingEnabled = YES;
        [self addSubview:self.scrollerView];
        self.pageController = [[UIPageControl alloc] initWithFrame:(CGRectMake(0, 160+10, kSCREENWIDTH, 30))];
        [self addSubview:self.pageController];
        self.pageController.currentPageIndicatorTintColor = [UIColor colorWithRed:255/255.0 green:82/255.0 blue:0/255.0 alpha:1.0];
        
        self.pageController.pageIndicatorTintColor = [UIColor lightGrayColor];
        [self setUpScrollerView:title_array];
    }
    return self;
}

- (void)setUpScrollerView:(NSMutableArray *)array{
    self.scrollerView.contentSize = CGSizeMake(self.frame.size.width *self.all_array.count, 0);//滚动区域
    self.scrollerView.contentOffset = CGPointMake(0, 0);//从第一张开始显示
    //dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    for (int i = 0; i < self.all_array.count; i++) {
        Lun_View *imageView = [[Lun_View alloc] initWithFrame:CGRectMake(i * self.frame.size.width, 0, self.frame.size.width, self.frame.size.height-23)];
        imageView.layer.borderColor = [UIColor colorWithRed:220/255.0 green:219/255.0 blue:224/255.0 alpha:1.0].CGColor;
        NSLog(@"下标是：%d",i);
        imageView.title_array = self.all_array[i];
//        imageView.second_lab.text = self.all_array[i][1];
//        imageView.three_lab.text = self.all_array[i][2];
//        imageView.four_lab.text = self.all_array[i][3];
//        imageView.five_lab.text = self.all_array[i][4];
//        imageView.layer.cornerRadius = 6.0;
       [self.scrollerView addSubview:imageView];
    }
        //});
    self.pageController.numberOfPages = 5;//PageController个数
}

//正在滚动时  无论是修改了偏移量 还是用户滑动都会执行
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    self.pageController.currentPage = self.scrollerView.contentOffset.x / self.frame.size.width;
    NSLog(@" 我的标是：%ld",self.pageController.currentPage);
}

@end
