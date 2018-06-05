//
//  Dhc_HttpTool.h
//  Dhc_CoalTransport
//
//  Created by ArrogantDevils on 2018/5/29.
//  Copyright © 2018年 Dhc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dhc_HttpTool : NSObject

/**
 * 发送一个GET请求
 */
+(void)GetWithUrl:(NSString *)url Params:(NSDictionary *)params Success:(void (^)(id ))success Failure:(void (^)(NSError *))failure;

/**
 * 发送一个POST请求
 */
+ (void)PostWithUrl:(NSString *)url Params:(id)params Success:(void(^)(id json) )success Failure:(void (^)(NSError *error))failure;


@end
