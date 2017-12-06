//
//  HomeCollectHeaderView.m
//  MG_PrizeClaw
//
//  Created by 高向楠 on 2017/12/6.
//  Copyright © 2017年 高向楠. All rights reserved.
//

#import "HomeCollectHeaderView.h"

@implementation HomeCollectHeaderView
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //        self.backgroundColor = [UIColor blueColor];
        UIImageView *bgimV = [[UIImageView alloc]initWithFrame:CGRectMake(10, 0, kWindowW - 40, 175)];
        bgimV.image = [UIImage imageNamed:@"bg_collHeader_img"];
        [self addSubview:bgimV];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
