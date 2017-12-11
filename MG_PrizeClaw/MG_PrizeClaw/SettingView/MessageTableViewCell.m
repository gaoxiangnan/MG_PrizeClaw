//
//  MessageTableViewCell.m
//  MG_PrizeClaw
//
//  Created by 高向楠 on 2017/12/11.
//  Copyright © 2017年 高向楠. All rights reserved.
//

#import "MessageTableViewCell.h"
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
    }];
    
    [self addSubview:self.dateShowLb];
    [_dateShowLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_contentLb).mas_offset(10);
        make.top.mas_equalTo(_contentLb.mas_bottom);
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
        _contentLb.text = @"欢迎来到趣抓，600金币已赠送到您的账户欢迎来到趣抓，600金币已赠送到您的账户欢迎来到趣抓，600金币已赠送到您的账户";
        _contentLb.textColor = [UIColor darkGrayColor];
        _contentLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
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
/*
 @method 获取指定宽度width的字符串在UITextView上的高度
 @param textView 待计算的UITextView
 @param Width 限制字符串显示区域的宽度
 @result float 返回的高度
 */
- (float) heightForString:(UILabel *)textLb andWidth:(float)width{
    CGSize sizeToFit = [textLb sizeThatFits:CGSizeMake(width, MAXFLOAT)];
    return sizeToFit.height;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
