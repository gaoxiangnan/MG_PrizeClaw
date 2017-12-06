//
//  ViewController.m
//  MG_PrizeClaw
//
//  Created by 高向楠 on 2017/12/4.
//  Copyright © 2017年 高向楠. All rights reserved.
//

#import "ViewController.h"
#import "UIView+SDAutoLayout.h"
#import "HomeViewController.h"
@interface ViewController ()
@property(nonatomic,strong)UIImageView *BackImg,*ClawImg,*HDImg;
@property(nonatomic,strong)UIButton  *WXbtn;

@end

@implementation ViewController




-(UIImageView *)BackImg
{
    if (!_BackImg) {
        _BackImg  = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mg_backG"]];
        _BackImg.frame = self.view.frame;
    }
    return _BackImg;
}


-(UIImageView *)ClawImg
{
    if (!_ClawImg) {
        _ClawImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mg_claw"]];
    }
    return _ClawImg;
}

-(UIImageView *)HDImg
{
    if (!_HDImg) {
        _HDImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mg_wawa"]];
    }
    return _HDImg;
}

-(UIButton *)WXbtn
{
    if (!_WXbtn) {
        _WXbtn = [[UIButton alloc]init];
        [_WXbtn setBackgroundImage:[UIImage imageNamed:@"weixin"] forState:UIControlStateNormal];
        [_WXbtn addTarget:self action:@selector(WXbtnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _WXbtn;
}
-(void)WXbtnAction:(id)sender
{
    NSLog(@"微信登录");
    HomeViewController *vc = [HomeViewController new];
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self.view addSubview:self.BackImg];
    [self.view addSubview:self.ClawImg];
    [self.view addSubview:self.HDImg];
    [self.view addSubview:self.WXbtn];
    
    
    
    [self adpa];
}



-(void)adpa
{
    _ClawImg.sd_layout.topSpaceToView(self.view, 0).leftSpaceToView(self.view, 80).heightIs(110).widthIs(100);
    _HDImg.sd_layout.topSpaceToView(self.view, 110).leftSpaceToView(self.view, 30).rightSpaceToView(self.view, 30).heightIs(350);
    _WXbtn.sd_layout.topSpaceToView(self.view, 445).leftSpaceToView(self.view, 80).rightSpaceToView(self.view, 80).heightIs(60);
}


- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"%@",NSStringFromCGRect(_WXbtn.frame));
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
