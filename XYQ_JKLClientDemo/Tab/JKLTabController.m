//
//  JKLTabController.m
//  XYQ_JKLClientDemo
//
//  Created by ma c on 15/11/26.
//  Copyright © 2015年 xiayuanquan. All rights reserved.
//


#import "JKLTabController.h"
#import "JKLHomeController.h"
#import "JKLCategoryController.h"
#import "JKLShopCarController.h"
#import "JKLMeController.h"

@implementation JKLTabController

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setUITabBarItemPropeeties];
    
    [[UINavigationBar appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]}];
    
    //创建主页控制器
    JKLHomeController *HomeVC = [[JKLHomeController alloc]init];
    HomeVC.view.backgroundColor = [UIColor lightGrayColor];
    [self addSubController:HomeVC andTitle:@"京客隆" andImage:[UIImage imageNamed:@"tab_jkl_normal" ] andSelectedImage:[UIImage imageNamed:@"tab_jkl_selected"]];

    
    //创建分类控制器
    JKLCategoryController *CategoryVC = [[JKLCategoryController alloc]init];
    CategoryVC.view.backgroundColor = [UIColor lightGrayColor];
    [self addSubController:CategoryVC andTitle:@"分类" andImage:[UIImage imageNamed:@"tab_type_normal"] andSelectedImage:[UIImage imageNamed:@"tab_type_selected"]];
    
    
    //创建购物车控制器
    JKLShopCarController *ShopVC = [[JKLShopCarController alloc]init];
    ShopVC.view.backgroundColor = [UIColor whiteColor];
    [self addSubController:ShopVC andTitle:@"购物车" andImage:[UIImage imageNamed:@"tab_cart_normal"] andSelectedImage:[UIImage imageNamed:@"tab_cart_selected"]];
    
    
    //创建我的控制器
    JKLMeController *MeVC = [[JKLMeController alloc]init];
    MeVC.view.backgroundColor = [UIColor whiteColor];
    [self addSubController:MeVC andTitle:@"个人主页" andImage:[UIImage imageNamed:@"tab_my_normal"] andSelectedImage:[UIImage imageNamed:@"tab_my_selected"]];
}

//添加子控制器和标签栏按钮
-(void)addSubController:(UIViewController *)subController andTitle:(NSString *)title andImage:(UIImage *)image andSelectedImage:(UIImage *)seletedIamge
{
    //添加按钮
    UITabBarItem *item = [[UITabBarItem alloc]init];
    item.title = title;
    item.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item.selectedImage = [seletedIamge imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [subController setTabBarItem:item];
    
    //添加子控制器
    UINavigationController *naVC = [[UINavigationController alloc]initWithRootViewController:subController];
    if (![subController isKindOfClass:[JKLHomeController class]])
    {
        subController.navigationItem.title = title;
    }
    [self addChildViewController:naVC];
}

//设置UITabBarItem文字颜色和大小
-(void)setUITabBarItemPropeeties
{
    [[UITabBarItem appearance]setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13],NSForegroundColorAttributeName:[UIColor grayColor]} forState:UIControlStateNormal];
    
    [[UITabBarItem appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateSelected];
    
    [[UITabBar appearance]setBarTintColor:[UIColor whiteColor]];
}

@end
