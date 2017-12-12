//
//  MyViewController.m
//  MG_PrizeClaw
//
//  Created by 孙永建 on 2017/12/6.
//  Copyright © 2017年 高向楠. All rights reserved.
//

#import "MyViewController.h"
#import "UIView+SDAutoLayout.h"
#import "NavView.h"
#import "FetchingRecordsController.h"
#import "HomeCollectionViewCell.h"

#define CollectViewCellW (kWindowW - 40)/2
#define CollectViewCellH             195
#define CollHeaderViewW  (kWindowW - 40)
#define CollHeaderViewH  175

#define floatSizeW 131
#define floatSizeH 56

@interface MyViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong)UIImageView *BackImg;
@property(nonatomic,strong)UIImageView *HeadImg;
@property(nonatomic,strong)UIButton  *HeadBtn;
@property(nonatomic,strong)UILabel *NameLabel,*IdLabel;
@property(nonatomic,strong)UIView  *BackView;
@property(nonatomic,strong)UIImageView *img;
@property (nonatomic, strong)UILabel *showLabel;

@property (nonatomic, strong) UICollectionView *collectionView;

@end
static NSString * const reuseIdentifier = @"cell";
@implementation MyViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.BackImg];
    [self.view addSubview:self.HeadImg];
    [self.HeadImg addSubview:self.HeadBtn];
    [self.view addSubview:self.NameLabel];
    [self.view addSubview:self.IdLabel];
    
    [self.view addSubview:self.BackView];
    [_BackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.width.mas_equalTo(250);
        make.top.mas_equalTo(230);
        make.height.mas_equalTo(25);
    }];
    
    [self.view addSubview:self.collectionView];
    
    
    
    NavView *navView = [[NavView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, 64) titleImage:[UIImage imageNamed:@"Nav"] titleString:nil  leftButtonImg:[UIImage imageNamed:@"Backimg"] btnClick:^{
        [self.navigationController popViewControllerAnimated:YES];
    } rightButton:[UIImage imageNamed:@"ProImg"] rightClick:^{
        FetchingRecordsController *fecchVC = [[FetchingRecordsController alloc]init];
        [self.navigationController pushViewController:fecchVC animated:YES];
    }];
    [self.view addSubview:navView];
    [self adap];
}
-(UIImageView *)BackImg
{
    if (!_BackImg) {
        _BackImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mg_backG"]];
        _BackImg.frame = self.view.frame;
    }
    return _BackImg;
}

-(UIImageView *)HeadImg
{
    if (!_HeadImg) {
        _HeadImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"HeadImg"]];
        _HeadImg.frame = CGRectMake((kWindowW-70)/2, 90, 70, 70);
    }
    return _HeadImg;
}

-(UIButton *)HeadBtn
{
    if (!_HeadBtn) {
        _HeadBtn = [[UIButton alloc]init];//WithFrame:CGRectMake((self.view.frame.size.width-100)/2, 100, 90, 90)];
        [_HeadBtn setBackgroundImage:[UIImage imageNamed:@"金币"] forState:UIControlStateNormal];
    }
    return _HeadBtn;
}

-(UILabel *)NameLabel
{
    if (!_NameLabel) {
        _NameLabel = [[UILabel alloc]init];
        _NameLabel.text = @"陈菇凉";
        _NameLabel.textColor = [UIColor whiteColor];
        _NameLabel.font = [UIFont boldSystemFontOfSize:18.0f];
        _NameLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _NameLabel;
}

-(UILabel *)IdLabel
{
    if (!_IdLabel) {
        _IdLabel = [[UILabel alloc]init];
        _IdLabel.text = @"ID:123145";
//        NSString *string = [NSString stringWithFormat:@"ID:%@",_IdLabel.text];
//        NSLog(@"%@",string);
        
        
        _IdLabel.textColor = [UIColor whiteColor];
        _IdLabel.font = [UIFont boldSystemFontOfSize:18.0f];
        _IdLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _IdLabel;
}


-(UIView *)BackView
{
    if (!_BackView) {
        _BackView  = [UIView new];
        
        _BackView.layer.cornerRadius = 12.5f;
        
        
        _showLabel = [[UILabel alloc]init];
        _showLabel.text = @"抓中次数：2次 | 余额：99";
        _showLabel.textColor = [UIColor whiteColor];
        _showLabel.textAlignment = NSTextAlignmentCenter;
        _showLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightThin];
        [self.BackView addSubview:_showLabel];
        [_showLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_BackView).mas_offset(20);
            make.centerY.mas_equalTo(_BackView);
        }];
        _img = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"金币"]];
        [self.BackView addSubview:_img];
        [_img mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_showLabel.mas_right).mas_offset(10);
            make.centerY.mas_equalTo(_BackView);
        }];
        _BackView.backgroundColor = [UIColor colorWithRed:69/225.0f green:139/225.0f blue:152/225.0f alpha:.5f];
        
        
    }
    return _BackView;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        
        flowLayout.itemSize = CGSizeMake(CollectViewCellW, CollectViewCellH);
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        flowLayout.minimumLineSpacing = 10;
        flowLayout.minimumInteritemSpacing = 10;
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 280, kWindowW, kWindowH-280) collectionViewLayout:flowLayout];
        
        _collectionView.backgroundColor = [UIColor redColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        
        [_collectionView registerClass:[HomeCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    }
    return _collectionView;
}


-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    HomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    return cell;
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 2;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

//- (CGSize)sizeForChildContentContainer:(nonnull id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize
//{
//    return CGSizeMake(CollectViewCellW, CollectViewCellH);
//}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(10, 10, 5, 10);
}




-(void)adap{
    _HeadBtn.sd_layout.topSpaceToView(_HeadImg, 5).leftSpaceToView(_HeadImg, 5).rightSpaceToView(_HeadImg, 5).bottomSpaceToView(_HeadImg, 5);
    _NameLabel.sd_layout.topSpaceToView(self.view, 155).widthIs(kWindowW).heightIs(50);
    _IdLabel.sd_layout.topSpaceToView(self.view, 180).widthIs(kWindowW).heightIs(50);
    
//    _showLabel.sd_layout.topSpaceToView(_BackView, 5).leftSpaceToView(_BackView, 20).widthIs(150).heightIs(15);
//    _img.sd_layout.topSpaceToView(_BackView, 5).leftSpaceToView(_showLabel, 20).widthIs(15).heightIs(15);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
