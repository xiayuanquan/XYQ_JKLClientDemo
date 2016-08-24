//
//  JKLShopEntity.m
//  XYQ_JKLClientDemo
//
//  Created by ma c on 15/11/26.
//  Copyright © 2015年 xiayuanquan. All rights reserved.
//


#import "JKLShopEntity.h"
#import "const.h"

static const CGFloat gap = 5;
static const CGFloat width = 80;
static const CGFloat heith = 80;

@implementation JKLShopEntity

-(instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init])
    {
        _category_id = [[dic objectForKey:@"category_id"]integerValue];
        _category_logo = [[dic objectForKey:@"category_logo"]copy];
        _category_name = [[dic objectForKey:@"category_name"]copy];
        _parent_id = [[dic objectForKey:@"category_id"]integerValue];
        _child = [dic objectForKey:@"child"];
    }
    return self;
}

-(NSMutableString *)subTitleStrM
{
    if (!_subTitleStrM)
    {
        _subTitleStrM = [NSMutableString string];
    }
    return _subTitleStrM;
}

//布局单元格中所有的子视图
-(void)caleAllViewFrame
{
    //商品图片
    self.shopPhotoViewFrame = CGRectMake(gap, gap, width, heith);
    
    //主标题
    self.shopMainLabelFrame = CGRectMake(CGRectGetMaxX(self.shopPhotoViewFrame)+gap, gap, 260, 30);
    
    //子标题
    self.shopSubLabelFrame = CGRectMake(CGRectGetMaxX(self.shopPhotoViewFrame)+gap, CGRectGetMaxX(self.shopPhotoViewFrame)-30-gap, 260, 30);
    
    
    //单元格设置的高度
    self.cellHeight = heith + 2 * gap;
}

//格式化子标题
-(NSString*)formateSubTitle
{
    //枚举所有的商品
    __block NSMutableString *strM = [NSMutableString string];
    [self.child enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *stop) {

        [strM appendString:[NSString stringWithFormat:@"%@/",[obj objectForKey:@"category_name"]]];   
    }];
    self.subTitleStrM = strM;
    if ([strM length] >=19 )
    {
        return [strM substringToIndex:19];
    }
    else
    {
        return [strM substringToIndex:[strM length]-1];
    }
}
@end
