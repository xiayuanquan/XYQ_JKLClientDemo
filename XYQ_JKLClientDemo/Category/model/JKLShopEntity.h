//
//  JKLShopEntity.h
//  XYQ_JKLClientDemo
//
//  Created by ma c on 15/11/26.
//  Copyright © 2015年 xiayuanquan. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface JKLShopEntity : NSObject
@property (assign,nonatomic)NSInteger category_id;
@property (copy,nonatomic)NSString    *category_logo;
@property (copy,nonatomic)NSString    *category_name;
@property (assign,nonatomic)NSInteger parent_id;
@property (copy,nonatomic)NSArray     *child;

//标记所有的子标题
@property (copy,nonatomic)NSMutableString *subTitleStrM;

//单元格中的视图布局
@property (assign,nonatomic)CGRect shopMainLabelFrame;
@property (assign,nonatomic)CGRect shopSubLabelFrame;
@property (assign,nonatomic)CGRect shopPhotoViewFrame;

//标记单元格高度
@property (assign,nonatomic)CGFloat cellHeight;

//初始化实体
-(instancetype)initWithDic:(NSDictionary *)dic;

//布局单元格中所有的子视图
-(void)caleAllViewFrame;

//格式化子标题
-(NSString *)formateSubTitle;
@end
