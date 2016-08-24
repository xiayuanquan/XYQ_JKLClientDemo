//
//  JKLHeadScrollView.m
//  XYQ_JKLClientDemo
//
//  Created by ma c on 15/11/26.
//  Copyright © 2015年 xiayuanquan. All rights reserved.
//

#import "JKLHeadScrollView.h"
#import "const.h"
#import "UIImageView+WebCache.h"
#import "JKLScrollShop.h"

@interface JKLHeadScrollView()<UIScrollViewDelegate>

@end

@implementation JKLHeadScrollView

-(instancetype)init
{
    if (self = [super init])
    {
        self.showsHorizontalScrollIndicator = NO;
        self.pagingEnabled = YES;
        self.delegate = self;
        self.contentSize = CGSizeMake(SCREEN_WIDTH * 6, 150);
        
        self.pageControl = [[UIPageControl alloc]init];
        self.pageControl.pageIndicatorTintColor = [UIColor greenColor];
        self.pageControl.currentPageIndicatorTintColor = [UIColor redColor];
        self.pageControl.frame = CGRectMake(170, 130, 60, 20);
    }
    return self;
}

-(void)sendEntityIamge:(JKLScrollShop *)imageShop andIndex:(NSInteger)index
{
    CGFloat x = index * SCREEN_WIDTH;
    CGFloat y = 0;
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.frame = CGRectMake(x, y, SCREEN_WIDTH, 150);
    NSURL *URL = [NSURL URLWithString:imageShop.image_path];
    [imageView sd_setImageWithURL:URL placeholderImage:[UIImage imageNamed:@"livingarea_picture"]];
    [self addSubview:imageView];
}

#pragma mark - <UIScrollViewDelegate>
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger page = scrollView.contentOffset.x/self.frame.size.width;
    self.pageControl.currentPage = page;
}
@end
