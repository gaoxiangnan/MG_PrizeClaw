//
//  EditAddressViewController.m
//  MG_PrizeClaw
//
//  Created by 高向楠 on 2017/12/11.
//  Copyright © 2017年 高向楠. All rights reserved.
//

#import "EditAddressViewController.h"
#import "NavView.h"
@interface EditAddressViewController ()
{
    NavView *navView;
}
@property (nonatomic, strong) UIView *shrView;
@property (nonatomic, strong) UITextField *shrTf;

@property (nonatomic, strong) UIView *lxdhView;
@property (nonatomic, strong) UITextField *lxdhTf;

@property (nonatomic, strong) UIView *szdView;
@property (nonatomic, strong) UIView *jdView;

@property (nonatomic, strong) UIView *xxdzView;
@property (nonatomic, strong) UITextView *xxdzTv;
@end

@implementation EditAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    navView = [[NavView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, 64) titleImage:[UIImage imageNamed:@"Nav"] titleString:nil leftButtonImg:[UIImage imageNamed:@"Backimg"] btnClick:^{
        [self.navigationController popViewControllerAnimated:YES];
    } rightButton:[UIImage imageNamed:@"ProImg"] rightClick:^{
        
    }];
    navView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:navView];
    
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, kWindowW, kWindowH-64)];
    bgView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:bgView];
    
    
    
    [bgView addSubview:self.shrView];
    [_shrView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(bgView).mas_offset(10);
        make.top.mas_equalTo(bgView);
        make.right.mas_equalTo(bgView.mas_right).mas_offset(-10);
        make.height.mas_equalTo(50);
    }];
    
    [bgView addSubview:self.lxdhView];
    [_lxdhView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.height.mas_equalTo(_shrView);
        make.top.mas_equalTo(_shrView.mas_bottom).mas_offset(20);
    }];
    
    [bgView addSubview:self.szdView];
    [_szdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.height.mas_equalTo(_lxdhView);
        make.top.mas_equalTo(_lxdhView.mas_bottom).mas_offset(20);
    }];
    
    [bgView addSubview:self.jdView];
    [_jdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.height.mas_equalTo(_szdView);
        make.top.mas_equalTo(_szdView.mas_bottom).mas_offset(20);
    }];
    
    [bgView addSubview:self.xxdzView];
    [_xxdzView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.mas_equalTo(_jdView);
        make.top.mas_equalTo(_jdView.mas_bottom).mas_offset(20);
        make.height.mas_equalTo(100);
    }];
    // Do any additional setup after loading the view.
}
- (UIView *)shrView
{
    if (!_shrView) {
        _shrView = [UIView new];
        _shrView.backgroundColor = kRGBColor(120, 248, 255);
        _shrView.layer.cornerRadius = 10;
        _shrView.layer.borderWidth = 1;
        _shrView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        
        UILabel *shrLb = [UILabel new];
        shrLb.text = @"收货人";
        shrLb.textAlignment = NSTextAlignmentLeft;
        shrLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
        [_shrView addSubview:shrLb];
        [shrLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_shrView).mas_equalTo(20);
            make.centerY.mas_equalTo(_shrView);
            make.width.mas_equalTo(60);
        }];
        
        _shrTf = [[UITextField alloc]init];
        _shrTf.placeholder = @"输入联系电话";
        _shrTf.textAlignment = NSTextAlignmentLeft;
        _shrTf.font = [UIFont systemFontOfSize:14 weight:UIFontWeightThin];
        [_shrView addSubview:_shrTf];
        [_shrTf mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(shrLb.mas_right).mas_offset(10);
            make.centerY.mas_equalTo(_shrView);
            make.right.mas_equalTo(_shrView.mas_right).mas_offset(-20);
        }];
        
    }
    return _shrView;
}
- (UIView *)lxdhView
{
    if (!_lxdhView) {
        _lxdhView = [UIView new];
        _lxdhView.backgroundColor = kRGBColor(120, 248, 255);
        
        _lxdhView.layer.cornerRadius = 10;
        _lxdhView.layer.borderWidth = 1;
        _lxdhView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        
        UILabel *lxdhLb = [UILabel new];
        lxdhLb.text = @"联系电话";
        lxdhLb.textAlignment = NSTextAlignmentLeft;
        lxdhLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
        [_lxdhView addSubview:lxdhLb];
        [lxdhLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_lxdhView).mas_equalTo(20);
            make.centerY.mas_equalTo(_lxdhView);
            make.width.mas_equalTo(60);
        }];
        
        _lxdhTf = [[UITextField alloc]init];
        _lxdhTf.placeholder = @"输入联系电话";
        _lxdhTf.textAlignment = NSTextAlignmentLeft;
        _lxdhTf.font = [UIFont systemFontOfSize:14 weight:UIFontWeightThin];
        [_lxdhView addSubview:_lxdhTf];
        [_lxdhTf mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(lxdhLb.mas_right).mas_offset(10);
            make.centerY.mas_equalTo(_lxdhView);
            make.right.mas_equalTo(_lxdhView.mas_right).mas_offset(-20);
        }];
    }
    return _lxdhView;
}
- (UIView *)szdView
{
    if (!_szdView) {
        _szdView = [UIView new];
        _szdView.backgroundColor = kRGBColor(120, 248, 255);
        
        _szdView.layer.cornerRadius = 10;
        _szdView.layer.borderWidth = 1;
        _szdView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        
        UITapGestureRecognizer *szdTapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onSZDTapGes:)];
        [_szdView addGestureRecognizer:szdTapGes];
        
        UILabel *szdhLb = [UILabel new];
        szdhLb.text = @"所在地区";
        szdhLb.textAlignment = NSTextAlignmentLeft;
        szdhLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
        [_szdView addSubview:szdhLb];
        [szdhLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_szdView).mas_equalTo(20);
            make.centerY.mas_equalTo(_szdView);
        }];
        
        UIImageView *brow = [UIImageView new];
        brow.image = [UIImage imageNamed:@"mg_brow_right"];
        [_szdView addSubview:brow];
        [brow mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(_szdView);
            make.right.mas_equalTo(_szdView.mas_right).mas_offset(-20);
        }];
    }
    return _szdView;
}
- (UIView *)jdView
{
    if (!_jdView) {
        _jdView = [UIView new];
        _jdView.backgroundColor = kRGBColor(120, 248, 255);
        
        _jdView.layer.cornerRadius = 10;
        _jdView.layer.borderWidth = 1;
        _jdView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        
        UITapGestureRecognizer *jdTapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onJDTapGes:)];
        [_jdView addGestureRecognizer:jdTapGes];
        
        UILabel *jdhLb = [UILabel new];
        jdhLb.text = @"街道";
        jdhLb.textAlignment = NSTextAlignmentLeft;
        jdhLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
        [_jdView addSubview:jdhLb];
        [jdhLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_jdView).mas_equalTo(20);
            make.centerY.mas_equalTo(_jdView);
        }];
        
        UIImageView *brow = [UIImageView new];
        brow.image = [UIImage imageNamed:@"mg_brow_right"];
        [_jdView addSubview:brow];
        [brow mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(_jdView);
            make.right.mas_equalTo(_jdView.mas_right).mas_offset(-20);
        }];
    }
    return _jdView;
}
- (UIView *)xxdzView
{
    if (!_xxdzView) {
        _xxdzView = [UIView new];
        _xxdzView.backgroundColor = kRGBColor(120, 248, 255);
        
        _xxdzView.layer.cornerRadius = 10;
        _xxdzView.layer.borderWidth = 1;
        _xxdzView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        
        UILabel *xxdzLb = [UILabel new];
        xxdzLb.text = @"详细地址";
        xxdzLb.textAlignment = NSTextAlignmentLeft;
        xxdzLb.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
        [_xxdzView addSubview:xxdzLb];
        [xxdzLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_xxdzView).mas_equalTo(20);
            make.top.mas_equalTo(_xxdzView).mas_offset(20);
            make.width.mas_equalTo(60);
        }];
        
        _xxdzTv = [[UITextView alloc]init];
        _xxdzTv.backgroundColor = [UIColor clearColor];
        _xxdzTv.textAlignment = NSTextAlignmentLeft;
        _xxdzTv.font = [UIFont systemFontOfSize:14 weight:UIFontWeightThin];
        [_xxdzView addSubview:_xxdzTv];
        [_xxdzTv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(xxdzLb.mas_right).mas_offset(10);
            make.top.mas_equalTo(_xxdzView).mas_offset(20);
            make.right.mas_equalTo(_xxdzView.mas_right);
            make.bottom.mas_equalTo(_xxdzView.mas_bottom);
        }];
    }
    return _xxdzView;
}
- (void)onSZDTapGes:(UIGestureRecognizer *)ges
{
    
}
- (void)onJDTapGes:(UIGestureRecognizer *)ges
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
