//
//  JKLMoreButton.m
//  XYQ_JKLClientDemo
//
//  Created by ma c on 15/11/26.
//  Copyright © 2015年 xiayuanquan. All rights reserved.
//


#import "JKLMoreButton.h"
#import "const.h"

@implementation JKLMoreButton
-(instancetype)init
{
    if (self = [super init])
    {
        //设置按钮属性
        self.frame = CGRectMake(310, 580, 60, 20);
        [self setTitle:@"更多" forState:UIControlStateNormal];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"set_ac_more"] forState:UIControlStateNormal];
        self.titleLabel.font = SHOP_NAME_FONT;
        
        //添加按钮事件
        [self addTarget:self action:@selector(moreButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

//重新设置文字的位置
-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(8, 0, 40, 20);
}

//重新设置图片的位置
-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(40, 2, 15, 15);
}

#pragma mark - moreButtonClicked:
-(void)moreButtonClicked:(UIButton *)sender
{
    NSLog(@"wo");
}
@end
