//
//  Dhc_TextFieldView.h
//  Dhc_CoalTransport
//
//  Created by ArrogantDevils on 2018/6/4.
//  Copyright © 2018年 Dhc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Dhc_TextFieldView : UIView

@property (nonatomic, copy) NSString *imageName;

@property (nonatomic, copy) NSString *placehold;

@property (nonatomic, copy) UITextField *textField;

@property (nonatomic, copy) UILabel *codeLabel;

- (instancetype)initWithFrame:(CGRect)frame ISCode:(BOOL)isCode;

@end
