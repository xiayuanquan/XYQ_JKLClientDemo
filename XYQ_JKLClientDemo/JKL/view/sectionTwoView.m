//
//  sectionTwoView.m
//  XYQ_JKLClientDemo
//
//  Created by ma c on 15/11/26.
//  Copyright © 2015年 xiayuanquan. All rights reserved.
//


#import "sectionTwoView.h"
#import "const.h"

@interface sectionTwoView()
@property (strong,nonatomic)UIImageView *imgView;
@property (strong,nonatomic)UILabel *titleLabel;
@end

@implementation sectionTwoView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        //第一张图片和文字
        [self createImgView:CGRectMake(20, 5, 130, 100) andImgName:[UIImage imageNamed:@"img_yushou"] andLabel:CGRectMake(5, 5, 100, 30) andTitle:@"预售商品" andTitleColor:[UIColor yellowColor]];
        
        
        //添加分割线
        [self createSplitLine:CGRectMake(165, 5, 1, 100) andImage:[UIImage imageNamed:@"jkl_vertical_line"]];
        
        
        //第二张图片和文字
        [self createImgView:CGRectMake(180, 5, 180, 100) andImgName:[UIImage imageNamed:@"img_liangfa"] andLabel:CGRectMake(200, 5, 100, 30) andTitle:@"量售商品" andTitleColor:[UIColor redColor]];
        
        
        //添加分割线
        [self createSplitLine:CGRectMake(0, 105, SCREEN_WIDTH, 1) andImage:[UIImage imageNamed:@"jkl_horizontal_line"]];
        
        
        //第三张图片和文字
        [self createImgView:CGRectMake(20, 115, 340, 80) andImgName:[UIImage imageNamed:@"img_jingbaobg"] andLabel:CGRectMake(5, 115, 100, 30) andTitle:@"惊爆商品" andTitleColor:[UIColor greenColor]];
        
    }
    return self;
}

//创建图像视图和标签
-(void)createImgView:(CGRect)ImgFrame andImgName:(UIImage*)image andLabel:(CGRect)labelFrame andTitle:(NSString *)title andTitleColor:(UIColor *)color
{
    _imgView = [[UIImageView alloc]initWithFrame:ImgFrame];
    [_imgView setImage:image];
    
    _titleLabel = [[UILabel alloc]initWithFrame:labelFrame];
    _titleLabel.text = title;
    _titleLabel.textColor = color;
    
    [self addSubview:_imgView];
    [self addSubview:_titleLabel];
}

//添加分割线
-(void)createSplitLine:(CGRect)frame andImage:(UIImage *)image
{
    _imgView = [[UIImageView alloc]initWithFrame:frame];
    [_imgView setImage:image];
    [self addSubview:_imgView];
}
@end
