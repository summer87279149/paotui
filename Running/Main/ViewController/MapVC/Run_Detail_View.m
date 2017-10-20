//
//  Run_Detail_View.m
//  Running
//
//  Created by 吕志杰 on 2017/8/28.
//  Copyright © 2017年 吕志杰. All rights reserved.
//

#import "Run_Detail_View.h"

@implementation Run_Detail_View
-(void)awakeFromNib{
    [super awakeFromNib];
    _white = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight, kScreenWidth, 20)];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth-45, 0, 50, 20)];
    [btn setTitle:@"完成" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn setTitleColor:[UIColor jk_colorWithHexString:@"#FF2E89"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(chooseDate) forControlEvents:UIControlEventTouchUpInside];
    [_white addSubview: btn];
    self.datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, kScreenHeight+20, kScreenWidth, 200)];
    self.datePicker.minimumDate = [NSDate date];
    self.datePicker.backgroundColor = [UIColor whiteColor];
    self.datePicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
}

- (void)didMoveToSuperview{
    [super didMoveToSuperview];
    [self.superview addSubview:_white];
    [self.superview addSubview:self.datePicker];
    [self.superview bringSubviewToFront:self.datePicker];
    [self.superview bringSubviewToFront:self.white];
}
-(void)chooseDate{
    
    [UIView animateWithDuration:0.3 animations:^{
        self.white.frame = CGRectMake(0, kScreenHeight, kScreenWidth, 20);
        self.datePicker.frame = CGRectMake(0, kScreenHeight+20, kScreenWidth, 200);
    } completion:^(BOOL finished) {
        if(self.delegate){
            [self.delegate chooseDateCallback:self.datePicker.date];
        }
        
    }];
}
-(instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        
    }
    return self;
}

- (IBAction)goTime:(UIButton *)sender {
    [UIView animateWithDuration:0.3 animations:^{
        self.white.frame =CGRectMake(0, kScreenHeight-244-20, kScreenWidth, 20);
        self.datePicker.frame = CGRectMake(0, kScreenHeight-244, kScreenWidth, 200);
    }];
}

- (IBAction)start:(UIButton *)sender {
    if(self.delegate){
        [self.delegate start:sender];
    }
}
- (IBAction)end:(UIButton *)sender {
    if(self.delegate){
        [self.delegate end:sender];
    }
}

- (IBAction)say_click:(id)sender {
    self.say_block();
}
- (IBAction)kuai_click:(id)sender {
    self.kuai_block();
}

- (IBAction)ping_click:(id)sender {
    self.ping_block();
}
@end
