//
//  JKLShopCell.m
//  XYQ_JKLClientDemo
//
//  Created by ma c on 15/11/26.
//  Copyright © 2015年 xiayuanquan. All rights reserved.
//


#import "JKLShopCell.h"
#import "JKLShopEntity.h"
#import "JKLPhotoView.h"
#import "JKLShopMainLabel.h"
#import "JKLShopSubLabel.h"

@interface JKLShopCell()
@property (strong,nonatomic)JKLPhotoView *shopPhotoView;
@property (strong,nonatomic)JKLShopMainLabel *shopMainLabel;
@property (strong,nonatomic)JKLShopSubLabel *shopSubLabel;
@end

@implementation JKLShopCell

-(void)setShopEntity:(JKLShopEntity *)shopEntity
{
    _shopEntity = shopEntity;
    
    //消除单元格重用的影响
    if (_shopPhotoView) {
        
        [_shopPhotoView removeFromSuperview];
    }
    if (_shopMainLabel) {
        
        [_shopMainLabel removeFromSuperview];
    }
    if (_shopSubLabel) {
        
        [_shopSubLabel removeFromSuperview];
    }
    
    
    //创建图片视图
    _shopPhotoView = [[JKLPhotoView alloc]init];
    [_shopPhotoView setShopEntity:_shopEntity];
    _shopPhotoView.frame = _shopEntity.shopPhotoViewFrame;
    [self.contentView addSubview:_shopPhotoView];
    
    //创建主标题
    _shopMainLabel = [[JKLShopMainLabel alloc]init];
    [_shopMainLabel setShopEntity:_shopEntity];
    _shopMainLabel.frame = _shopEntity.shopMainLabelFrame;
    [self.contentView addSubview:_shopMainLabel];
    
    //创建子标题
    _shopSubLabel = [[JKLShopSubLabel alloc]init];
    [_shopSubLabel setShopEntity:_shopEntity];
    _shopSubLabel.frame = _shopEntity.shopSubLabelFrame;
    [self.contentView addSubview:_shopSubLabel];
}

@end
