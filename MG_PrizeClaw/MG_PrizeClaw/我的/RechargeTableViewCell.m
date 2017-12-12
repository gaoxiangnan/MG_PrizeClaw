//
//  RechargeTableViewCell.m
//  MG_PrizeClaw
//
//  Created by 孙永建 on 2017/12/12.
//  Copyright © 2017年 高向楠. All rights reserved.
//

#import "RechargeTableViewCell.h"

@implementation RechargeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(40, 15, kWindowW, 50)];
        label.text = @"99";
        label.font = [UIFont boldSystemFontOfSize:25.0f];
        label.textColor = [UIColor whiteColor];
        [self addSubview:label];
        
        UIImageView *img = [[UIImageView alloc]init];
        img.image = [UIImage imageNamed:@"金币"];
        [self addSubview:img];
        img.sd_layout.topSpaceToView(self, 30).leftSpaceToView(self, 10).widthIs(20).heightIs(20);
        
        UIButton *btn = [[UIButton alloc]init];
        
        [btn setTitle:@"¥ 99" forState:UIControlStateNormal];
        [btn setTitleEdgeInsets:UIEdgeInsetsMake(-8, 0, 0, 0)];
        [btn setBackgroundImage:[UIImage imageNamed:@"anniu"] forState:UIControlStateNormal];
        
        [self addSubview:btn];
        
        btn.sd_layout.topSpaceToView(self, 20).rightSpaceToView(self, 20).widthIs(100).heightIs(40);
        
        
    }
    return self;
    
    
    
    
}

@end
