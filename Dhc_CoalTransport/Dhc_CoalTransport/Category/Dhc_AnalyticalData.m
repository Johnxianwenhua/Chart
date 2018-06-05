//
//  Dhc_AnalyticalData.m
//  Dhc_CoalTransport
//
//  Created by ArrogantDevils on 2018/5/30.
//  Copyright © 2018年 Dhc. All rights reserved.
//

#import "Dhc_AnalyticalData.h"

#import "Dhc_ContractModel.h"

@implementation Dhc_AnalyticalData

+ (NSMutableArray *)contractData:(NSDictionary *)data
{
    NSMutableArray *dataSource = [[NSMutableArray alloc] init];
    
    NSString *flag = data[@"flag"];
    
    if (flag.length == Success_Status) {
        
        for (NSDictionary *dict in data[@"data"]) {
            
            Dhc_ContractModel *model = [[Dhc_ContractModel alloc] init];
            
            [model setValuesForKeysWithDictionary:dict];
            
            [dataSource addObject:model];
        
        }
        
    } else {
        
        [SVProgressHUD showErrorWithStatus:data[@"msg"]];
        
        [SVProgressHUD dismissWithDelay:1];
        
    }
    
    return dataSource;
}

@end
