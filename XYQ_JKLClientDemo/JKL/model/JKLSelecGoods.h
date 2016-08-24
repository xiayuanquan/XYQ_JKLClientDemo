//
//  JKLSelecGoods.h
//  XYQ_JKLClientDemo
//
//  Created by ma c on 15/11/26.
//  Copyright © 2015年 xiayuanquan. All rights reserved.
//


#import <Foundation/Foundation.h>

/*
 
 "content_id": "6",
 "type": "0",
 "category_id": "103",
 "brand": "2652",
 "brand_name": "鲁花",
 "name": "鲁花5L 5S压榨一级花生油",
 "sub_name": "鲁花5L 5S压榨一级花生油",
 "goods_spec": [
 "产品名称:鲁花5L 5S压榨一级花生油",
 "原料:非转基因花生",
 "规格:5L",
 "保质期:18个月",
 "质量等级:一级",
 "生产工艺:纯物理压榨不添加氧化剂",
 "储存条件:密封阴凉干燥避光\r\n"
 ],
 "sku": "131250",
 "image_default": "http://static.jkl.com.cn/uploads/c7/83/c3/07/d3/e4c1cd52e5c2e4e34e1504.jpg",
 "unit": "桶",
 "stock": "0",
 "weight": "5.8000",
 "net_weight": "5.8000",
 "length": null,
 "wide": null,
 "height": null,
 "app_price": "139.9000",
 "erp_price": "139.9000",
 "is_shelf": "1",
 "is_verify": "2",
 "is_del": "0",
 "promo_flag": "0",
 "promotion_goods_id": null,
 "promotion_cate_id": null,
 "promotion_title": null,
 "promotion_content_id": null,
 "promotion_start_time": null,
 "promotion_end_time": null,
 "promotion_rules": null,
 "rules_serialize": null,
 "rules_stime": null,
 "rules_etime": null,
 "comment_num": "1",
 "haop_num": "1",
 "goodsComment": "1.000",
 "image_width": 800,
 "image_height": 800,
 "cache_stock": "0",
 "rules_stock": false
 },
 
*/

@interface JKLSelecGoods : NSObject
@property (strong,nonatomic)NSString *content_id;
@property (strong,nonatomic)NSString *type;
@property (strong,nonatomic)NSString *category_id;
@property (strong,nonatomic)NSString *brand;
@property (strong,nonatomic)NSString *brand_name;
@property (strong,nonatomic)NSString *name;
@property (strong,nonatomic)NSString *sub_name;
@property (strong,nonatomic)NSArray  *goods_spec;
@property (strong,nonatomic)NSString *sku;
@property (strong,nonatomic)NSString *image_default;
@property (strong,nonatomic)NSString *unit;
@property (strong,nonatomic)NSString *stock;
@property (strong,nonatomic)NSString *weight;
@property (strong,nonatomic)NSString *length;
@property (strong,nonatomic)NSString *wide;
@property (strong,nonatomic)NSString *app_price;
@property (strong,nonatomic)NSString *erp_price;
@property (strong,nonatomic)NSString *is_shelf;
@property (strong,nonatomic)NSString *is_verify;
@property (strong,nonatomic)NSString *is_del;
@property (strong,nonatomic)NSString *promo_flag;
@property (strong,nonatomic)NSString *promotion_goods_id;
@property (strong,nonatomic)NSString *promotion_cate_id;
@property (strong,nonatomic)NSString *promotion_title;
@property (strong,nonatomic)NSString *promotion_content_id;
@property (strong,nonatomic)NSString *promotion_start_time;
@property (strong,nonatomic)NSString *promotion_end_time;
@property (strong,nonatomic)NSArray  *promotion_rules;
@property (strong,nonatomic)NSString *rules_serialize;
@property (strong,nonatomic)NSString *rules_stime;
@property (strong,nonatomic)NSString *rules_etime;
@property (strong,nonatomic)NSString *comment_num;
@property (strong,nonatomic)NSString *haop_num;
@property (strong,nonatomic)NSString *goodsComment;
@property (strong,nonatomic)NSString *image_width;
@property (strong,nonatomic)NSString *image_height;
@property (strong,nonatomic)NSString *cache_stock;
@property (strong,nonatomic)NSString *rules_stock;
@end
