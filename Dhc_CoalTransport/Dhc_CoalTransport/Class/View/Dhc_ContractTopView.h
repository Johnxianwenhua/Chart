//
//  Dhc_ContractTopView.h
//  Dhc_CoalTransport
//
//  Created by ArrogantDevils on 2018/5/29.
//  Copyright © 2018年 Dhc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Dhc_ContractField.h"

@interface Dhc_ContractTopView : UIView

@property (nonatomic, copy) NSString *titleString;

@property (nonatomic, strong) UIButton *filterBut;

@property (nonatomic, strong) Dhc_ContractField *textField;

@end
