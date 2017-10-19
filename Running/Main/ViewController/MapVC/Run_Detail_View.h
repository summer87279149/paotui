//
//  Run_Detail_View.h
//  Running
//
//  Created by 吕志杰 on 2017/8/28.
//  Copyright © 2017年 吕志杰. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol Run_Detail_ViewBtnClickDelegate<NSObject>
@required
//出发地按钮和目的地按钮的delegate
-(void)start:(UIButton*)sender;
-(void)end:(UIButton*)sender;
@end

@interface Run_Detail_View : UIView
//xt
@property (weak, nonatomic) IBOutlet UITextField *startText;
@property (weak, nonatomic) IBOutlet UITextField *endText;
@property (weak, nonatomic) IBOutlet UITextField *distanceText;



//lzj
@property (nonatomic, weak) id<Run_Detail_ViewBtnClickDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIButton *say_btn;
- (IBAction)say_click:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *main_textview;
@property (weak, nonatomic) IBOutlet UIButton *kuai_btn;
@property (weak, nonatomic) IBOutlet UIButton *ping_btn;
- (IBAction)kuai_click:(id)sender;
- (IBAction)ping_click:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *kuai_img;
@property (weak, nonatomic) IBOutlet UIImageView *ping_img;
@property (strong,nonatomic) void(^say_block)();
@property (copy,nonatomic) void(^kuai_block)();
@property (copy,nonatomic) void(^ping_block)();
@property (weak, nonatomic) IBOutlet UILabel *five_lab;
@property (weak, nonatomic) IBOutlet UILabel *five_second_lab;
@property (weak, nonatomic) IBOutlet UITextField *four_textfield;
@property (weak, nonatomic) IBOutlet UILabel *four_lab;
@property (weak, nonatomic) IBOutlet UILabel *five_first_lab;
@end
