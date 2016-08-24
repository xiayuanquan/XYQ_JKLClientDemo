//
//  JKLMeController.m
//  XYQ_JKLClientDemo
//
//  Created by ma c on 15/11/26.
//  Copyright © 2015年 xiayuanquan. All rights reserved.
//

#import "JKLMeController.h"
#import "JKLLoginController.h"
#import "const.h"

@interface JKLMeController()
@property (strong,nonatomic)UIImageView  *imageView;
@property (strong,nonatomic)UIButton     *button;
@end

@implementation JKLMeController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    //显示图片
    [self showImage];
}

//显示图片
-(void)showImage
{
    self.imageView = [[UIImageView alloc]init];
    self.imageView.frame = CGRectMake(113, 230, 150, 150);
    [self.imageView setImage:[UIImage imageNamed:@"load_logo"]];
    
    
    self.button = [[UIButton alloc]init];
    [self.button addTarget:self action:@selector(showLoginView:) forControlEvents:UIControlEventTouchUpInside];
    self.button.frame = CGRectMake(110, 420, 150, 30);
    self.button.titleLabel.font = SHOP_NAME_FONT;
    self.button.layer.cornerRadius = 5;
    self.button.layer.borderColor = [[UIColor redColor]CGColor];
    self.button.layer.borderWidth = 1.0;
    [self.button setTitle:@"立即登陆" forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:self.button];
    [self.view addSubview:self.imageView];
}

#pragma mark - showLoginView事件处理
-(void)showLoginView:(UIButton *)sender
{
    JKLLoginController *loginVC = [[JKLLoginController alloc]init];
    [self presentViewController:loginVC animated:YES completion:nil];
}

@end
