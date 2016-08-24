//
//  JKLShopSubLabelDetail.h
//  XYQ_JKLClientDemo
//
//  Created by ma c on 15/11/26.
//  Copyright © 2015年 xiayuanquan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JKLShopEntity;
@interface JKLShopSubLabelDetail : UITableView<UITableViewDataSource>
@property (strong,nonatomic)JKLShopEntity *shopEntity;
@property (strong,nonatomic)NSMutableArray *shops;
@end
