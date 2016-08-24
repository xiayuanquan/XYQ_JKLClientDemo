//
//  JKLHomeController.m
//  XYQ_JKLClientDemo
//
//  Created by ma c on 15/11/26.
//  Copyright © 2015年 xiayuanquan. All rights reserved.
//


#import "JKLHomeController.h"
#import "const.h"
#import "AFNetworking.h"
#import "JKLScrollShop.h"
#import "MJExtension.h"
#import "UIImageView+WebCache.h"
#import "JKLHeadScrollView.h"
#import "JKLHomeCell.h"
#import "JKLSelecGoods.h"
#import "JKLMoreButton.h"

@interface JKLHomeController()<UITableViewDataSource,UITableViewDelegate>
@property (strong,nonatomic)UITableView *tableView;
@property (strong,nonatomic)NSMutableArray *imageShop;
@property (strong,nonatomic)NSMutableArray *selectedGoods;
@property (strong,nonatomic)JKLHeadScrollView *headView;
@property (strong,nonatomic)JKLHomeCell *cell;
@end

@implementation JKLHomeController

-(NSMutableArray *)imageShop
{
    if (!_imageShop)
    {
        _imageShop = [NSMutableArray array];
    }
    return _imageShop;
}

-(NSMutableArray *)selectedGoods
{
    if (!_selectedGoods)
    {
        _selectedGoods = [NSMutableArray array];
    }
    return _selectedGoods;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor lightGrayColor]];
    
    //左按钮
    UIButton *leftbutton = [[UIButton alloc]initWithFrame:CGRectMake(5, 5, 100, 30)];
    [leftbutton setImage:[UIImage imageNamed:@"home_left_title"] forState:UIControlStateNormal];
    [self.navigationController.navigationBar addSubview:leftbutton];
    
    
    //搜索栏
    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(115, 5, 200, 30)];
    searchBar.placeholder = @"请输入搜索内容";
    [self.navigationController.navigationBar addSubview:searchBar];
    
    
    //右按钮
    UIButton *rightbutton = [[UIButton alloc]initWithFrame:CGRectMake(330, 5, 30, 30)];
    [rightbutton setImage:[UIImage imageNamed:@"home_right_title"] forState:UIControlStateNormal];
    [self.navigationController.navigationBar addSubview:rightbutton];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    //创建表格视图
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        //加载滚动视图图片数据
        [self loadShopImage];
        
        //加载精选商品图片数据
        [self loadSelectedGoods];
        
        //设置定时器
        [NSTimer scheduledTimerWithTimeInterval:3.0f target:self selector:@selector(pageChanged) userInfo:nil repeats:YES];
    });
}

#pragma mark - 加载滚动视图数据
-(void)loadShopImage
{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [[AFJSONResponseSerializer alloc]init];
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setObject:@"Goods" forKey:@"app"];
    [parameters setObject:@"AppIndex" forKey:@"class"];
    [parameters setObject:@"1" forKey:@"page_id"];
    
    [manager POST:JKL_URL parameters:parameters
     
    success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject)
    {
        
        NSArray *data = [responseObject objectForKey:@"data"];
        
        [data enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *stop) {
            
            //创建图片实体并保存起来
            JKLScrollShop *shop = [JKLScrollShop mj_objectWithKeyValues:obj];
            [self.imageShop addObject:shop];
        }];
        
        [self.tableView reloadData];
    }
    failure:^(AFHTTPRequestOperation *operation, NSError *error)
    {
        NSLog(@"%@",error);
    }];
}

#pragma mark - 加载精品商品数据
-(void)loadSelectedGoods
{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [[AFJSONResponseSerializer alloc]init];
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setObject:@"2" forKey:@"order"];
    [parameters setObject:@"" forKey:@"category_id"];
    [parameters setObject:@"" forKey:@"brand_id"];
    [parameters setObject:@"Goods" forKey:@"app"];
    [parameters setObject:@"24" forKey:@"psize"];
    [parameters setObject:@"" forKey:@"key"];
    [parameters setObject:@"GetGoodsList" forKey:@"class"];
    [parameters setObject:@"0" forKey:@"type"];
    [parameters setObject:@"1" forKey:@"p"];
    
    [manager POST:JKL_URL parameters:parameters
     success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject)
     {
         NSDictionary *data = [responseObject objectForKey:@"data"];
         NSArray *info = [data objectForKey:@"info"];
         
         [info enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *stop) {
             
             JKLSelecGoods *selecShop = [JKLSelecGoods mj_objectWithKeyValues:obj];
             
             [self.selectedGoods addObject:selecShop];
         }];
         [self.tableView reloadData];
     }
     failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",error);
     }];
}


#pragma mark - 数据源方法
//设置组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
//设置每一组行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

//设置每一个单元格的内容
-(JKLHomeCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //1.创建单元格
    self.cell = [[JKLHomeCell alloc]init];
    self.cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    //2.设置单元格对象的内容
    if (indexPath.section == 0)
    {
        [self.cell createSectionOneView];
    }
    else if (indexPath.section == 1)
    {
        [self.cell createSectionSecondView];
    }
    else
    {
        [self.cell createSectionThreeViewWithShops:self.selectedGoods];
    }
    
    return self.cell;
}

#pragma mark - 代理方法
//返回表头高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return SECTION_ONE_HEAD_HEIGHT;
    }
    else if(section == 1)
    {
        return 0.1;
    }
    else
    {
        return 20;
    }
}
//返回表头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        self.headView = [[JKLHeadScrollView alloc]init];
        self.headView.pageControl.numberOfPages = self.imageShop.count;
        self.headView.pageControl.currentPage = 0;
        
        for (int i=0; i< self.imageShop.count; i++)
        {
          [self.headView sendEntityIamge:[self.imageShop objectAtIndex:i] andIndex:i];
        }
        
        [self.tableView addSubview:self.headView.pageControl];
        return self.headView;
    }
    return nil;
}

//返回单元格行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return SECTION_ONE_VIEW_HEIGHT;
    }
    else if (indexPath.section == 1)
    {
        return SECTION_TWO_VIEW_HEIGHT;
    }
    else
    {
        return SECTION_THREE_VIEW_HEIGHT;
    }
}

//返回组间标题
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 2)
    {
        //创建更多按钮
        JKLMoreButton *moreButton = [[JKLMoreButton alloc]init];
        [self.tableView addSubview:moreButton];
        
        return @"精选商品";
    }
    return @"";
}
#pragma mark - NSTimer定时器处理
-(void)pageChanged
{
    NSInteger page = self.headView.pageControl.currentPage;
    
    if (page == self.imageShop.count-1)
    {
        page = 0;
    }
    else
    {
        page ++;
    }
    [UIView animateWithDuration:1.0f animations:^{
        CGPoint point = CGPointMake(SCREEN_WIDTH * page, 0);
        self.headView.contentOffset = point;
    }];
}
@end
