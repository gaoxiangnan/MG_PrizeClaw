//
//  FetchingRecordsController.m
//  MG_PrizeClaw
//
//  Created by 孙永建 on 2017/12/7.
//  Copyright © 2017年 高向楠. All rights reserved.
//

#import "FetchingRecordsController.h"
#import "FetchingRecordsCell.h"
@interface FetchingRecordsController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UIImageView  *Backimg;
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation FetchingRecordsController

-(UIImageView *)Backimg
{
    if (!_Backimg) {
        _Backimg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mg_backG"]];
        _Backimg.frame = self.view.frame;
    }
    return _Backimg;
}

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, kWindowW, kWindowH)];
        _tableView.backgroundColor = [UIColor clearColor];
    }
    return _tableView;
}





- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.Backimg];
    NavView *navView = [[NavView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, 64) titleImage:nil titleString:nil  leftButtonImg:[UIImage imageNamed:@"Backimg"] btnClick:^{
        [self.navigationController popViewControllerAnimated:YES];
    } rightButton:nil rightClick:^{
        
    }];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width-100)/2, 20, 100, 50)];
    label.text = @"抓取记录";
    label.font = [UIFont boldSystemFontOfSize:20.0f];
    label.textColor = [UIColor blackColor];
    [self.view addSubview:label];
    [self.view addSubview:navView];
    
    
    
    
    
    [self.view addSubview:self.tableView];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, 10)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *identify = @"FetchingRecordsCell";
    FetchingRecordsCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[FetchingRecordsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    cell.backgroundColor=[UIColor colorWithRed:191/225.0f green:248/225.0f blue:251/225.0f alpha:.8f];
    
     cell.selectionStyle =UITableViewCellSelectionStyleNone;
    
    
    
    return cell;
}



@end
