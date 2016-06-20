//
//  HomeHeader.h
//  SheShouZuo
//
//  Created by qianfeng on 16/6/19.
//  Copyright © 2016年 1077. All rights reserved.
//

#ifndef HomeHeader_h
#define HomeHeader_h
//第三方
#import "SQNetWork.h"
#import "ZJScrollPageView.h"
#import "MJRefresh.h"
#import "UIImageView+WebCache.h"

//cell
#import "SQTableCell.h"
#import "SQOneCell.h"
#import "SQThreeCell.h"


//Controller
#import "ParentViewController.h"
#import "SQMessageController.h"

//Model
#import "SQHomeModelOne.h"
#import "SQTwoModel.h"
#import "SQThreeModel.h"




#define HOME  @"http://api.hisihi.com/v1/information_flow/column"
#define HOME_ZIXUN @"http://api.hisihi.com/v1/information_flow/content?type=%d&page=%d&per_page=%d"
#define SC_H   [UIScreen mainScreen].bounds.size.height
#define SC_W   [UIScreen mainScreen].bounds.size.width

#define MODEL_STRING(KEY) @property(nonatomic,copy)NSString *KEY
#define MODEL_NSNUMBER(KEY) @property(nonatomic,strong)NSNumber *KEY









#endif /* HomeHeader_h */
