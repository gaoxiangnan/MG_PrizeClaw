//
//  AppDelegate.h
//  MG_PrizeClaw
//
//  Created by 高向楠 on 2017/12/4.
//  Copyright © 2017年 高向楠. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXApi.h"

@protocol WXDelegate <NSObject>
-(void)loginSuccessByCode:(NSString *)code;
@end

@interface AppDelegate : UIResponder <UIApplicationDelegate,WXApiDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (weak, nonatomic) id<WXDelegate> wxDelegate;


@end


