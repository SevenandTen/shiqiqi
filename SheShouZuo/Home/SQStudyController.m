//
//  SQStudyController.m
//  SheShouZuo
//
//  Created by qianfeng on 16/6/16.
//  Copyright © 2016年 1077. All rights reserved.
//

#import "SQStudyController.h"
#import "SQNetWork.h"
#import "MJRefresh.h"

#define SC_W  [UIScreen mainScreen].bounds.size.width
#define SC_H   [UIScreen mainScreen].bounds.size.height
#define URL_VIDEO @"http://hisihi.com/api.php?s=Organization/appGetCoursesList&page=%d&count=%d"



@interface SQStudyController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataSource;
@property(nonatomic,assign) int page;

@end

@implementation SQStudyController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title=@"学习";
    
    
    self.view.backgroundColor=[UIColor whiteColor];
    // Do any additional setup after loading the view.
}
-(void)createUI{
    _tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0,SC_W , SC_H)];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    
    [self.view addSubview:_tableView];
    MJRefreshNormalHeader *header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadData];
    }];
    _tableView.header=header;
    
    MJRefreshBackNormalFooter *footer=[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self loadMore];
    }];
    _tableView.footer=footer;
    
    
}
#pragma mark -- loadData
-(void)loadData{
    self.page=1;
    NSString *path=[NSString stringWithFormat:URL_VIDEO,self.page,10];
    
    SQNetWork *net=[SQNetWork sharedNetWork];
    [net requestDataWithType:GET andUrl:path andPara:nil andSucBlock:^(NSURLSessionDataTask *task, id response) {
        
    } andFailBlock:^(NSError *error, NSURLSessionDataTask *task) {
       
    }];
    
}
-(void)loadMore{

    NSString *path=[NSString stringWithFormat:URL_VIDEO,self.page+1,10];
    
    SQNetWork *net=[SQNetWork sharedNetWork];
    [net requestDataWithType:GET andUrl:path andPara:nil andSucBlock:^(NSURLSessionDataTask *task, id response) {
        if (response) {
            
        }
        //
    } andFailBlock:^(NSError *error, NSURLSessionDataTask *task) {
        //
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
