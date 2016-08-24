//
//  JKLHomeCell.m
//  XYQ_JKLClientDemo
//
//  Created by ma c on 15/11/26.
//  Copyright © 2015年 xiayuanquan. All rights reserved.
//

#import "JKLHomeCell.h"
#import "const.h"
#import "sectionOneView.h"
#import "sectionTwoView.h"
#import "sectionThreeView.h"

@interface JKLHomeCell()
@property (strong,nonatomic)sectionOneView *secOneView;
@property (strong,nonatomic)sectionTwoView *secTwoView;
@property (strong,nonatomic)sectionThreeView *secThreeView;
@end

@implementation JKLHomeCell

//创建第一组单元格中视图
-(void)createSectionOneView
{
    _secOneView = [[sectionOneView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SECTION_ONE_VIEW_HEIGHT)];
    [self.contentView addSubview:_secOneView];
}

//创建第二组单元格中视图
-(void)createSectionSecondView
{
    _secTwoView = [[sectionTwoView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SECTION_TWO_VIEW_HEIGHT)];
    [self.contentView addSubview:_secTwoView];
}

//创建第三组单元格中视图
-(void)createSectionThreeViewWithShops:(NSMutableArray *)shops
{
    if (_secThreeView)
    {
        [_secThreeView removeFromSuperview];
    }
    
    _secThreeView = [[sectionThreeView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SECTION_THREE_VIEW_HEIGHT)];
    [_secThreeView sendShopsArray:shops];
    [self.contentView addSubview:_secThreeView];
}
@end
