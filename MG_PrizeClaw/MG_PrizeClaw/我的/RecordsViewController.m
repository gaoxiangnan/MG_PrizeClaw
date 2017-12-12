//
//  RecordsViewController.m
//  MG_PrizeClaw
//
//  Created by 高向楠 on 2017/12/12.
//  Copyright © 2017年 高向楠. All rights reserved.
//

#import "RecordsViewController.h"
#import "RechargeTableViewCell.h"
@interface RecordsViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NavView *navView;
}

@property(nonatomic,strong)UITableView *tableView;

@end

@implementation RecordsViewController


-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, kWindowW, kWindowH-64)];
        _tableView.backgroundColor = [UIColor clearColor];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    navView = [[NavView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, 64) titleImage:[UIImage imageNamed:@"Nav"] titleString:nil leftButtonImg:[UIImage imageNamed:@"Backimg"] btnClick:^{
        
        [self.navigationController popViewControllerAnimated:YES];
        
    } rightButton:nil rightClick:^{
        
    }];
    
    [self.view addSubview:navView];
    
    
    
    [self.view addSubview:self.tableView];
    
    
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

    
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
    
    static NSString *identify = @"RechargeTableViewCell";
    RechargeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[RechargeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    cell.backgroundColor=[UIColor clearColor];
    
    cell.selectionStyle =UITableViewCellSelectionStyleNone;
    
    
    
    return cell;
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
