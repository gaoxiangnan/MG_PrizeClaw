//
//  UserInfo.h
//  MG_PrizeClaw
//
//  Created by 高向楠 on 2017/12/13.
//  Copyright © 2017年 高向楠. All rights reserved.
//

#import <Foundation/Foundation.h>
static NSString* const kUserName = @"nickname";
static NSString* const kOpenid = @"openid";
static NSString* const kUserToken = @"user_token";
static NSString* const accessToken = @"access_token";
static NSString* const refreshToken = @"refresh_token";
static NSString* const kUserImage = @"headimgurl";


@interface UserInfo : NSObject
@property(nonatomic, assign)BOOL isLogined;//是否登录
@property(nonatomic, copy)NSString* userToken;//authtoken
@property(nonatomic, copy)NSString* accessToken;//authtoken
@property(nonatomic, copy)NSString* refreshToken;//authtoken
@property(nonatomic, copy)NSString* userName;
@property(nonatomic, copy)NSString* openID;//用户编号
@property(nonatomic, copy)NSString* pushToken;//推送
@property(nonatomic,strong)NSString *userImage;//头像

+ (UserInfo *)shareInstance;
+ (void)saveUserName;
@end
