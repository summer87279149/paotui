//
//  Run_Detail_View.m
//  Running
//
//  Created by 吕志杰 on 2017/8/28.
//  Copyright © 2017年 吕志杰. All rights reserved.
//

#import "Run_Detail_View.h"

@implementation Run_Detail_View

-(instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        
    }
    return self;
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
