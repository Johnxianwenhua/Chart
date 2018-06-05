//
//  Dhc_TextFieldView.m
//  Dhc_CoalTransport
//
//  Created by ArrogantDevils on 2018/6/4.
//  Copyright © 2018年 Dhc. All rights reserved.
//

#import "Dhc_TextFieldView.h"

@interface Dhc_TextFieldView () <UITextFieldDelegate>

@property (nonatomic, copy) UIImageView *leftImage;

@property (nonatomic, copy) NSString *changeString;

@end

@implementation Dhc_TextFieldView

- (instancetype)initWithFrame:(CGRect)frame ISCode:(BOOL)isCode
{
    if (self = [super initWithFrame:frame]) {
        
        UIImageView *leftImage = [[UIImageView alloc] init];
        
        leftImage.frame = CGRectMake(0, 8, 20, 25);
        
        leftImage.contentMode = UIViewContentModeScaleAspectFill;
        
        [self addSubview:leftImage];
        
        _leftImage = leftImage;
        
        UIView *leftLine = [[UIView alloc] init];
        
        leftLine.frame = CGRectMake(CGRectGetMaxX(leftImage.frame) + 10, 8, 1, frame.size.height - 16);
        
        leftLine.backgroundColor = Navigation_Color;
        
        [self addSubview:leftLine];
        
        UITextField *textField = [[UITextField alloc] init];
        
        textField.frame = CGRectMake(CGRectGetMaxX(leftLine.frame) + 10, 0, frame.size.width - (leftImage.frame.size.width) - (leftLine.frame.size.width) - 20, frame.size.height);
        
        textField.delegate = self;
        
        textField.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:textField];
        
        _textField = textField;
        
        UIView *downLine = [[UIView alloc] init];
        
        downLine.frame = CGRectMake(0, CGRectGetMaxY(textField.frame), frame.size.width, 1);
        
        downLine.backgroundColor = RGBColor(231, 232, 233);
        
        [self addSubview:downLine];
        
        if (isCode == YES) {
            
            textField.frame = CGRectMake(CGRectGetMaxX(leftLine.frame) + 10, 0, 150, frame.size.height);
            
            UIButton *refreshBut = [[UIButton alloc] init];
            
            refreshBut.frame = CGRectMake(frame.size.width - 30, 5, 30, 30);
            
            [refreshBut setImage:[UIImage imageNamed:@"login_Refresh"] forState:UIControlStateNormal];
            
            [refreshBut addTarget:self action:@selector(refreshButClicked) forControlEvents:UIControlEventTouchUpInside];
            
            [self addSubview:refreshBut];
            
            UILabel *codeLabel = [[UILabel alloc] init];
            
            codeLabel.frame = CGRectMake(frame.size.width - 115, 0, 80, 35);
            
            codeLabel.backgroundColor = RGBColor(30, 182, 219);
            
            codeLabel.textColor = [UIColor whiteColor];
            
            codeLabel.textAlignment = NSTextAlignmentCenter;
            
            codeLabel.layer.cornerRadius = 5;
            
            codeLabel.clipsToBounds = YES;
            
            [self addSubview:codeLabel];
            
            _codeLabel = codeLabel;
            
            [self changeCaptchaWithLabel:codeLabel];
        }
    }
    
    return self;
}

- (void)refreshButClicked
{
    [self changeCaptchaWithLabel:_codeLabel];
}

- (void)changeCaptchaWithLabel:(UILabel *)codeLabel
{
    //从字符数组中随机抽取相应数量的字符，组成验证码字符串
    
    //数组中存放的是全部可选的字符，可以是字母，也可以是中文
    
    NSArray *changeArray = [[NSArray alloc] initWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z",nil];
    //如果能确定最大需要的容量，使用initWithCapacity:来设置，好处是当元素个数不超过容量时，添加元素不需要重新分配内存
    
    NSMutableString *getStr = [[NSMutableString alloc] init];
    
    NSMutableString *changeString = [[NSMutableString alloc] init];
    
    //随机从数组中选取需要个数的字符，然后拼接为一个字符串
    
    for(int i = 0; i < 4; i++) {
        
        NSInteger index = arc4random() % ([changeArray count] - 1);
        
        getStr = [changeArray objectAtIndex:index];
        
        changeString = (NSMutableString *)[changeString stringByAppendingString:getStr];
        
    }
    //从网络获取字符串，然后把得到的字符串在本地绘制出来（网络获取步骤在这省略）
    
    codeLabel.text = changeString;
    
    _changeString = [[NSMutableString alloc] initWithString:changeString];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}


- (void)setImageName:(NSString *)imageName
{
    _leftImage.image = [UIImage imageNamed:imageName];
}

- (void)setPlacehold:(NSString *)placehold
{
    _textField.placeholder = placehold;
}

@end
