//
//  sectionOneView.m
//  XYQ_JKLClientDemo
//
//  Created by ma c on 15/11/26.
//  Copyright © 2015年 xiayuanquan. All rights reserved.
//

#import "sectionOneView.h"
#import "const.h"

@interface sectionOneView()
@property (strong,nonatomic)UIButton *imageButton;
@property (strong,nonatomic)UILabel *nameLabel;
@property (strong,nonatomic)NSArray *images;
@property (strong,nonatomic)NSArray *labels;
@end

static const CGFloat gap = 20;
static const NSInteger col = 4;

@implementation sectionOneView
-(NSArray *)images
{
    if (!_images)
    {
        _images = @[[UIImage imageNamed:@"jkl_tag"],
                    [UIImage imageNamed:@"jkl_special"],
                    [UIImage imageNamed:@"jkl_shape"],
                    [UIImage imageNamed:@"jkl_sheriff_badge"],
                    [UIImage imageNamed:@"jkl_award_ribbon"],
                    [UIImage imageNamed:@"jkl_truck"],
                    [UIImage imageNamed:@"jkl_wallet"],
                    [UIImage imageNamed:@"jkl_file"]];
    }
    return _images;
}

-(NSArray *)labels
{
    if (!_labels)
    {
        _labels = @[@"新品推荐",@"秒杀",@"生鲜预售",@"生活圈",
                    @"优惠券",@"物流通知",@"京客隆钱包",@"我的订单"
                    ];
    }
    return _labels;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        CGFloat x = gap;
        CGFloat y = gap/4;
        CGFloat imageButtonWidth = (SCREEN_WIDTH - gap * (col+1))/col;
        CGFloat imageButtonHeight = imageButtonWidth;
        for (int i=0; i<self.images.count; i++)
        {
            _imageButton = [[UIButton alloc]init];
            _imageButton.frame = CGRectMake(x, y, imageButtonWidth,imageButtonHeight);
            [_imageButton setImage:self.images[i] forState:UIControlStateNormal];
            
            _nameLabel = [[UILabel alloc]init];
            _nameLabel.textAlignment = NSTextAlignmentCenter;
            _nameLabel.font = [UIFont systemFontOfSize:13];
            _nameLabel.frame = CGRectMake(x, y+imageButtonHeight,imageButtonWidth,20);
            _nameLabel.text = self.labels[i];
            
            if ((i+1) % col == 0 && i !=0)
            {
                x = gap;
                y += imageButtonHeight + gap;
            }
            else
            {
                x += imageButtonWidth + gap;
            }
            
            [self addSubview:_imageButton];
            [self addSubview:_nameLabel];
        }
    }
    return self;
}
@end
