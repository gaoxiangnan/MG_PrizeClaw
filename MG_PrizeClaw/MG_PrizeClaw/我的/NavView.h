//
//  NavView.h
//  MG_PrizeClaw
//
//  Created by 孙永建 on 2017/12/6.
//  Copyright © 2017年 高向楠. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^left)(void);
typedef void (^right)(void);
@interface NavView : UIView
@property (nonatomic,copy)left leftBlock;
@property (nonatomic,copy)right rightBlock;

-(instancetype)initWithFrame:(CGRect)frame titleImage:(UIImage *)titleImg titleString:(NSString *)titleString leftButtonImg:(UIImage *)btnImg btnClick:(void(^)(void))leftBtnBlock rightButton:(UIImage *)rightImg rightClick:(void(^)(void))rightBtnClick;
@end
