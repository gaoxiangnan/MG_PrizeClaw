//
//  HandleGameView.m
//  MG_PrizeClaw
//
//  Created by 高向楠 on 2017/12/12.
//  Copyright © 2017年 高向楠. All rights reserved.
//

#import "HandleGameView.h"
@interface HandleGameView()
@property (nonatomic, strong) UIView *handleView;
@property (nonatomic, strong) UIButton *tLeftBtn;
@property (nonatomic, strong) UIButton *tRightBtn;
@property (nonatomic, strong) UIButton *tDownBtn;
@property (nonatomic, strong) UIButton *tTopBtn;
@property (nonatomic, strong) UIButton *startBtn;

@property (nonatomic, strong) UIView *beginView;
@property (nonatomic, strong) UIButton *beginGameBtn;
@property (nonatomic, strong) UIButton *timeBtn;
@property (nonatomic, strong) UIButton *messageBtn;

@end
@implementation HandleGameView
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self updateViews];
    }
    return self;
}
- (void)updateViews
{
    [self addSubview:self.handleView];
    [_handleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.height.width.mas_equalTo(self);
    }];
    
    [self addSubview:self.tLeftBtn];
    [_tLeftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.top.mas_equalTo(60);
        make.width.mas_equalTo(58);
        make.height.mas_equalTo(59);
    }];
    
    [self addSubview:self.tTopBtn];
    [_tLeftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(60);
        make.top.mas_equalTo(30);
        make.width.mas_equalTo(58);
        make.height.mas_equalTo(59);
    }];
    
    [self addSubview:self.tDownBtn];
    [_tLeftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.top.mas_equalTo(60);
        make.width.mas_equalTo(58);
        make.height.mas_equalTo(59);
    }];
    
    [self addSubview:self.tRightBtn];
    [_tLeftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.top.mas_equalTo(60);
        make.width.mas_equalTo(58);
        make.height.mas_equalTo(59);
    }];
    
    [self addSubview:self.startBtn];
    [_tLeftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.top.mas_equalTo(60);
        make.width.mas_equalTo(58);
        make.height.mas_equalTo(59);
    }];
    
}
- (UIView *)handleView
{
    if (!_handleView) {
        _handleView = [UIView new];
    }
    return _handleView;
}
- (UIButton *)tLeftBtn
{
    if (!_tLeftBtn) {
        _tLeftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_tLeftBtn setBackgroundImage:[UIImage imageNamed:@"mg_game_left"] forState:UIControlStateNormal];
        [_tLeftBtn addTarget:self action:@selector(onTurnLeftClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _tLeftBtn;
}
- (UIButton *)tRightBtn
{
    if (!_tRightBtn) {
        _tRightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_tRightBtn setBackgroundImage:[UIImage imageNamed:@"mg_game_right"] forState:UIControlStateNormal];
        [_tRightBtn addTarget:self action:@selector(onTurnLeftClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _tRightBtn;
}
- (UIButton *)tDownBtn
{
    if (!_tDownBtn) {
        _tDownBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_tDownBtn setBackgroundImage:[UIImage imageNamed:@"mg_game_down"] forState:UIControlStateNormal];
        [_tDownBtn addTarget:self action:@selector(onTurnLeftClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _tDownBtn;
}
- (UIButton *)tTopBtn
{
    if (!_tTopBtn) {
        _tTopBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_tTopBtn setBackgroundImage:[UIImage imageNamed:@"mg_game_down"] forState:UIControlStateNormal];
        [_tTopBtn addTarget:self action:@selector(onTurnLeftClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _tTopBtn;
}
- (UIButton *)startBtn
{
    if (!_startBtn) {
        _startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_startBtn setBackgroundImage:[UIImage imageNamed:@"mg_game_top"] forState:UIControlStateNormal];
        [_startBtn addTarget:self action:@selector(onTurnLeftClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _startBtn;
}
- (void)onTurnLeftClick
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
