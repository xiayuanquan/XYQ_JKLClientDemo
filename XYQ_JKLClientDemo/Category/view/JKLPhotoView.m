//
//  PhotoView.m
//  XYQ_JKLClientDemo
//
//  Created by ma c on 15/11/26.
//  Copyright © 2015年 xiayuanquan. All rights reserved.
//


#import "JKLPhotoView.h"
#import "UIImageView+WebCache.h"
#import "JKLShopEntity.h"
#import "JKLShopCell.h"

@interface JKLPhotoView()

@end

@implementation JKLPhotoView
-(void)setShopEntity:(JKLShopEntity *)shopEntity
{
    _shopEntity = shopEntity;
    NSURL *URL = [NSURL URLWithString:shopEntity.category_logo];
    [self sd_setImageWithURL:URL placeholderImage:[UIImage imageNamed:@"livingarea_picture"]];
   [self setUserInteractionEnabled:YES];
}

//传递响应链
-(UIView*)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    return self.superview.superview;
}
@end
