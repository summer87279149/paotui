//
//  Say_ViewController.m
//  Running
//
//  Created by 吕志杰 on 2017/8/28.
//  Copyright © 2017年 吕志杰. All rights reserved.
//

#import "Say_ViewController.h"

@interface Say_ViewController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *maintextview;
- (IBAction)submit_click:(id)sender;

@end

@implementation Say_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.maintextview.delegate = self;
    self.maintextview.text = @"输入备注(留言)";
    self.maintextview.textColor = [UIColor grayColor];
}

#pragma mark - UITextViewDelegate
- (void)textViewDidEndEditing:(UITextView *)textView
{
    if(textView.text.length < 1){
        textView.text = @"输入备注(留言)";
        textView.textColor = [UIColor grayColor];
    }
}
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if([textView.text isEqualToString:@"输入备注(留言)"]){
        textView.text=@"";
        textView.textColor=[UIColor blackColor];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (IBAction)submit_click:(id)sender {
    self.result_block(@"还是用前文的案例，本次使用Block来实现");
    [self.navigationController popViewControllerAnimated:YES];
}
@end
