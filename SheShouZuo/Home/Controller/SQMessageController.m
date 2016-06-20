//
//  SQMessageController.m
//  SheShouZuo
//
//  Created by qianfeng on 16/6/19.
//  Copyright © 2016年 1077. All rights reserved.
//

#import "SQMessageController.h"
#import "UIImage+SQImage.h"

@interface SQMessageController ()
@property(nonatomic,strong)UIWebView *webView;

@end

@implementation SQMessageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarController.tabBar.hidden=YES;
    self.view.backgroundColor=[UIColor whiteColor];
    [self settingNavgationItem];

    [self createUI];
    // Do any additional setup after loading the view.
}
#pragma mark settingNavgationItem
-(void)settingNavgationItem{
    UIBarButtonItem *item1=[[UIBarButtonItem alloc] initWithImage:[UIImage loadImage:@"baichuan_navigation_favorites_selected~iphone.png"] style:UIBarButtonItemStylePlain target:self action:@selector(saveTheInformation:)];
    UIBarButtonItem *item2=[[UIBarButtonItem alloc] initWithImage:[UIImage loadImage:@"baichuan_navigation_comments~iphone.png"] style:UIBarButtonItemStylePlain target:self action:@selector(shareToOtherApp:)];
    self.navigationItem.rightBarButtonItems=@[item1,item2];
}
-(void)shareToOtherApp:(UIBarButtonItem *)item{
    NSLog(@"66666666");
}
-(void)saveTheInformation:(UIBarButtonItem *)item{
    NSLog(@"999999999");
}
#pragma mark -createUI
-(void)createUI{
    _webView=[[UIWebView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:_webView];
    NSLog(@"%@",self.path);
    NSURL *url=[NSURL URLWithString:self.path];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
    
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
