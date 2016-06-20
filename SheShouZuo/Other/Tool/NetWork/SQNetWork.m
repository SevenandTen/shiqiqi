//
//  SQNetWork.m
//  SheShouZuo
//
//  Created by qianfeng on 16/6/16.
//  Copyright © 2016年 1077. All rights reserved.
//

#import "SQNetWork.h"


@interface SQNetWork()

@end

@implementation SQNetWork
//---------------------------------------------------------------
/**
 *  重写init方法
 *
 *  @return
 */
-(instancetype)init{
    if (self=[super init]) {
        _manager=[AFHTTPSessionManager manager];
        _manager.responseSerializer=[AFHTTPResponseSerializer serializer];
        _manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"text/html",@"application/json", nil];
        
        
    }
    return self;
}
//---------------------------------------------------------------
/**
 *  单列方法
 *
 *  @return 类对象
 */
+(SQNetWork *)sharedNetWork{
    static SQNetWork *net=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        
        net=[[SQNetWork alloc] init];
        
    
    });
    return net;
    
    
    
}
//---------------------------------------------------------------
+ (BOOL)isEnableInternet{
    
    //检查当前网络是否可用
    return [[Reachability reachabilityForInternetConnection] isReachable];
    
}


//---------------------------------------------------------------
/**
 *  请求方法
 *
 *  @param type      请求类型
 *  @param url       请求路径
 *  @param dic       拼接参数
 *  @param sucBlock  成功回调Block
 *  @param failBlock 失败回调Block
 */
-(void)requestDataWithType:(ResType)type
                    andUrl:(NSString *)url
                   andPara:(NSDictionary *)dic
               andSucBlock:(sucBlock)sucBlock
              andFailBlock:(failBlock)failBlock{
    if (![SQNetWork isEnableInternet]) {
        NSError *error=[NSError errorWithDomain:@"无网络" code:9999 userInfo:nil];
        failBlock(error,nil);
    }
    else{
    
    
    if (type==GET) {
        [self.manager GET:url parameters:dic success:^(NSURLSessionDataTask *task, id responseObject) {
            if ([(NSHTTPURLResponse*)task.response statusCode]/100==2) {
                sucBlock(task,responseObject);
                
            }
            else{
                NSError *error=nil;
                failBlock(error,task);
                
            }
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            failBlock(error,task);
        }];
    }
    else{
        [self.manager POST:url parameters:dic success:^(NSURLSessionDataTask *task, id responseObject) {
            if ([(NSHTTPURLResponse*)task.response statusCode]/100==2) {
                sucBlock(task,responseObject);
                
            }
            else{
                NSError *error=nil;
                failBlock(error,task);
            }
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            failBlock(error,task);
        }];
    }
}
}


@end
