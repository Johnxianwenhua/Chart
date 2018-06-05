//
//  Dhc_LoginDownView.m
//  Dhc_CoalTransport
//
//  Created by ArrogantDevils on 2018/6/4.
//  Copyright © 2018年 Dhc. All rights reserved.
//

#import "Dhc_LoginDownView.h"

@implementation Dhc_LoginDownView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        Dhc_TextFieldView *userName = [[Dhc_TextFieldView alloc] initWithFrame:CGRectMake(50, 30, frame.size.width - 100, 40) ISCode:NO];
        
        userName.placehold = @"请输入用户名";
        
        userName.imageName = @"login_UserName";
        
        [self addSubview:userName];
        
        _userName = userName;
        
        Dhc_TextFieldView *passWord = [[Dhc_TextFieldView alloc] initWithFrame:CGRectMake(50, CGRectGetMaxY(userName.frame) + 30, frame.size.width - 100, 40) ISCode:NO];
        
        passWord.placehold = @"请输入密码";
        
        passWord.imageName = @"login_Password";
        
        passWord.textField.secureTextEntry = YES;
        
        [self addSubview:passWord];
        
        _passWord = passWord;

        Dhc_TextFieldView *code = [[Dhc_TextFieldView alloc] initWithFrame:CGRectMake(50, CGRectGetMaxY(passWord.frame) + 30, frame.size.width - 100, 40) ISCode:YES];
        
        code.placehold = @"请输入验证码";
        
        code.imageName = @"login_Code";
                
        [self addSubview:code];
        
        _code = code;
        
        UIButton *loginBut = [[UIButton alloc] init];
        
        loginBut.frame = CGRectMake(50, CGRectGetMaxY(code.frame) + 40, frame.size.width - 100, 40);
        
        loginBut.backgroundColor = RGBColor(30, 182, 219);
        
        [loginBut setTitle:@"登    录" forState:UIControlStateNormal];
        
        [loginBut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        loginBut.layer.cornerRadius = 5;
        
        [loginBut addTarget:self action:@selector(Login) forControlEvents:UIControlEventTouchUpInside];
        
        loginBut.clipsToBounds = YES;
        
        [self addSubview:loginBut];
    }
    
    return self;
}

- (void)Login
{
    if ([_userName.textField.text isEqualToString:@""]) {
        
        [SVProgressHUD showErrorWithStatus:@"用户名不能为空......"];
        
    } else if ([_passWord.textField.text isEqualToString:@""]) {
        
        [SVProgressHUD showErrorWithStatus:@"密码不能为空......"];

    } else if ([_code.textField.text isEqualToString:@""]) {
        
        [SVProgressHUD showErrorWithStatus:@"验证码不能为空......"];

    } else if ([_code.textField.text caseInsensitiveCompare:_code.codeLabel.text] != NSOrderedSame) {
        
        [SVProgressHUD showErrorWithStatus:@"验证码错误......"];

    } else {
        
        [self createLoginData];
    }
}

- (void)createLoginData
{
    NSDictionary *param = [[NSDictionary alloc] initWithObjectsAndKeys:_userName.textField.text,@"username",_passWord.textField.text,@"passwd", nil];
    
    [Dhc_HttpTool PostWithUrl:LoginUrl Params:param Success:^(id json) {
        
        NSDictionary *dict = [[NSDictionary alloc] initWithDictionary:json];
        
        NSString *idString = dict[@"isLogonSucc"];
        
        if (idString.length == Error_Status) {
            
            [SVProgressHUD showErrorWithStatus:dict[@"msg"]];
            
        } else {
            
            [SVProgressHUD showInfoWithStatus:dict[@"msg"]];
            
            [SVProgressHUD dismissWithCompletion:^{
               
                NSLog(@"强制登录后，应切换跟视图到首页");
                
            }];

        }
        
    } Failure:^(NSError *error) {
        
        if (error != nil) {
            
            [SVProgressHUD showErrorWithStatus:@"系统繁忙......"];
            
            NSLog(@"%@",error);
        }
        
    }];
}

@end
