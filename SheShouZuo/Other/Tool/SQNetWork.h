//
//  SQNetWork.h
//  SheShouZuo
//
//  Created by qianfeng on 16/6/16.
//  Copyright © 2016年 1077. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "Reachability.h"
//---------------------------------------------------------------
typedef enum{
    GET,
    POST,
   
    
} RequestType ;
//---------------------------------------------------------------
typedef void(^sucBlock)(NSURLSessionDataTask *task,id response) ;
//---------------------------------------------------------------
typedef void(^failBlock)(NSError *error,NSURLSessionDataTask *task);
//---------------------------------------------------------------
@interface SQNetWork : NSObject
@property(nonatomic,strong)AFHTTPSessionManager *manager;

+(SQNetWork *)sharedNetWork;
-(void)requestDataWithType:(ResType)type
                    andUrl:(NSString *)url
                   andPara:(NSDictionary *)dic
               andSucBlock:(sucBlock)sunBlock
              andFailBlock:(failBlock)failBlock;







@end
