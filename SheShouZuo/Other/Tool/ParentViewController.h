//
//  ParentViewController.h
//  SheShouZuo
//
//  Created by qianfeng on 16/6/16.
//  Copyright © 2016年 1077. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SQMessageController.h"


//@protocol PushToOtherController<NSObject>
//-(void)appearOtherView:(SQMessageController *)vc;
//
//@end

@interface ParentViewController : UIViewController
@property(nonatomic,strong)NSNumber *ID;
//@property(nonatomic,weak) id<PushToOtherController> delegate;
@end
