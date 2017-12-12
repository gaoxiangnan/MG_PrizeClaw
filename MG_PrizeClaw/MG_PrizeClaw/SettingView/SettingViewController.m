//
//  SettingViewController.m
//  MG_PrizeClaw
//
//  Created by 高向楠 on 2017/12/11.
//  Copyright © 2017年 高向楠. All rights reserved.
//

#import "SettingViewController.h"
#import "NavView.h"
#import "SettingAddressViewController.h"
#import "MessageViewController.h"

@interface SettingViewController ()
{
    NavView *navView;
}
@property (nonatomic, strong) UIView *czView;
@property (nonatomic, strong) UIView *shView;
@property (nonatomic, strong) UIView *xxView;
@property (nonatomic, strong) UIView *syView;

@property (nonatomic, strong) UISwitch *bgSwitch;
@property (nonatomic, strong) UISwitch *yxSwitch;
@property (nonatomic, strong) UIButton *logOutBtn;


@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    navView = [[NavView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, 64) titleImage:[UIImage imageNamed:@"Nav"] titleString:nil leftButtonImg:[UIImage imageNamed:@"Backimg"] btnClick:^{
        [self.navigationController popViewControllerAnimated:YES];
    } rightButton:nil rightClick:^{
        
    }];
    
    navView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:navView];
    
    
    [self.view addSubview:self.czView];
    [_czView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).mas_offset(10);
        make.right.mas_equalTo(self.view.mas_right).mas_offset(-10);
        make.top.mas_equalTo(navView.mas_bottom).mas_offset(10);
        make.height.mas_equalTo(50);
    }];
    
    [self.view addSubview:self.shView];
    [_shView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.height.mas_equalTo(_czView);
        make.top.mas_equalTo(_czView.mas_bottom).mas_offset(20);
    }];
    
    [self.view addSubview:self.xxView];
    [_xxView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.height.mas_equalTo(_shView);
        make.top.mas_equalTo(_shView.mas_bottom).mas_offset(20);
    }];

    [self.view addSubview:self.syView];
    [_syView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.mas_equalTo(_xxView);
        make.top.mas_equalTo(_xxView.mas_bottom).mas_offset(20);
        make.height.mas_equalTo(100);
    }];
    [self.view addSubview:self.logOutBtn];
    [_logOutBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.mas_equalTo(_shView);
        make.top.mas_equalTo(_syView.mas_bottom).mas_offset(20);
        make.height.mas_equalTo(55);
    }];
    // Do any additional setup after loading the view.
}
- (UIButton *)logOutBtn
{
    if (!_logOutBtn) {
        _logOutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_logOutBtn setBackgroundImage:[UIImage imageNamed:@"logout_btn_bgImg"] forState:UIControlStateNormal];
        [_logOutBtn setTitle:@"退出登录" forState:UIControlStateNormal];
        _logOutBtn.titleLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightBold];
        [_logOutBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_logOutBtn addTarget:self action:@selector(onLogoutClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _logOutBtn;
}
- (UIView *)czView
{
    if (!_czView) {
        _czView = [UIView new];
        _czView.backgroundColor = kRGBColor(124, 251, 250);
        _czView.layer.cornerRadius = 10;
        _czView.layer.borderWidth = 1;
        _czView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        
        UILabel *czLb = [UILabel new];
        czLb.text = @"充值";
        czLb.textAlignment = NSTextAlignmentLeft;
        czLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
        [_czView addSubview:czLb];
        [czLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_czView).mas_equalTo(20);
            make.centerY.mas_equalTo(_czView);
        }];
        
        UIImageView *brow = [UIImageView new];
        brow.image = [UIImage imageNamed:@"mg_brow_right"];
        [_czView addSubview:brow];
        [brow mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(_czView);
            make.right.mas_equalTo(_czView.mas_right).mas_offset(-20);
        }];
        
        UITapGestureRecognizer *czTapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onCZTapGes:)];
        [_czView addGestureRecognizer:czTapGes];
    }
    return _czView;
}
- (UIView *)shView
{
    if (!_shView) {
        _shView = [UIView new];
        _shView.backgroundColor = kRGBColor(124, 251, 250);
        _shView.layer.cornerRadius = 10;
        _shView.layer.borderWidth = 1;
        _shView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        
        UILabel *shLb = [UILabel new];
        shLb.text = @"收货地址";
        shLb.textAlignment = NSTextAlignmentLeft;
        shLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
        [_shView addSubview:shLb];
        [shLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_shView).mas_equalTo(20);
            make.centerY.mas_equalTo(_shView);
        }];
        
        UIImageView *brow = [UIImageView new];
        brow.image = [UIImage imageNamed:@"mg_brow_right"];
        [_shView addSubview:brow];
        [brow mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(_shView);
            make.right.mas_equalTo(_shView.mas_right).mas_offset(-20);
        }];
        
        UITapGestureRecognizer *shTapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onSHTapGes:)];
        [_shView addGestureRecognizer:shTapGes];
    }
    return _shView;
}
- (UIView *)xxView
{
    if (!_xxView) {
        _xxView = [UIView new];
        _xxView.backgroundColor = kRGBColor(124, 251, 250);
        _xxView.layer.cornerRadius = 10;
        _xxView.layer.borderWidth = 1;
        _xxView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        
        UILabel *xxLb = [UILabel new];
        xxLb.text = @"消息中心";
        xxLb.textAlignment = NSTextAlignmentLeft;
        xxLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
        [_xxView addSubview:xxLb];
        [xxLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_xxView).mas_equalTo(20);
            make.centerY.mas_equalTo(_xxView);
        }];
        
        UIImageView *brow = [UIImageView new];
        brow.image = [UIImage imageNamed:@"mg_brow_right"];
        [_xxView addSubview:brow];
        [brow mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(_xxView);
            make.right.mas_equalTo(_xxView.mas_right).mas_offset(-20);
        }];
        
        UITapGestureRecognizer *xxTapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onXXTapGes:)];
        [_xxView addGestureRecognizer:xxTapGes];
    }
    return _xxView;
}
- (UIView *)syView
{
    if (!_syView) {
        _syView = [UIView new];
        _syView.backgroundColor = kRGBColor(124, 251, 250);
        _syView.layer.cornerRadius = 10;
        _syView.layer.borderWidth = 1;
        _syView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        
        UIView *bgMusic = [UIView new];
        bgMusic.backgroundColor = [UIColor clearColor];
        [_syView addSubview:bgMusic];
        [bgMusic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.width.mas_equalTo(_syView);
            make.height.mas_equalTo(50);
        }];
        UILabel *bgLb = [UILabel new];
        bgLb.text = @"背景音乐";
        bgLb.textAlignment = NSTextAlignmentLeft;
        bgLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
        [bgMusic addSubview:bgLb];
        [bgLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(bgMusic).mas_equalTo(20);
            make.centerY.mas_equalTo(bgMusic);
        }];
        _bgSwitch = [UISwitch new];
        [_bgSwitch setOn:YES];
        _bgSwitch.onImage = [UIImage imageNamed:@"set_switch_on"];
        _bgSwitch.offImage = [UIImage imageNamed:@"set_switch_off"];
        [_bgSwitch addTarget:self action:@selector(onBgSwitch:) forControlEvents:UIControlEventValueChanged];
        [bgMusic addSubview:_bgSwitch];
        [_bgSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(bgMusic.mas_right).offset(-20);
            make.centerY.mas_equalTo(bgMusic);
        }];
        
        UIView *lineView = [UIView new];
        lineView.backgroundColor = [UIColor whiteColor];
        [_syView addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_syView).mas_offset(5);
            make.right.mas_equalTo(_syView.mas_right).mas_offset(-5);
            make.centerY.mas_equalTo(_syView);
            make.height.mas_equalTo(0.5);
        }];
        
        UIView *yx = [UIView new];
        yx.backgroundColor = [UIColor clearColor];
        [_syView addSubview:yx];
        [yx mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.width.mas_equalTo(_syView);
            make.top.mas_equalTo(bgMusic.mas_bottom);
            make.height.mas_equalTo(50);
        }];
        UILabel *yxLb = [UILabel new];
        yxLb.text = @"音效";
        yxLb.textAlignment = NSTextAlignmentLeft;
        yxLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
        [yx addSubview:yxLb];
        [yxLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(yx).mas_equalTo(20);
            make.centerY.mas_equalTo(yx);
        }];
        _yxSwitch = [UISwitch new];
        [_yxSwitch setOn:YES];
        _yxSwitch.onImage = [UIImage imageNamed:@"set_switch_on"];
        _yxSwitch.offImage = [UIImage imageNamed:@"set_switch_off"];
        [_yxSwitch addTarget:self action:@selector(onYxSwitch:) forControlEvents:UIControlEventValueChanged];
        [yx addSubview:_yxSwitch];
        [_yxSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(yx.mas_right).offset(-20);
            make.centerY.mas_equalTo(yx);
        }];
    }
    return _syView;
}
- (void)onCZTapGes:(UITapGestureRecognizer *)ges
{
    
}
- (void)onSHTapGes:(UITapGestureRecognizer *)ges
{
    SettingAddressViewController *adVC = [[SettingAddressViewController alloc]init];
    [self.navigationController pushViewController:adVC animated:YES];
}
- (void)onXXTapGes:(UITapGestureRecognizer *)ges
{
    MessageViewController *meVC = [[MessageViewController alloc]init];
    [self.navigationController pushViewController:meVC animated:YES];
}
- (void)onBgSwitch:(UISwitch *)swh
{
    
}
- (void)onYxSwitch:(UISwitch *)swh
{
    
}
- (void)onLogoutClick
{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
