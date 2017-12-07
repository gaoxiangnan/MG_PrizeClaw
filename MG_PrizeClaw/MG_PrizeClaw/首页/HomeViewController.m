//
//  HomeViewController.m
//  MG_PrizeClaw
//
//  Created by 孙永建 on 2017/12/5.
//  Copyright © 2017年 高向楠. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeCollectionViewCell.h"
#import "HomeCollectHeaderView.h"
#import "NavView.h"

#define CollectViewCellW (kWindowW - 40)/2
#define CollectViewCellH             195
#define CollHeaderViewW  (kWindowW - 40)
#define CollHeaderViewH  175

@interface HomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    float beginContentY;
    float endContentY;
    CGFloat sectionHeaderHeight;    //section的header高度
    NavView *navView;
}
@property (nonatomic, strong) UICollectionView *collectionView;
@end
static NSString * const reuseIdentifier = @"cell";
@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    UIImageView *bgImV = [[UIImageView alloc]initWithFrame:self.view.bounds];
    bgImV.image = [UIImage imageNamed:@"mg_backG"];
    [self.view addSubview:bgImV];
    
    navView = [[NavView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, 64) titleImage:[UIImage imageNamed:@"Nav"] titleString:nil leftButtonImg:nil btnClick:^{
        
    } rightButton:nil rightClick:^{
        
    }];
    
    navView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:navView];
    
    [self.view addSubview:self.collectionView];
}
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        
        flowLayout.itemSize = CGSizeMake(CollectViewCellW, CollectViewCellH);
        flowLayout.headerReferenceSize =CGSizeMake(CollHeaderViewW,CollHeaderViewH);//头视图大小
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        flowLayout.minimumLineSpacing = 10;
        flowLayout.minimumInteritemSpacing = 10;
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, kWindowW, kWindowH-64) collectionViewLayout:flowLayout];
        
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
//        _collectionView.
        
        [_collectionView registerClass:[HomeCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
        [_collectionView registerClass:[HomeCollectHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
        
    }
    return _collectionView;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"forIndexPath:indexPath];
    return header;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(CollHeaderViewW, CollHeaderViewH);
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
    return 10;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (CGSize)sizeForChildContentContainer:(nonnull id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize
{
    return CGSizeMake(CollectViewCellW, CollectViewCellH);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(10, 10, 5, 10);
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetY = scrollView.contentOffset.y + _collectionView.contentInset.top;
    if (offsetY > 64) {
        [UIView animateWithDuration:1 animations:^{
            navView.frame = CGRectMake(0, -64, kWindowW, 64);
            _collectionView.frame = CGRectMake(0, 0, kWindowW, kWindowH);
        }];
        
    }
    if (offsetY < -60){
        [UIView animateWithDuration:1 animations:^{
            navView.frame = CGRectMake(0, 0, kWindowW, 64);
            _collectionView.frame = CGRectMake(0, 64, kWindowW, kWindowH-64);
        }];
        
    }
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
