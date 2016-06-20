//
//  SQHomeModelOne.m
//  SheShouZuo
//
//  Created by qianfeng on 16/6/18.
//  Copyright © 2016年 1077. All rights reserved.
//

#import "SQHomeModelOne.h"

@implementation SQHomeModelOne
+(SQHomeModelOne *)createModelWithDictionary:(NSDictionary *)dic{
    SQHomeModelOne *model=[[SQHomeModelOne alloc] init];
    
    [model setValuesForKeysWithDictionary:dic];
    return model;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"ID"];
    }
}


@end



