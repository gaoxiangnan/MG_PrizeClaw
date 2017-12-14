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
#import "WXApi.h"
#import "AppDelegate.h"
#import "UserInfo.h"

#define URL_APPID @"wx3d1fb361ee5ee0e2"
#define URL_SECRET @"e289b23e9aa762131cb46b2fb28e8f0e"

@interface ViewController ()<WXDelegate>
{
    AppDelegate *appdelegate;
}
@property(nonatomic,strong)UIImageView *BackImg,*ClawImg,*HDImg;
@property(nonatomic,strong)UIButton  *WXbtn;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    [self.view addSubview:self.BackImg];
    [self.view addSubview:self.ClawImg];
    [self.view addSubview:self.HDImg];
    [self.view addSubview:self.WXbtn];
    
    
    
    [self adpa];
}

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
    NPrintLog(@"%@",[UserInfo shareInstance].accessToken);
    if ([UserInfo shareInstance].accessToken.length > 0) {
        [self catAccessToken];
    }else{
        [self catRefreshToken];
    }
   
}
-(void)catAccessToken
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:[NSString stringWithFormat:@"https://api.weixin.qq.com/sns/userinfo?access_token=%@&openid=%@",[UserInfo shareInstance].accessToken,[UserInfo shareInstance].openID] parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSDictionary *dic = (NSDictionary *)[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        [self loginPrizeClaw];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error %ld",(long)error.code);
        [self catRefreshToken];
    }];
}
-(void)catRefreshToken
{
    if ([WXApi isWXAppInstalled]) {
        SendAuthReq *req = [[SendAuthReq alloc]init];
        req.scope = @"snsapi_userinfo";
        req.openID = URL_APPID;
        req.state = @"1245";
        appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        appdelegate.wxDelegate = self;
        
        [WXApi sendReq:req];
    }
    else {
        [self setupAlertController];
    }
}

#pragma mark 微信登录回调。
-(void)loginSuccessByCode:(NSString *)code{
    __weak typeof(*&self) weakSelf = self;
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];//请求
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];//响应
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", @"text/json",@"text/plain",  nil];
    //通过 appid  secret 认证code . 来发送获取 access_token的请求
    [manager GET:[NSString stringWithFormat:@"https://api.weixin.qq.com/sns/oauth2/access_token?appid=%@&secret=%@&code=%@&grant_type=authorization_code",URL_APPID,URL_SECRET,code] parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {  //获得access_token，然后根据access_token获取用户信息请求。

        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"dic %@",dic);
        [UserInfo shareInstance].accessToken = dic[@"access_token"];
        [UserInfo shareInstance].refreshToken = dic[@"refresh_token"];
        [UserInfo saveUserName];
        /*
         access_token   接口调用凭证
         expires_in access_token接口调用凭证超时时间，单位（秒）
         refresh_token  用户刷新access_token
         openid 授权用户唯一标识
         scope  用户授权的作用域，使用逗号（,）分隔
         unionid     当且仅当该移动应用已获得该用户的userinfo授权时，才会出现该字段
         */
        NSString* accessToken=[dic valueForKey:@"access_token"];
        NSString* openID=[dic valueForKey:@"openid"];
        [weakSelf requestUserInfoByToken:accessToken andOpenid:openID];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error %@",error.localizedFailureReason);
    }];
    

    
}


-(void)requestUserInfoByToken:(NSString *)token andOpenid:(NSString *)openID{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:[NSString stringWithFormat:@"https://api.weixin.qq.com/sns/userinfo?access_token=%@&openid=%@",token,openID] parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = (NSDictionary *)[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"dic  ==== %@",dic);
    
        [UserInfo shareInstance].userName = dic[@"nickname"];
        [UserInfo shareInstance].openID = dic[@"openid"];        
        [UserInfo shareInstance].userImage = dic[@"headimgurl"];
        [UserInfo saveUserName];
        if (dic[@"openid"]) {
            
            [self loginPrizeClaw];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error %ld",(long)error.code);
    }];
}
- (void)loginPrizeClaw
{
    [CH_NetWorkManager postWithURLString:@"Login/login" parameters:@{@"name":[UserInfo shareInstance].userName,@"pic":[UserInfo shareInstance].userImage,@"open_id":[UserInfo shareInstance].openID,@"push_id":@"111"} success:^(NSDictionary *data,NSInteger code) {
        if (code == 200) {
            [UserInfo shareInstance].isLogined = YES;
            [UserInfo shareInstance].userToken = [data objectForKey:@"data"];
            if (self.navigationController) {
                HomeViewController *vc = [HomeViewController new];
                [self.navigationController pushViewController:vc animated:YES];
            }else{
                [self dismissViewControllerAnimated:YES completion:nil];
            }
            
        }else{
            [self setAlertController:[data objectForKey:@"message"] ];
        }
        
    } failure:^(NSError *error) {
        
    }];
}
#pragma mark - 设置弹出提示语
- (void)setupAlertController {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"请先安装微信客户端" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *actionConfirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:actionConfirm];
    [self presentViewController:alert animated:YES completion:nil];
}
- (void)setAlertController:(NSString *)showStr {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:showStr preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *actionConfirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:actionConfirm];
    [self presentViewController:alert animated:YES completion:nil];
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
