//
//  Dhc_HttpTool.m
//  Dhc_CoalTransport
//
//  Created by ArrogantDevils on 2018/5/29.
//  Copyright © 2018年 Dhc. All rights reserved.
//

#import "Dhc_HttpTool.h"

#import "AFNetworking.h"

#define TimeoutInterval  60.f

@implementation Dhc_HttpTool

+ (AFHTTPSessionManager *)sessionManager
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.requestSerializer = [AFHTTPRequestSerializer  serializer];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/xml", @"text/plain", nil];
    
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    
    // 设置超时时间
    manager.requestSerializer.timeoutInterval = TimeoutInterval;
    
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    return manager;
}

/**
 * 发送一个GET请求
 */
+(void)GetWithUrl:(NSString *)url Params:(NSDictionary *)params Success:(void (^)(id ))success Failure:(void (^)(NSError *))failure
{
    AFHTTPSessionManager *manager = [self sessionManager];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    [SVProgressHUD showWithStatus:@"加载中，请稍后......"];
    
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    
    [manager GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        if (success && responseObject) {
            
            NSArray *dataArray = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
            
            if (dataArray) {
                
                success (dataArray);
                
            } else {
                
                NSDictionary *dataDict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                
                success (dataDict);
            }
            
        } else {
            
            [SVProgressHUD showWithStatus:@"暂无数据......"];
            
        }
        
        [SVProgressHUD dismiss];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        if(error) {
            
            [SVProgressHUD showWithStatus:@"服务器错误......"];
            
            [SVProgressHUD dismissWithCompletion:^{
                
                NSLog(@"%@",error);
                
                failure(error);
                
            }];
        }
    }];
}
/**
 * 发送一个POST请求
 */
+ (void)PostWithUrl:(NSString *)url Params:(NSDictionary *)params Success:(void (^)(id))success Failure:(void (^)(NSError *))failure
{
    AFHTTPSessionManager *manager = [self sessionManager];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    [SVProgressHUD showWithStatus:@"加载中，请稍后......"];
    
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    
    [manager POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        if(success && responseObject) {
            
            NSArray *dataArray = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
            
            if (dataArray) {
                
                success (dataArray);
                
            } else {
                
                NSDictionary *dataDict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                
                success (dataDict);
            }
            
        } else {
            
            [SVProgressHUD showWithStatus:@"暂无数据......"];
            
        }
        
        [SVProgressHUD dismissWithDelay:1];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
        
        if(error){
            
            [SVProgressHUD showWithStatus:@"服务器错误......"];
            
            [SVProgressHUD dismissWithCompletion:^{
                
                NSLog(@"%@",error);
                
                failure(error);
                
            }];
        }
    }];
}

@end
