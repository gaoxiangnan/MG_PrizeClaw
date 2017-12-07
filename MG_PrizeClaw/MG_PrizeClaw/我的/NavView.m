//
//  NavView.m
//  MG_PrizeClaw
//
//  Created by 孙永建 on 2017/12/6.
//  Copyright © 2017年 高向楠. All rights reserved.
//

#import "NavView.h"
#import "UIView+SDAutoLayout.h"
@interface NavView()


@property(nonatomic,strong)UIButton  *LeftBtn,*RightBtn;
@property(nonatomic,strong)UIImageView *NavImg;

@end

@implementation NavView
-(instancetype)initWithFrame:(CGRect)frame leftButtonImg:(UIImage *)btnImg btnClick:(void(^)(void))leftBtnBlock rightButton:(UIImage *)rightImg rightClick:(void(^)(void))rightBtnClick
{
    self = [super initWithFrame:frame];
    if (self) {
        
        leftBtnBlock = self.leftBlock;
        rightBtnClick = self.rightBlock;
        
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:self.LeftBtn];
        [self addSubview:self.RightBtn];
        [self addSubview:self.NavImg];
        [self adap];
        
        [_LeftBtn setBackgroundImage:btnImg forState:UIControlStateNormal];
        [_RightBtn setBackgroundImage:rightImg forState:UIControlStateNormal];
    }
    
    
    return self;
}

-(UIButton *)LeftBtn
{
    if (!_LeftBtn) {
        _LeftBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, 30, 20, 25)];
        
        [_LeftBtn addTarget:self action:@selector(LeftBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    return _LeftBtn;
}

-(UIButton *)RightBtn
{
    if (!_RightBtn) {
        _RightBtn = [[UIButton alloc]init];
        [_RightBtn addTarget:self action:@selector(RightBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _RightBtn;
}


-(UIImageView *)NavImg
{
    if (!_NavImg) {
        _NavImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Nav"]];
        _NavImg.frame = CGRectMake((kWindowW-100)/2, 20, 100, 44);
    }
    return _NavImg;
}
-(void)LeftBtnAction:(id)sender
{
    if (_leftBlock) {
        _leftBlock();
        NSLog(@"123");
    }
}
-(void)RightBtnAction:(id)sender
{
    if (_rightBlock) {
        _rightBlock();
        NSLog(@"321");
    }
}

-(void)adap{
    _RightBtn.sd_layout.topSpaceToView(self, 30).rightSpaceToView(self, 25).widthIs(30).heightIs(30);
}





@end
