//
//  Dhc_LoginController.m
//  Dhc_CoalTransport
//
//  Created by ArrogantDevils on 2018/6/4.
//  Copyright © 2018年 Dhc. All rights reserved.
//

#import "Dhc_LoginController.h"

#import "Dhc_LoginTopView.h"

#import "Dhc_LoginDownView.h"

#import "UIAutoScrollView.h"

@interface Dhc_LoginController ()

@property (nonatomic, strong) UIAutoScrollView *tmpScrollView;

@property (nonatomic, strong) Dhc_LoginDownView *downView;

@end

@implementation Dhc_LoginController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addView];

}

- (void)addView
{
    UIAutoScrollView *scrollView = [[UIAutoScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-self.navigationController.navigationBar.frame.size.height-[UIApplication sharedApplication].statusBarFrame.size.height)];
    
    scrollView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(releaseKeyboard:)];
    
    [scrollView addGestureRecognizer:tap];
    
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 700);
    
    self.tmpScrollView = scrollView;
    
    [self.view addSubview:scrollView];
    
    Dhc_LoginTopView *topView = [[Dhc_LoginTopView alloc] initWithFrame:CGRectMake(0, 0, Screen_Size_Width, Screen_Size_Height / 2)];
    
    [scrollView addSubview:topView];
    
    Dhc_LoginDownView *downView = [[Dhc_LoginDownView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(topView.frame), Screen_Size_Width, Screen_Size_Height / 2)];
    
    [scrollView addSubview:downView];
    
    _downView = downView;
    
    [scrollView addAutoScrollAbility];
    
}

- (void)releaseKeyboard:(UITapGestureRecognizer *)tap
{
    [_downView.userName.textField resignFirstResponder];
    
    [_downView.passWord.textField resignFirstResponder];
    
    [_downView.code.textField resignFirstResponder];
}

@end
