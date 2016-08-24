//
//  JKLShopSubLabelDetail.m
//  XYQ_JKLClientDemo
//
//  Created by ma c on 15/11/26.
//  Copyright © 2015年 xiayuanquan. All rights reserved.
//


#import "JKLShopSubLabelDetail.h"
#import "JKLShopEntity.h"

@implementation JKLShopSubLabelDetail

-(instancetype)init
{
    if (self = [super init])
    {
        self.dataSource = self;
        self.scrollEnabled = NO; //禁止滚动
        self.tableFooterView = [[UIView alloc]init];//隐藏多余的分割线
    }
    return self;
}
-(void)setShopEntity:(JKLShopEntity *)shopEntity
{
    _shopEntity = shopEntity;
    
    //截取字符串
    [_shopEntity formateSubTitle];
    NSString *str = _shopEntity.subTitleStrM;
    NSArray  *arr = [[str substringToIndex:str.length-1] componentsSeparatedByString:@"/"];
    self.shops = [NSMutableArray arrayWithArray:arr];
    [self.shops insertObject:@"更多" atIndex:0];
}

#pragma mark - 数据源方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.shops.count;
}
//设置每一个单元格的内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //1.根据reuseIdentifier，先到对象池中去找重用的单元格对象
    static NSString *reuseIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    //2.如果没有找到，自己创建单元格对象
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    //3.设置单元格对象的内容
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = [self.shops objectAtIndex:indexPath.row];
    cell.backgroundColor = [UIColor lightGrayColor];
    return cell;
}

@end
