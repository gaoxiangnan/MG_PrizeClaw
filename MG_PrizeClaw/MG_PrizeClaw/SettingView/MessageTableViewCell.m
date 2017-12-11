//
//  MessageTableViewCell.m
//  MG_PrizeClaw
//
//  Created by 高向楠 on 2017/12/11.
//  Copyright © 2017年 高向楠. All rights reserved.
//

#import "MessageTableViewCell.h"
#define HeaderImvW 55
#define BrowImvW 20
@interface MessageTableViewCell()
@property (nonatomic, strong) UIImageView *headerImV;
@property (nonatomic, strong) UILabel *titleLb;
@property (nonatomic, strong) UILabel *contentLb;
@property (nonatomic, strong) UILabel *dateShowLb;

@end

@implementation MessageTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = kRGBColor(177, 247, 251);

        [self updateViews];
    }
    return self;
}
- (void)updateViews
{
    UIImageView *bgHeaderImg = [[UIImageView alloc]init];
    bgHeaderImg.image = [UIImage imageNamed:@"Image-1"];
    [self addSubview:bgHeaderImg];
    [bgHeaderImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(20);
        make.width.height.mas_equalTo(55);
    }];
    
    [self addSubview:self.headerImV];
    [_headerImV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(bgHeaderImg).mas_offset(5);;
    }];
    
    [self addSubview:self.titleLb];
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(bgHeaderImg.mas_right).mas_offset(10);
        make.top.mas_equalTo(20);
    }];
    
    [self addSubview:self.contentLb];
    [_contentLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_titleLb).mas_offset(10);
        make.top.mas_equalTo(_titleLb.mas_bottom);
        make.width.mas_equalTo(kWindowW - HeaderImvW - BrowImvW - 40);
    }];
    
    [self addSubview:self.dateShowLb];
    [_dateShowLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_contentLb).mas_offset(10);
        make.bottom.mas_equalTo(self.mas_bottom).mas_offset(-10);
    }];
    
    UIImageView *brow = [[UIImageView alloc]init];
    brow.image = [UIImage imageNamed:@"mg_brow_right"];
    [self addSubview:brow];
    [brow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.right.mas_equalTo(self.mas_right).mas_offset(-10);
    }];
}
- (UIImageView *)headerImV
{
    if (!_headerImV) {
        _headerImV = [UIImageView new];
        _headerImV.image = [UIImage imageNamed:@"Image-1"];
    }
    return _headerImV;
}
- (UILabel *)titleLb
{
    if (!_titleLb) {
        _titleLb = [UILabel new];
        _titleLb.text = @"抓娃娃小秘书";
        _titleLb.textColor = kRGBColor(233, 59, 25);
        _titleLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    }
    return _titleLb;
}
- (UILabel *)contentLb
{
    if (!_contentLb) {
        _contentLb = [UILabel new];
        _contentLb.text = @"欢迎来到趣抓，600金币已赠送到您的账户欢迎来到趣抓";
        _contentLb.textColor = [UIColor darkGrayColor];
        _contentLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
        _contentLb.numberOfLines = 0;
    }
    return _contentLb;
}
- (UILabel *)dateShowLb
{
    if (!_dateShowLb) {
        _dateShowLb = [UILabel new];
        _dateShowLb.text = @"199小时前";
        _dateShowLb.textColor = [UIColor lightGrayColor];
        _dateShowLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    }
    return _dateShowLb;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (float) heightForString:(NSString *)textStr{
    CGSize textSize = [textStr boundingRectWithSize:CGSizeMake(kWindowW - HeaderImvW - BrowImvW - 40, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil].size;
    return textSize.height;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
