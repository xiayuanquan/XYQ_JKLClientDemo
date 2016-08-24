//
//  JKLCategoryController.m
//  XYQ_JKLClientDemo
//
//  Created by ma c on 15/11/26.
//  Copyright © 2015年 xiayuanquan. All rights reserved.
//


#import "JKLCategoryController.h"
#include "const.h"
#import "AFNetworking.h"
#import "JKLShopEntity.h"
#import "JKLShopCell.h"
#import "JKLShopSubLabelDetail.h"

@interface JKLCategoryController()<UITableViewDelegate,UITableViewDataSource>
@property (strong,nonatomic)UITableView *tableView;
@property (strong,nonatomic)NSMutableArray *shops;
@property (strong,nonatomic)JKLShopSubLabelDetail *subLabelDetail;//子标题的详细表格
@end

@implementation JKLCategoryController

#pragma mark - 懒加载
-(NSMutableArray *)shops
{
    if (!_shops)
    {
        _shops = [NSMutableArray array];
    }
    return _shops;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    //创建集合视图
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    //创建子标题详细表格
    [self createSubLabelDetail];
 
    //加载实体数据
    [self loadEntityData];
}

//创建子标题详细表格
-(void)createSubLabelDetail
{
    self.subLabelDetail = [[JKLShopSubLabelDetail alloc]init];
    self.subLabelDetail.frame = CGRectMake(SCREEN_WIDTH, 44, SCREEN_WIDTH-85, SCREEN_HEIGHT-44);
    
    //添加拖动手势
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]init];
    [swipe addTarget:self action:@selector(swipe:)];
    [self.subLabelDetail addGestureRecognizer:swipe];
    
}
//拖动手势事件处理
-(void)swipe:(UISwipeGestureRecognizer *)sender
{
    if (sender.direction == UISwipeGestureRecognizerDirectionRight) {
        
        [UIView animateWithDuration:1.0f animations:^{
            self.subLabelDetail.frame = CGRectMake(SCREEN_WIDTH, 44, SCREEN_WIDTH-85, SCREEN_HEIGHT-44);
        }];
    }
}


//加载实体数据
-(void)loadEntityData
{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [[AFJSONResponseSerializer alloc]init];
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setObject:@"0" forKey:@"parent_id"];
    [parameters setObject:@"Goods" forKey:@"app"];
    [parameters setObject:@"GetCategory" forKey:@"class"];
    
    [manager POST:JKL_URL parameters:parameters
     
    success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject)
     {
         NSArray *data = [responseObject objectForKey:@"data"];

         [data enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *stop) {
             
             JKLShopEntity *shopEntity = [[JKLShopEntity alloc]initWithDic:obj];
             [shopEntity caleAllViewFrame];
             [self.shops addObject:shopEntity];
         }];
         
         //刷新表格
         [self.tableView reloadData];
     }
     failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",error);
     }];
}

#pragma mark - 数据源协议
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.shops.count;
}
//设置每一个单元格的内容
-(JKLShopCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //1.根据reuseIdentifier，先到对象池中去找重用的单元格对象
    static NSString *reuseIdentifier = @"Cell";
    JKLShopCell *cell = [self.tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    //2.如果没有找到，自己创建单元格对象
    if(cell == nil)
    {
        cell = [[JKLShopCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
    
    //3.设置单元格对象的内容
    JKLShopEntity *shopEntity = self.shops[indexPath.row];
    [cell setShopEntity:shopEntity];
    return cell;
}

#pragma mark - 代理协议
//返回单元格高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JKLShopEntity *shopEntity = self.shops[indexPath.row];
    
    return shopEntity.cellHeight;
}

//选中单元格时的处理
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    JKLShopEntity *shopEntity = [self.shops objectAtIndex:indexPath.row];
    [UIView animateWithDuration:0.5f animations:^{
        self.subLabelDetail.frame = CGRectMake(85, 44, SCREEN_WIDTH-85, SCREEN_HEIGHT-44);
        [self.view addSubview:self.subLabelDetail];
        
        [self.subLabelDetail setShopEntity:shopEntity];
        [self.subLabelDetail reloadData];
    }];
}
@end
