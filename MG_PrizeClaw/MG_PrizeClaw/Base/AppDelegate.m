//
//  AppDelegate.m
//  MG_PrizeClaw
//
//  Created by 高向楠 on 2017/12/4.
//  Copyright © 2017年 高向楠. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()<UIAlertViewDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [WXApi registerApp:@"wx3d1fb361ee5ee0e2"];
    if ([UserInfo shareInstance].isLogined) {
        
    }
    ViewController *vc = [[ViewController alloc]init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:vc];
    
    self.window.rootViewController = navigationController;
   
    
    return YES;
}

-(void) onResp:(BaseResp*)resp{
    NSLog(@"resp %d",resp.errCode);
    
    /*
     enum  WXErrCode {
     WXSuccess           = 0,    成功
     WXErrCodeCommon     = -1,  普通错误类型
     WXErrCodeUserCancel = -2,    用户点击取消并返回
     WXErrCodeSentFail   = -3,   发送失败
     WXErrCodeAuthDeny   = -4,    授权失败
     WXErrCodeUnsupport  = -5,   微信不支持
     };
     */
    if ([resp isKindOfClass:[SendAuthResp class]]) {   //授权登录的类。
        if (resp.errCode == 0) {  //成功。
            //这里处理回调的方法 。 通过代理吧对应的登录消息传送过去。
            if ([_wxDelegate respondsToSelector:@selector(loginSuccessByCode:)]) {
                SendAuthResp *resp2 = (SendAuthResp *)resp;
                [_wxDelegate loginSuccessByCode:resp2.code];
            }
        }else{ //失败
            NSLog(@"error %@",resp.errStr);
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"登录失败" message:[NSString stringWithFormat:@"reason : %@",resp.errStr] delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            [alert show];
        }
    }
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {//从后台唤醒
    NPrintLog(@"我醒了");
    [self loginPrizeClaw];
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}
- (void)loginPrizeClaw
{
    [CH_NetWorkManager postWithURLString:@"Login/check_token" parameters:@{@"token":[UserInfo shareInstance].userToken} success:^(NSDictionary *data,NSInteger code) {
        if (code == 200) {
            [UserInfo shareInstance].userToken = [data objectForKey:@"data"];
            
        }else if(code == 102){
            [self setAlertController:[data objectForKey:@"message"] ];
        }
        
    } failure:^(NSError *error) {
        
    }];
}
- (void)setAlertController:(NSString *)showStr {
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:showStr delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    ViewController *vc = [[ViewController alloc]init];
    [self.window.rootViewController presentViewController:vc animated:YES completion:nil];
    [self.window.rootViewController.navigationController pushViewController:vc animated:YES];
}
- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return [WXApi handleOpenURL:url delegate:self];
}
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return [WXApi handleOpenURL:url delegate:self];
}
@end
