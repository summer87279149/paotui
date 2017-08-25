//
//  UIView.m
//  2017
//
//  Created by lvzhijie on 2017/1/5.
//  Copyright © 2017年 lvzhijie. All rights reserved.
//

#import "UIView.h"

@implementation UIView(IB)

- (void)setCornerRadius:(NSInteger)cornerRadius{
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
}

- (NSInteger)cornerRadius{
    return self.layer.cornerRadius;
}

- (void)setBorderWidth:(float)borderWidth{
    self.layer.borderWidth = borderWidth;
}

- (float)borderWidth{
    return self.layer.borderWidth;
}

-(void)setBorderColor:(UIColor *)borderColor{
    self.layer.borderColor = borderColor.CGColor;
}

-(UIColor *)borderColor{
    return [UIColor colorWithCGColor:self.layer.borderColor];
}
//
//阴影的颜色
- (void)setShadowColor:(UIColor *)shadowColor{
    self.layer.shadowColor = shadowColor.CGColor;
}

- (UIColor*)shadowColor{
    return [UIColor colorWithCGColor:self.layer.shadowColor];
}

//阴影的圆角
- (void)setShadowRadius:( float)shadowRadius{
    self.layer.shadowRadius = shadowRadius;
}

- (float)shadowRadius{
    return self.layer.shadowRadius;
}

//阴影的透明度
- (void)setShadowOpacity:( float)shadowOpacity{
    self.layer.shadowOpacity = shadowOpacity;
}

- (float)shadowOpacity{
    return self.layer.shadowOpacity;
}

@end
