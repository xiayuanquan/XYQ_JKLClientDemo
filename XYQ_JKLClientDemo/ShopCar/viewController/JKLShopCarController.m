//
//  JKLShopController.m
//  XYQ_JKLClientDemo
//
//  Created by ma c on 15/11/26.
//  Copyright © 2015年 xiayuanquan. All rights reserved.
//


#import "JKLShopCarController.h"
#import "const.h"

@interface JKLShopCarController() 
@property (strong,nonatomic)UIImageView *imageView;
@property (strong,nonatomic)UILabel *label;
@end

@implementation JKLShopCarController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(editClicked:)];
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = item;
    
    //显示图片
    [self showImage];
}

#pragma mark - 编辑按钮事件
-(void)editClicked:(UIBarButtonItem *)sender
{
    
}

//显示图片
-(void)showImage
{
    self.imageView = [[UIImageView alloc]init];
    self.imageView.frame = CGRectMake(113, 230, 150, 150);
    [self.imageView setImage:[UIImage imageNamed:@"cart_empty"]];
    self.label = [[UILabel alloc]init];
    self.label.frame = CGRectMake(120, 390, 200, 30);
    self.label.text = @"购物车还没有商品哟~";
    self.label.textColor = [UIColor lightGrayColor];
    [self.view addSubview:self.label];
    [self.view addSubview:self.imageView];
}
@end
