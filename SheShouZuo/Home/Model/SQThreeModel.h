//
//  SQThreeModel.h
//  SheShouZuo
//
//  Created by qianfeng on 16/6/19.
//  Copyright © 2016年 1077. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SQThreeModel : NSObject
@property(nonatomic,copy)NSString *content_url;
@property(nonatomic,copy)NSString *pic;
+(SQThreeModel *)createModelWithDictionary:(NSDictionary *)dic;

@end
/*
 
 adv_info
 content_url : "http://hisihi.com/app.php/public/topcontent/version/2.7/type/view/id/8212"
 pic : "http://advs-pic.oss-cn-qingdao.aliyuncs.com/2016-06-15/576111424e365.jpg"
 size
 title : "2016年上半年字体设计合集"
 type : "advertisment"
 content_type : 3
 
 
 */