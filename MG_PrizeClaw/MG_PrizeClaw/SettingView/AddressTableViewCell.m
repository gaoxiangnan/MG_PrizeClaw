//
//  AddressTableViewCell.m
//  MG_PrizeClaw
//
//  Created by 高向楠 on 2017/12/11.
//  Copyright © 2017年 高向楠. All rights reserved.
//

#import "AddressTableViewCell.h"
@interface AddressTableViewCell()
@property (nonatomic, strong) UILabel *uName;
@property (nonatomic, strong) UILabel *uPhone;
@property (nonatomic, strong) UILabel *uAddress;

@property (nonatomic, strong) UIButton *editBtn;
@property (nonatomic, strong) UIButton *deleteBtn;
@end

@implementation AddressTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = kRGBColor(120, 248, 255);
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self updateViews];
    }
    return self;
}
- (void)updateViews
{
    [self addSubview:self.uName];
    [_uName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(20);
    }];
    
    [self addSubview:self.uPhone];
    [_uPhone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).mas_offset(-20);
        make.top.mas_equalTo(_uName);
    }];
    
    [self addSubview:self.uAddress];
    [_uAddress mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_uName);
        make.top.mas_equalTo(_uName.mas_bottom).mas_offset(7);
        make.right.mas_equalTo(self.mas_right).mas_offset(-80);
    }];
    
    UIView *lineWhite = [UIView new];
    lineWhite.backgroundColor = [UIColor whiteColor];
    [self addSubview:lineWhite];
    [lineWhite mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).mas_offset(5);
        make.right.mas_equalTo(self.mas_right).offset(-5);
        make.top.mas_equalTo(self.mas_bottom).offset(-35);
        make.height.mas_equalTo(0.5);
    }];
    
    [self addSubview:self.deleteBtn];
    [_deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).mas_offset(-10);
        make.top.mas_equalTo(lineWhite.mas_bottom);
        make.height.mas_equalTo(34.5);
        make.width.mas_equalTo(50);
    }];
    
    [self addSubview:self.editBtn];
    [_editBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_deleteBtn.mas_left).mas_offset(-10);
        make.top.mas_equalTo(_deleteBtn);
        make.height.mas_equalTo(_deleteBtn);
        make.width.mas_equalTo(50);
    }];
    
    
}
- (UILabel *)uName
{
    if (!_uName) {
        _uName = [UILabel new];
        _uName.text = @"某某某某";
        _uName.textAlignment = NSTextAlignmentLeft;
        _uName.font = [UIFont systemFontOfSize:18 weight:UIFontWeightBold];
    }
    return _uName;
}
- (UILabel *)uPhone
{
    if (!_uPhone) {
        _uPhone = [UILabel new];
        _uPhone.text = @"18210238706";
        _uPhone.textAlignment = NSTextAlignmentRight;
        _uPhone.font = [UIFont systemFontOfSize:16 weight:UIFontWeightThin];
    }
    return _uPhone;
}
- (UILabel *)uAddress
{
    if (!_uAddress) {
        _uAddress = [UILabel new];
        _uAddress.text = @"某某某某某某某某某某某某某某某某某某某某某某某某某某某某某某某某某某某某某某某某某某某某";
        _uAddress.textAlignment = NSTextAlignmentLeft;
        _uAddress.font = [UIFont systemFontOfSize:14 weight:UIFontWeightThin];
        _uAddress.numberOfLines = 0;
        
    }
    return _uAddress;
}
- (UIButton *)editBtn
{
    if (!_editBtn) {
        _editBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_editBtn setImage:[UIImage imageNamed:@"set_edit_btn"] forState:UIControlStateNormal];
        [_editBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_editBtn setTitle:@"编辑" forState:UIControlStateNormal];
        _editBtn.titleLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightBold];
        [_editBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_editBtn addTarget:self action:@selector(onEditClick) forControlEvents:UIControlEventTouchUpInside];
        [_editBtn setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 0 )];
    }
    return _editBtn;
}
- (UIButton *)deleteBtn
{
    if (!_deleteBtn) {
        _deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_deleteBtn setImage:[UIImage imageNamed:@"set_delete_btn"] forState:UIControlStateNormal];
        [_deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
        [_deleteBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _deleteBtn.titleLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightBold];
        [_deleteBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_deleteBtn addTarget:self action:@selector(onDeleteClick) forControlEvents:UIControlEventTouchUpInside];
        [_deleteBtn setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 0 )];
    }
    return _deleteBtn;
}
- (void)onEditClick
{
    
}
- (void)onDeleteClick
{
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
