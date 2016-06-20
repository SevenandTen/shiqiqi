//
//  ParentViewController.m
//  SheShouZuo
//
//  Created by qianfeng on 16/6/16.
//  Copyright © 2016年 1077. All rights reserved.
//

#import "ParentViewController.h"
#import "HomeHeader.h"




@interface ParentViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataSource;
@property(nonatomic,assign) int page;





@end

@implementation ParentViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [_tableView.header beginRefreshing];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self createUI];
    // Do any additional setup after loading the view.
}

#pragma mark --createUI
-(void)createUI{
    _tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, SC_W, SC_H)];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [_tableView registerClass:[SQTableCell class] forCellReuseIdentifier:@"cell1"];
    [_tableView registerClass:[SQOneCell class] forCellReuseIdentifier:@"cell2"];
    [_tableView registerClass:[SQThreeCell class] forCellReuseIdentifier:@"cell3"];
    _tableView.rowHeight=100;
    
    [self.view addSubview:_tableView];
    MJRefreshNormalHeader *header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        //
        [self loadData];
    }];
    _tableView.header=header;
    [header setTitle:@"正在刷新" forState:MJRefreshStatePulling];
    [header setTitle:@"刷新完成" forState:MJRefreshStateNoMoreData ];
    MJRefreshBackNormalFooter *footer=[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        //
        [self loadMore];
    }];
    
    _tableView.footer=footer;
    [footer setTitle:@"正在加载更多页面" forState:MJRefreshStatePulling];
    [footer setTitle:@"加载完成" forState:MJRefreshStateNoMoreData];
    
    
    
}
#pragma mark --加载数据
-(void)loadData{
    self.page=1;
    
    NSString *path=[NSString stringWithFormat:HOME_ZIXUN,[self.ID intValue],self.page,15];
    SQNetWork *net=[SQNetWork sharedNetWork];
    
    
    [net requestDataWithType:GET andUrl:path andPara:nil andSucBlock:^(NSURLSessionDataTask *task, id response) {
        if (response) {
              NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableContainers error:nil];
            NSArray * array=dic[@"data"];
            [self.dataSource removeAllObjects];
            for (NSDictionary *dict in array) {
                if ([dict[@"content_type"] intValue]==3) {
                    SQThreeModel *model=[SQThreeModel createModelWithDictionary:dict[@"adv_info"]];
                    [self.dataSource addObject:model];
                    
                } if([dict[@"content_type"] intValue]==1) {
                
                SQTwoModel *model=[SQTwoModel createModelWithDictioary:dict[@"top_content_info"]];
                [self.dataSource addObject:model];
                }
                
            }
            [_tableView reloadData];
            [_tableView.header endRefreshing];
        } else{
            NSLog(@"请求数据为空");
            [_tableView.header endRefreshing];
        }
        
      
    } andFailBlock:^(NSError *error, NSURLSessionDataTask *task) {
        [_tableView.header endRefreshing];
        NSLog(@"%@",error.localizedDescription);
    }];
}
-(void)loadMore{
   
    NSString *path=[NSString stringWithFormat:HOME_ZIXUN,[self.ID intValue],self.page+1,15];
    SQNetWork *net=[SQNetWork sharedNetWork];
    
    
    [net requestDataWithType:GET andUrl:path andPara:nil andSucBlock:^(NSURLSessionDataTask *task, id response) {
        if (response) {
            NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableContainers error:nil];
            NSArray * array=dic[@"data"];
            for (NSDictionary *dict in array) {
                
                if ([dict[@"content_type"] intValue]==3) {
                    SQThreeModel *model=[SQThreeModel createModelWithDictionary:dict[@"adv_info"]];
                    [self.dataSource addObject:model];
                    NSLog(@"aaaaaaaaa");
                    continue;
                    
                }
               
                
                if([dict[@"content_type"] intValue]==1) {
                    
                    SQTwoModel *model=[SQTwoModel createModelWithDictioary:dict[@"top_content_info"]];
                    [self.dataSource addObject:model];
                    NSLog(@"bbbbbbb");
                }

                
                
                
            }
            [_tableView reloadData];
            NSLog(@"%lu",self.dataSource.count);
            [_tableView.footer endRefreshing];
            self.page ++;
            
            
            
        }else{
            [_tableView.footer endRefreshing];
            NSLog(@"请求数据为空");
        }
        
        
    } andFailBlock:^(NSError *error, NSURLSessionDataTask *task) {
        [_tableView.footer endRefreshing];
        NSLog(@"%@",error.localizedDescription);
    }];
    
}
#pragma mark --delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ( [self.dataSource[indexPath.row] isKindOfClass:NSClassFromString(@"SQThreeModel")]) {
        SQThreeModel *model=self.dataSource[indexPath.row];
        SQThreeCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell3"];
        [cell refreshCellWithModle:model];
        return cell;
        
    }
   
    
    SQTwoModel *model=self.dataSource[indexPath.row];
    if ([model.cover_type intValue]==2) {
        SQOneCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell2"];
        [cell refreshCellWithModle:model];
        return cell;
       
    }
    SQTableCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell1"];
    [cell refreshCellWithModle:model];
        return cell;
 
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SQMessageController *vc=[[SQMessageController alloc] init];
    if ([self.dataSource[indexPath.row] isKindOfClass:NSClassFromString(@"SQThreeModel")]) {
        SQThreeModel *model=self.dataSource[indexPath.row];
        vc.path=model.content_url;
    }
    else{
        SQTwoModel *model=self.dataSource[indexPath.row];
        vc.path=model.content_url;
    }
    
   
    [self.navigationController pushViewController:vc animated:YES];
   
//    [self.delegate appearOtherView:vc];
    
    
}
-(CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ( [self.dataSource[indexPath.row] isKindOfClass:NSClassFromString(@"SQThreeModel")]){
        return 200;
    }else {
    
    SQTwoModel *model=self.dataSource[indexPath.row];
    if ([model.cover_type intValue]==2) {
        return 170;
    }
    return 100;
    }
}







#pragma mark --懒加载
-(NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource=[[NSMutableArray alloc] init];
        
        
    }
    return _dataSource;
}



@end
