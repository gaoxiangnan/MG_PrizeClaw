//
//  HomeCollectionViewCell.m
//  MG_PrizeClaw
//
//  Created by 高向楠 on 2017/12/6.
//  Copyright © 2017年 高向楠. All rights reserved.
//

#import "HomeCollectionViewCell.h"
#import "UIView+additional.h"
#define contentImgW ((kWindowW - 40)/2) - 20 //150*(375/kWindowW)

@interface HomeCollectionViewCell ()
@property (nonatomic, strong) UIImageView *contentImV;
@property (nonatomic, strong) UILabel *titleLb;
@property (nonatomic, strong) UILabel *numPersonLb;
@property (nonatomic, strong) UIImageView *gameStateImV;

@end

@implementation HomeCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        UIImageView *bgimV = [[UIImageView alloc]initWithFrame:self.bounds];
        bgimV.image = [UIImage imageNamed:@"mg_homecell_bg"];
        [self addSubview:bgimV];
        
        [self updateCells];
    }
    return self;
}
- (void)updateCells
{
    
    
    UIView *titleView = [UIView new];
    titleView.backgroundColor = [UIColor blueColor];
    titleView.layer.cornerRadius = 5;
    [self addSubview:titleView];
    [titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(47.5);
        make.left.mas_equalTo(self).mas_offset(10);
        make.width.mas_equalTo(contentImgW);
        make.bottom.mas_equalTo(self).mas_offset(-10);
    }];
    
    [self addSubview:self.contentImV];
    [_contentImV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).mas_offset(10);
        make.top.mas_equalTo(self).mas_offset(10);
        make.width.mas_equalTo(contentImgW);
        make.height.mas_equalTo(130);
    }];
    
    
    
    [titleView addSubview:self.titleLb];
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(titleView).mas_offset(5);
    }];
    [titleView addSubview:self.numPersonLb];
    [_numPersonLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_titleLb);
        make.top.mas_equalTo(_titleLb.mas_bottom);
    }];
    [titleView addSubview:self.gameStateImV];
    [_gameStateImV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(titleView.mas_right).mas_offset(-5);
        make.top.mas_equalTo(_numPersonLb);
    }];
}
- (UILabel *)titleLb
{
    if (!_titleLb) {
        _titleLb = [UILabel new];
        _titleLb.text = @"领结猫咪公仔";
        _titleLb.textColor = [UIColor whiteColor];
        _titleLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    }
    return _titleLb;
}
- (UILabel *)numPersonLb
{
    if (!_numPersonLb) {
        _numPersonLb = [UILabel new];
        _numPersonLb.text = @"24";
        _numPersonLb.textColor = [UIColor whiteColor];
        _numPersonLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    }
    return _numPersonLb;
}
- (UIImageView *)contentImV
{
    if (!_contentImV) {
        _contentImV = [UIImageView new];
        _contentImV.image = [UIImage imageNamed:@"placeHolder"];
    }
    return _contentImV;
}
- (UIImageView *)gameStateImV
{
    if (!_gameStateImV) {
        _gameStateImV = [UIImageView new];
        _gameStateImV.image = [UIImage imageNamed:@"Image"];
    }
    return _gameStateImV;
}
@end
