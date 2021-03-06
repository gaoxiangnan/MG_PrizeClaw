//
//  UserInfo.m
//  MG_PrizeClaw
//
//  Created by 高向楠 on 2017/12/13.
//  Copyright © 2017年 高向楠. All rights reserved.
//

#import "UserInfo.h"

@implementation UserInfo
- (id)init
{
    self = [super init];
    if (self) {
        self.isLogined = NO;
        self.userToken = @"";
        self.accessToken = @"";
        self.refreshToken = @"";
        self.userName = @"";
        self.openID = @"";
        self.userImage = @"";
        self.pushToken = @"";
        

        
        [self buildUserName];
    }
    return self;
}
+ (UserInfo *)shareInstance
{
    static UserInfo *user = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        user = [[self alloc] init];
    });
    
    return user;
}
- (void)buildUserName
{
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:kUserName] != nil) {
        self.userName = [[NSUserDefaults standardUserDefaults] objectForKey:kUserName];
    }
    if ([[NSUserDefaults standardUserDefaults] objectForKey:kOpenid] != nil) {
        self.openID = [[NSUserDefaults standardUserDefaults] objectForKey:kOpenid];
    }
    if ([[NSUserDefaults standardUserDefaults] objectForKey:kUserImage] != nil) {
        self.userImage = [[NSUserDefaults standardUserDefaults] objectForKey:kUserImage];
    }
    if ([[NSUserDefaults standardUserDefaults] objectForKey:accessToken] != nil) {
        self.accessToken = [[NSUserDefaults standardUserDefaults] objectForKey:accessToken];
    }
    if ([[NSUserDefaults standardUserDefaults] objectForKey:refreshToken] != nil) {
        self.refreshToken = [[NSUserDefaults standardUserDefaults] objectForKey:refreshToken];
    }
    if ([[NSUserDefaults standardUserDefaults] objectForKey:kUserToken] != nil) {
        self.userToken = [[NSUserDefaults standardUserDefaults] objectForKey:kUserToken];
        self.isLogined = YES;
    }
}
+ (void)saveUserName
{
    [[NSUserDefaults standardUserDefaults] setObject:[UserInfo shareInstance].userName forKey:kUserName];
    [[NSUserDefaults standardUserDefaults] setObject:[UserInfo shareInstance].userImage forKey:kUserImage];
    [[NSUserDefaults standardUserDefaults] setObject:[UserInfo shareInstance].accessToken forKey:accessToken];
    [[NSUserDefaults standardUserDefaults] setObject:[UserInfo shareInstance].openID forKey:kOpenid];
    [[NSUserDefaults standardUserDefaults] setObject:[UserInfo shareInstance].userToken forKey:kUserToken];
    
    [[NSUserDefaults standardUserDefaults] setObject:[UserInfo shareInstance].refreshToken forKey:refreshToken];
    
    
    [[NSUserDefaults standardUserDefaults] synchronize];
}
@end
