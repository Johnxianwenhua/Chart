//
//  Dhc_ContractField.m
//  Dhc_CoalTransport
//
//  Created by ArrogantDevils on 2018/5/29.
//  Copyright © 2018年 Dhc. All rights reserved.
//

#import "Dhc_ContractField.h"

@interface Dhc_ContractField () <UITextFieldDelegate>

@end

@implementation Dhc_ContractField

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        self.layer.cornerRadius = 10;
        
        self.clipsToBounds = YES;
        
        self.font = F15;
        
        [self setValue:F15 forKeyPath:@"_placeholderLabel.font"];
        
        self.placeholder = @"请输入搜索的内容";
        
        UIImageView *imageViewU = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 24, 24)];
        
        imageViewU.image = [UIImage imageNamed:@"search"];
        
        self.leftView = imageViewU;
        
        self.leftViewMode = UITextFieldViewModeAlways;
        
        self.delegate = self;
        
    }
    
    return self;
}

// 返回placeholderLabel的bounds，改变返回值，是调整placeholderLabel的位置
- (CGRect)placeholderRectForBounds:(CGRect)bounds
{
    return CGRectMake(55, 5, self.bounds.size.width, self.bounds.size.height);
}
// 这个函数是调整placeholder在placeholderLabel中绘制的位置以及范围
- (void)drawPlaceholderInRect:(CGRect)rect
{
    [super drawPlaceholderInRect:CGRectMake(0, -6 , self.bounds.size.width, self.bounds.size.height)];
}

// 控制还未输入时文本的位置，缩进40
- (CGRect)textRectForBounds:(CGRect)bounds
{
    return CGRectInset(bounds, 45, 0);
}
// 控制输入后文本的位置，缩进20
- (CGRect)editingRectForBounds:(CGRect)bounds
{
    return CGRectInset(bounds, 45, 0);
}

- (CGRect)leftViewRectForBounds:(CGRect)bounds
{
    CGRect iconRect = [super leftViewRectForBounds:bounds];
    
    iconRect.origin.x += 15; //像右边偏15
    
    return iconRect;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self resignFirstResponder];
    
    [UIView animateWithDuration:0.5 animations:^{
        
        self.superview.transform = CGAffineTransformIdentity;
        
    }];
    
}

@end
