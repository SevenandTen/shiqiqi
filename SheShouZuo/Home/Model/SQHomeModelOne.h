//
//  SQHomeModelOne.h
//  SheShouZuo
//
//  Created by qianfeng on 16/6/18.
//  Copyright © 2016年 1077. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SQHomeModelOne : NSObject
@property(nonatomic,strong)NSNumber *ID;
@property(nonatomic,copy)NSString *title;

+(SQHomeModelOne *)createModelWithDictionary:(NSDictionary *)dic;

@end


//id : 15
//title : "摄影"