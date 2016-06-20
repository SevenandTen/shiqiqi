//
//  SQTwoModel.m
//  SheShouZuo
//
//  Created by qianfeng on 16/6/19.
//  Copyright © 2016年 1077. All rights reserved.
//

#import "SQTwoModel.h"

@implementation SQTwoModel
+(SQTwoModel *)createModelWithDictioary:(NSDictionary *)dic{
    SQTwoModel *model=[[SQTwoModel alloc] init];
    [model setValuesForKeysWithDictionary:dic];
    return model;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
@end
