//
//  MyCollectionViewCell.m
//  MG_PrizeClaw
//
//  Created by 孙永建 on 2017/12/6.
//  Copyright © 2017年 高向楠. All rights reserved.
//

#import "MyCollectionViewCell.h"

@implementation MyCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //   self.backgroundColor = [UIColor blueColor];
        UIImageView *bgimV = [[UIImageView alloc]initWithFrame:self.bounds];
        bgimV.image = [UIImage imageNamed:@"mg_homecell_bg"];
        [self addSubview:bgimV];
    }
    return self;
}
@end
