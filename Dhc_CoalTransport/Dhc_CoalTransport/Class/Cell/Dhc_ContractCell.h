//
//  Dhc_ContractCell.h
//  Dhc_CoalTransport
//
//  Created by ArrogantDevils on 2018/5/29.
//  Copyright © 2018年 Dhc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Dhc_ContractModel.h"

#define Dhc_ContractCellID @"Dhc_ContractCell"

@interface Dhc_ContractCell : UITableViewCell

@property (nonatomic, copy) Dhc_ContractModel *model;

@end
