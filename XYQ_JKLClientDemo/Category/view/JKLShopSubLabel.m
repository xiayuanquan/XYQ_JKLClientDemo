//
//  JKLShopSubLabel.m
//  XYQ_JKLClientDemo
//
//  Created by ma c on 15/11/26.
//  Copyright © 2015年 xiayuanquan. All rights reserved.
//


#import "JKLShopSubLabel.h"
#import "JKLShopEntity.h"

@implementation JKLShopSubLabel

-(void)setShopEntity:(JKLShopEntity *)shopEntity
{
    _shopEntity = shopEntity;
    self.font = [UIFont systemFontOfSize:15];
    self.text = [_shopEntity formateSubTitle];
}
@end
