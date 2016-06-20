//
//  SQTwoModel.h
//  SheShouZuo
//
//  Created by qianfeng on 16/6/19.
//  Copyright © 2016年 1077. All rights reserved.
//

#import <Foundation/Foundation.h>

#define MODEL_STRING(KEY)    @property(nonatomic,copy)NSString *KEY
#define MODEL_NSNUMBER(KEY) @property(nonatomic,strong)NSNumber *KEY

@interface SQTwoModel : NSObject
MODEL_STRING(img);
//@property(nonatomic,copy) NSString *logo_pic;
//@property(nonatomic,copy) NSString *titles;
MODEL_STRING(title);
MODEL_STRING(source_name);
MODEL_NSNUMBER(view);
MODEL_STRING(content_url);
MODEL_STRING(share_url);
MODEL_NSNUMBER(cover_type);

+(SQTwoModel *)createModelWithDictioary:(NSDictionary *)dic;

@end


/*
 content_url : "http://hisihi.com/app.php/public/topcontent/version/2.0/type/view/id/8533"
 cover_type : 1
 create_time : 1466308620
 description : ""
 id : 8533
 img : "http://forum-pic.oss-cn-qingdao.aliyuncs.com/2016-06-19/5766181f545c7.jpg"
 isFavorited : false
 isSupportd : false
 logo_pic : "http://hisihi-other.oss-cn-qingdao.aliyuncs.com/2016-06-18/5764c026ef4b4.jpg"
 share_url : "http://hisihi.com/app.php/public/v2contentforshare/type/view/version/2.3/id/8533"
 source_name : "尖叫设计"
 supportCount : 74
 title : "那些谱写了设计史的爸爸们"
 update_time : 1466308666
 view : 2025
 
 
 */