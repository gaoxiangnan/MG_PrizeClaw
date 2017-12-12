//
//  GamePlayViewController.m
//  MG_PrizeClaw
//
//  Created by 高向楠 on 2017/12/12.
//  Copyright © 2017年 高向楠. All rights reserved.
//

#import "GamePlayViewController.h"
#import "InstructionViewController.h"
#import "HandleGameView.h"

@interface GamePlayViewController ()
{
    NavView *navView;
}
@property (nonatomic, strong) UIButton *photoBtn;
@end

@implementation GamePlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    navView = [[NavView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, 64) titleImage:[UIImage imageNamed:@"Nav"] titleString:nil leftButtonImg:nil btnClick:^{
        [self.navigationController popViewControllerAnimated:YES];
    } rightButton:[UIImage imageNamed:@"ProImg"] rightClick:^{
        InstructionViewController *instrucVC = [[InstructionViewController alloc]init];
        [self.navigationController pushViewController:instrucVC animated:YES];
    }];
    navView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:navView];
    
    UIImageView *imv = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mg_bgVV"]];
//    imv.frame = CGRectMake(0, 64, kWindowW, kWindowH - 190-64);
    [self.view addSubview:imv];
    [imv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view);
        make.top.mas_equalTo(64);
        make.width.mas_equalTo(self.view);
        make.height.mas_equalTo(kWindowH - 190-64);
    }];
    
    HandleGameView *handleVV = [[HandleGameView alloc]init];
    [self.view addSubview:handleVV];
    [handleVV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view);
        make.top.mas_equalTo(imv.mas_bottom);
        make.width.mas_equalTo(self.view);
        make.height.mas_equalTo(190);
    }];
    
    
    
    [self.view addSubview:self.photoBtn];
    [_photoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.view.mas_right);
        make.bottom.mas_equalTo(handleVV.mas_top).mas_offset(-20);
        make.width.mas_equalTo(62);
        make.height.mas_equalTo(52);
        
    }];
    // Do any additional setup after loading the view.
}
- (UIButton *)photoBtn
{
    if (!_photoBtn) {
        _photoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_photoBtn setBackgroundImage:[UIImage imageNamed:@"mg_game_photo"] forState:UIControlStateNormal];
        [_photoBtn addTarget:self action:@selector(onGamePhotoClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _photoBtn;
}
- (void)onGamePhotoClick
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
