//
//  HomeCollectHeaderView.m
//  MG_PrizeClaw
//
//  Created by 高向楠 on 2017/12/6.
//  Copyright © 2017年 高向楠. All rights reserved.
//

#import "HomeCollectHeaderView.h"
#import "SDCycleScrollView.h"

@interface HomeCollectHeaderView() <SDCycleScrollViewDelegate>
{
    NSArray *_imagesURLStrings;
//    SDCycleScrollView *_customCellScrollViewDemo;
}
@end

@implementation HomeCollectHeaderView
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *bgimV = [[UIImageView alloc]initWithFrame:CGRectMake(10, 0, kWindowW - 40, 175)];
        bgimV.image = [UIImage imageNamed:@"bg_collHeader_img"];
        [self addSubview:bgimV];
        
        NSArray *imagesURLStrings = @[
                                      @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                                      @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                                      @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg",
                                      @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                                      @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                                      @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
                                      ];
        _imagesURLStrings = imagesURLStrings;
        
        //轮播
        SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(25, 15, kWindowW-70, 140) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
        cycleScrollView.clickItemOperationBlock = ^(NSInteger index) {
            NSLog(@">>>>>  %ld", (long)index);
        };
        cycleScrollView.currentPageDotImage = [UIImage imageNamed:@"mg_current_page"];
        cycleScrollView.pageDotImage = [UIImage imageNamed:@"future"];
        cycleScrollView.imageURLStringsGroup = imagesURLStrings;
        [self addSubview:cycleScrollView];
        
        
        UIImageView *starOn = [[UIImageView  alloc]initWithFrame:CGRectMake(0, -10, 80, 58)];
        starOn.image = [UIImage imageNamed:@"mg_home_star_on"];
        [self addSubview:starOn];
        
        UIImageView *starLow = [[UIImageView  alloc]initWithFrame:CGRectMake(0, 0, 42, 32)];
        starLow.image = [UIImage imageNamed:@"mg_home_star_Low"];
        [self addSubview:starLow];
        [starLow mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.mas_right).mas_offset(-10);
            make.bottom.mas_equalTo(self.mas_bottom);
            make.width.mas_equalTo(42);
            make.height.mas_equalTo(32);
        }];
        
    }
    return self;
}
-(void)didClickScrollViewWithIndex:(NSInteger)index
{
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
