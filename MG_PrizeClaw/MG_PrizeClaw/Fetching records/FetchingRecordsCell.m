//
//  FetchingRecordsCell.m
//  MG_PrizeClaw
//
//  Created by 孙永建 on 2017/12/7.
//  Copyright © 2017年 高向楠. All rights reserved.
//

#import "FetchingRecordsCell.h"

@implementation FetchingRecordsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIImageView *img = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Fetching"]];
        img.frame = CGRectMake(8, 8, 44, 44);
        [self addSubview:img];
        
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, 40, 40)];
        [btn setImage:[UIImage imageNamed:@"Fetching"] forState:UIControlStateNormal];
        [self addSubview:btn];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(60, 13, 150, 20)];
        label.text = @"准备巩塔的小叮当";
        label.textAlignment = NSTextAlignmentCenter;
        label.adjustsFontSizeToFitWidth = YES;
        [self addSubview:label];
        
        UILabel *TimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 33, 150, 30)];
        TimeLabel.text = [NSString stringWithFormat:@"HH-MM-SS YYYY-MM-DD"];
        TimeLabel.textColor = [UIColor grayColor];
        TimeLabel.textAlignment = NSTextAlignmentCenter;
        TimeLabel.font = [UIFont systemFontOfSize:11];
        //TimeLabel.adjustsFontSizeToFitWidth = YES;
        [self addSubview:TimeLabel];
        
        
        UILabel *TextLabel = [[UILabel alloc]initWithFrame:CGRectMake(300, 33, 80, 20)];
        TextLabel.text = @"抓取失败";
        TextLabel.textColor = [UIColor grayColor];
        
        [self addSubview:TextLabel];
        
    }
    return self;
    
    
    
    
}

@end
