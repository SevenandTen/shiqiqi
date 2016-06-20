//
//  SQHomeController.m
//  SheShouZuo
//
//  Created by qianfeng on 16/6/16.
//  Copyright © 2016年 1077. All rights reserved.
//

#import "SQHomeController.h"
#import "HomeHeader.h"





@interface SQHomeController ()  //<PushToOtherController>
@property(nonatomic,strong)ZJScrollPageView *pageView;
@property(nonatomic,strong)NSMutableArray *dataSource;





@end

@implementation SQHomeController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden=NO;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent=NO;
    self.navigationItem.backBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
   
        //self.navigationController.navigationBar.hidden=YES;
    
    [self loadData];
   // [self createPageView];
    

    
   
    self.view.backgroundColor=[UIColor whiteColor];
    // Do any additional setup after loading the view.
}
//---------------------------------------------------------------
//从网络下载数据
-(void)loadData{
    SQNetWork *net=[SQNetWork sharedNetWork];
    [net requestDataWithType:GET andUrl:HOME andPara:nil andSucBlock:^(NSURLSessionDataTask *task, id response) {
        if (response) {
            
            
            NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableContainers error:nil];
            NSArray *array=dic[@"data"];
            SQHomeModelOne *model1=[[SQHomeModelOne alloc] init];
            model1.title=@"推荐";
            model1.ID =@(1);
            [self.dataSource addObject:model1];
            
            for (NSDictionary *dict in array) {
                SQHomeModelOne *model=[SQHomeModelOne createModelWithDictionary:dict];
                [self.dataSource addObject:model];
            }
            SQHomeModelOne *model2=[[SQHomeModelOne alloc] init];
            model2.title=@"其他";
            model2.ID =@(6);
            [self.dataSource addObject:model2];
        //NSLog(@"aaaaa");
            [self createPageView];
        }else {
            NSLog(@"请求数据为空");
        }
        
    } andFailBlock:^(NSError *error, NSURLSessionDataTask *task) {
        NSLog(@"%@",error.localizedDescription);
    }];
}
//---------------------------------------------------------------
//创建分页控制器
-(void)createPageView{
    self.automaticallyAdjustsScrollViewInsets=NO;
    ZJSegmentStyle *style=[[ZJSegmentStyle alloc] init];
    style.showLine=YES;
    style.showExtraButton=NO;
    NSMutableArray *childControllers=[[NSMutableArray alloc] init ];
  
    for (SQHomeModelOne *model in self.dataSource) {
        
        ParentViewController * vc=[[ParentViewController alloc] init];
        vc.title=model.title;
        vc.ID=model.ID;
        //vc.delegate=self;
        //vc.view.backgroundColor=[UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
        [childControllers addObject:vc];
        
    
    }
    _pageView =[[ZJScrollPageView alloc] initWithFrame:CGRectMake(0, 0, SC_W, SC_H) segmentStyle:style childVcs:childControllers parentViewController:self];
    
    [self.view addSubview:_pageView];
    
}
#pragma mark -delegate
//-(void)appearOtherView:(SQMessageController *)vc{
//
//    [self.navigationController pushViewController:vc animated:YES];
//    
//    
//}


    
    


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark 懒加载
-(NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource=[[NSMutableArray alloc] init];
        
        
        
    }
    return _dataSource;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
