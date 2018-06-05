//
//  Dhc_ContractBaseController.h
//  Dhc_CoalTransport
//
//  Created by ArrogantDevils on 2018/5/29.
//  Copyright © 2018年 Dhc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Dhc_ContractBaseController : UIViewController

@property (nonatomic, copy) NSString *bus_type;   //（1：铁销；2：地销；3：港销）

@property (nonatomic, copy) NSString *titleString;

@end
