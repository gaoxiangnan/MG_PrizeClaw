//
//  UIView+additional.h
//  DaJiang365
//
//  Created by 高向楠 on 2017/6/16.
//  Copyright © 2017年 泰宇. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, ZJViewBorder) {
    ZJViewBorderTop = 1<<1,
    ZJViewBorderLeft = 1<<2,
    ZJViewBorderBottom = 1<<3,
    ZJViewBorderRight = 1<<4,
};
@interface UIView (additional)
@property (nonatomic, assign) ZJViewBorder borderWhich; 

@end
