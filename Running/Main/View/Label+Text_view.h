//
//  Label+Text_view.h
//  Running
//
//  Created by 吕志杰 on 2017/8/26.
//  Copyright © 2017年 吕志杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Label_Text_view : UIView
/** 设置显示的文本 */
@property (nonatomic, copy) NSString *movingText;
/** 这个标签用于滚动显示文字 */
@property (nonatomic, strong) UILabel *movingLabel;

@end
