//
//  SQThreeModel.m
//  SheShouZuo
//
//  Created by qianfeng on 16/6/19.
//  Copyright © 2016年 1077. All rights reserved.
//

#import "SQThreeModel.h"

@implementation SQThreeModel
+(SQThreeModel *)createModelWithDictionary:(NSDictionary *)dic{
    SQThreeModel *model=[[SQThreeModel alloc] init];
    [model setValuesForKeysWithDictionary:dic];
    return model;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
@end
