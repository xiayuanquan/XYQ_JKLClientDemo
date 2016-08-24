//
//  JKLShopMainLabel.m
//  XYQ_JKLClientDemo
//
//  Created by ma c on 15/11/26.
//  Copyright © 2015年 xiayuanquan. All rights reserved.
//


#import "JKLShopMainLabel.h"
#import "JKLShopEntity.h"

@implementation JKLShopMainLabel
-(void)setShopEntity:(JKLShopEntity *)shopEntity
{
    _shopEntity = shopEntity;
    self.textColor = [UIColor blackColor];
    self.text = _shopEntity.category_name;
}
@end
