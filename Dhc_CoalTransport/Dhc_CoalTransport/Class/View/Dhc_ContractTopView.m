//
//  Dhc_ContractTopView.m
//  Dhc_CoalTransport
//
//  Created by ArrogantDevils on 2018/5/29.
//  Copyright © 2018年 Dhc. All rights reserved.
//

#import "Dhc_ContractTopView.h"

@interface Dhc_ContractTopView () <UITextFieldDelegate>

@property (nonatomic, copy) UILabel *titleLabel;

@end

@implementation Dhc_ContractTopView

- (void)setTitleString:(NSString *)titleString
{    
    _titleLabel.text = titleString;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = RGBColor(242, 241, 242);
        
        UIView *backGroundView = [[UIView alloc] init];
        
        backGroundView.frame = CGRectMake(0, 0, Screen_Size_Width, 98);
        
        backGroundView.backgroundColor = Navigation_Color;
        
        [self addSubview:backGroundView];
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20, 30, 25, 25)];
        
        [button setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        
        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        
        [backGroundView addSubview:button];
                
        UILabel *titleLabel = [[UILabel alloc] init];
        
        titleLabel.frame = CGRectMake((Screen_Size_Width - 150) / 2, 28, 150, 30);
        
        titleLabel.textColor = [UIColor whiteColor];
        
        titleLabel.font = F20;
        
        titleLabel.textAlignment = NSTextAlignmentCenter;
        
        [backGroundView addSubview:titleLabel];
        
        _titleLabel = titleLabel;
        
        UIButton *filterBut = [[UIButton alloc] init];
        
        filterBut.frame = CGRectMake(Screen_Size_Width - 80, CGRectGetMaxY(titleLabel.frame) + 10, 60, 45);
        
        [filterBut setImage:[UIImage imageNamed:@"filter"] forState:UIControlStateNormal];
        
        filterBut.backgroundColor = [UIColor whiteColor];
        
        filterBut.layer.cornerRadius = 10;
        
        filterBut.clipsToBounds = YES;
                
        _filterBut = filterBut;
        
        Dhc_ContractField *textFiled = [[Dhc_ContractField alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(titleLabel.frame) + 10, Screen_Size_Width - 80 - filterBut.frame.size.width, 45)];
        
        _textField = textFiled;
        
        [[[UIApplication sharedApplication] keyWindow] addSubview:textFiled];

    }
    
    return self;
}

- (void)back
{
    [[self viewController].navigationController popViewControllerAnimated:YES];
}

- (UIViewController *)viewController
{
    for (UIView *next = [self superview]; next; next = next.superview) {
        
        UIResponder *nextResponder = [next nextResponder];
        
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            
            return (UIViewController *)nextResponder;
        }
    }
    
    return nil;
}

@end
