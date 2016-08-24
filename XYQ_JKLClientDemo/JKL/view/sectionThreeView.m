//
//  sectionThreeView.m
//  XYQ_JKLClientDemo
//
//  Created by ma c on 15/11/26.
//  Copyright © 2015年 xiayuanquan. All rights reserved.
//


#import "sectionThreeView.h"
#import "const.h"
#import "UIImageView+WebCache.h"
#import "JKLSelecGoods.h"

@interface sectionThreeView()
@property (strong,nonatomic)UIImageView *imageView;
@property (strong,nonatomic)UILabel *nameLabel;
@property (strong,nonatomic)UILabel *priceLabel;
@end

static const CGFloat gap = 10;
static const NSInteger col = 3;

@implementation sectionThreeView

//接收实体数组
-(void)sendShopsArray:(NSMutableArray *)shops
{
    CGFloat x = gap;
    CGFloat y = gap;
    CGFloat imageViewWidth = (SCREEN_WIDTH - gap * (col+1))/col;
    CGFloat imageViewHeight = imageViewWidth;
    for (int i=0; i<shops.count; i++)
    {
        //商品图片
        [self createImage:_imageView andFrame:CGRectMake(x, y, imageViewWidth,imageViewHeight) andImageURL:[NSURL URLWithString:[shops[i] image_default]] andPalceImage:[UIImage imageNamed:@"livingarea_picture"]];
        
        
        //商品名字
        [self createLabel:_nameLabel andFrame:CGRectMake(x, y+imageViewHeight,imageViewWidth,40) andTitle:[shops[i] name]];
        
        
        //商品价格
        [self createLabel:_priceLabel andFrame:CGRectMake(x, y+imageViewHeight+40,imageViewWidth,20) andTitle:[NSString stringWithFormat:@"￥ %@",[[shops[i] app_price] substringToIndex:5]]];
        
        
        //计算换行后的x和y值
        if ((i+1) % col == 0 && i !=0)
        {
            x = gap;
            y += imageViewHeight + 2*gap + 40;
        }
        else
        {
            x += imageViewWidth + gap;
        }
    }
}

//创建图片
-(void)createImage:(UIImageView *)imageView andFrame:(CGRect)frame andImageURL:(NSURL *)imageURL andPalceImage:(UIImage *)placeImage
{
    imageView = [[UIImageView alloc]initWithFrame:frame];
    [imageView setUserInteractionEnabled:YES];
    [imageView sd_setImageWithURL:imageURL placeholderImage:placeImage];
    
    //添加点击手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]init];
    [tap addTarget:self action:@selector(SelectedImage:)];
    [imageView addGestureRecognizer:tap];
    
    [self addSubview:imageView];
}

//创建标签
-(void)createLabel:(UILabel *)label andFrame:(CGRect)frame andTitle:(NSString *)title
{
    label = [[UILabel alloc]initWithFrame:frame];
    label.textAlignment = NSTextAlignmentLeft;
    label.numberOfLines = 2;
    label.text = title;
    label.font = SHOP_NAME_FONT;
    [self addSubview:label];
}

//处理选中图片后的事件
-(void)SelectedImage:(UITapGestureRecognizer *)sender
{
    NSLog(@"dsfkf");
}
@end
