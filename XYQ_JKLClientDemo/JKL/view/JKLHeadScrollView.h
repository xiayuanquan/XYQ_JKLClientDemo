//
//  JKLHeadScrollView.h
//  XYQ_JKLClientDemo
//
//  Created by ma c on 15/11/26.
//  Copyright © 2015年 xiayuanquan. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "JKLScrollShop.h"

@interface JKLHeadScrollView : UIScrollView
@property (strong,nonatomic)UIPageControl *pageControl;
-(void)sendEntityIamge:(JKLScrollShop *)imageShop andIndex:(NSInteger)index;
@end
