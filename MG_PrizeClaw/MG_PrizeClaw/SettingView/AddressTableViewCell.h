//
//  AddressTableViewCell.h
//  MG_PrizeClaw
//
//  Created by 高向楠 on 2017/12/11.
//  Copyright © 2017年 高向楠. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^EditBlock)(void);
typedef void (^DeleteBlock)(void);;
@interface AddressTableViewCell : UITableViewCell

@property (nonatomic, copy) EditBlock editBlock;
@property (nonatomic, copy) DeleteBlock deleteBlock;

@end
