//
//  SQTabBarController.m
//  SheShouZuo
//
//  Created by qianfeng on 16/6/16.
//  Copyright © 2016年 1077. All rights reserved.
//

#import "SQTabBarController.h"
#import "UIImage+SQImage.h"

@interface SQTabBarController ()

@end

@implementation SQTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *path=[[NSBundle mainBundle ] pathForResource:@"SQTabBarList" ofType:@"plist"];
    NSArray *items=[NSArray arrayWithContentsOfFile:path];
    for (NSDictionary *dic in items) {
        
        [self addChildViewController:[self createNavgationControllerWithControllerName:dic[@"controllerName"] andTitle:dic[@"title"] andImageOne:dic[@"image1"] andImageTwo:dic[@"image2"]]];
        
    }
    self.tabBar.tintColor=[UIColor whiteColor];
    self.tabBar.barTintColor=[UIColor blackColor];
    
    
    
    // Do any additional setup after loading the view.
}
#pragma mark -- createNavgationController
//---------------------------------------------------------------
/**
 *  创建TabBar
 *
 *  @param controllerName 控制器名称
 *  @param title          控制器的标题
 *  @param image1         一般图片
 *  @param image2         选中图片
 *
 *  @return 控制器
 */
-(UINavigationController *)createNavgationControllerWithControllerName:(NSString *)controllerName andTitle:(NSString *)title andImageOne:(NSString *)image1 andImageTwo:(NSString *)image2{
    UIViewController *vc=[[NSClassFromString(controllerName) alloc] init];
    vc.tabBarItem=[[UITabBarItem alloc] initWithTitle:title image:[UIImage loadImage:image1 ] selectedImage:[UIImage loadImage:image2]];
    [UINavigationBar appearance].barTintColor=[UIColor blackColor];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:20]}];

    
    return [[UINavigationController alloc] initWithRootViewController:vc];
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
