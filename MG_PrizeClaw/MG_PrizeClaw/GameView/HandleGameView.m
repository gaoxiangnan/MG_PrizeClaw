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
        UIImageView *bgImv = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, 190)];
        bgImv.image = [UIImage imageNamed:@"mg_game_bgv"];
        [self addSubview:bgImv];
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
    
    [_handleView addSubview:self.tLeftBtn];
    [_tLeftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.top.mas_equalTo(60);
        make.width.mas_equalTo(58);
        make.height.mas_equalTo(59);
    }];
    
    [_handleView addSubview:self.tTopBtn];
    [_tTopBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_tLeftBtn.mas_right).mas_offset(5);
        make.bottom.mas_equalTo(_tLeftBtn.mas_top).mas_offset(20);
        make.width.mas_equalTo(58);
        make.height.mas_equalTo(59);
    }];
    
    [_handleView addSubview:self.tDownBtn];
    [_tDownBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_tTopBtn);
        make.top.mas_equalTo(_tLeftBtn.mas_bottom).mas_offset(-20);
        make.width.mas_equalTo(58);
        make.height.mas_equalTo(59);
    }];
    
    [_handleView addSubview:self.tRightBtn];
    [_tRightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_tTopBtn.mas_right).mas_offset(5);
        make.top.mas_equalTo(_tLeftBtn);
        make.width.mas_equalTo(58);
        make.height.mas_equalTo(59);
    }];
    
    [_handleView addSubview:self.startBtn];
    [_startBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_handleView.mas_right).mas_offset(-30);
        make.top.mas_equalTo(40);
        make.width.mas_equalTo(110);
        make.height.mas_equalTo(111);
    }];
    
    
    
    [self addSubview:self.beginView];
    [_beginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.height.width.mas_equalTo(self);
    }];
    
    [_beginView addSubview:self.beginGameBtn];
    [_beginGameBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(_beginView);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(100);
    }];
    
    [_beginView addSubview:self.timeBtn];
    [_timeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_beginGameBtn.mas_left).mas_offset(-10);
        make.centerY.mas_equalTo(_beginGameBtn);
        make.width.mas_equalTo(47);
        make.height.mas_equalTo(48);
    }];
    
    [_beginView addSubview:self.messageBtn];
    [_messageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_beginGameBtn.mas_right).mas_offset(10);
        make.centerY.mas_equalTo(_beginGameBtn);
        make.width.mas_equalTo(47);
        make.height.mas_equalTo(48);
    }];
}
- (UIView *)handleView
{
    if (!_handleView) {
        _handleView = [UIView new];
        _handleView.hidden = YES;
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
        [_tTopBtn setBackgroundImage:[UIImage imageNamed:@"mg_game_top"] forState:UIControlStateNormal];
        [_tTopBtn addTarget:self action:@selector(onTurnLeftClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _tTopBtn;
}
- (UIButton *)startBtn
{
    if (!_startBtn) {
        _startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_startBtn setBackgroundImage:[UIImage imageNamed:@"mg_game_start"] forState:UIControlStateNormal];
        [_startBtn addTarget:self action:@selector(onTurnLeftClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _startBtn;
}


- (UIView *)beginView
{
    if (!_beginView) {
        _beginView = [UIView new];
    }
    return _beginView;
}
- (UIButton *)beginGameBtn
{
    if (!_beginGameBtn) {
        _beginGameBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_beginGameBtn setBackgroundImage:[UIImage imageNamed:@"mg_game_begin"] forState:UIControlStateNormal];
        [_beginGameBtn addTarget:self action:@selector(onBeginGameClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _beginGameBtn;
}
- (UIButton *)timeBtn
{
    if (!_timeBtn) {
        _timeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_timeBtn setBackgroundImage:[UIImage imageNamed:@"mg_game_time"] forState:UIControlStateNormal];
        [_timeBtn addTarget:self action:@selector(onBeginGameClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _timeBtn;
}
- (UIButton *)messageBtn
{
    if (!_messageBtn) {
        _messageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_messageBtn setBackgroundImage:[UIImage imageNamed:@"mg_game_message"] forState:UIControlStateNormal];
        [_messageBtn addTarget:self action:@selector(onTurnLeftClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _messageBtn;
}
- (void)onTurnLeftClick
{
    
}
- (void)onBeginGameClick
{
    _handleView.hidden = NO;
    _beginView.hidden = YES;
    
//    [self bringSubviewToFront:_handleView];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
