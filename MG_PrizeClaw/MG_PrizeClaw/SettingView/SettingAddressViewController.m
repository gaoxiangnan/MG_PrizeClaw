//
//  SettingAddressViewController.m
//  MG_PrizeClaw
//
//  Created by 高向楠 on 2017/12/11.
//  Copyright © 2017年 高向楠. All rights reserved.
//

#import "SettingAddressViewController.h"
#import "AddressTableViewCell.h"
#import "NavView.h"
#import "EditAddressViewController.h"

@interface SettingAddressViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NavView *navView;
}
@property (nonatomic, strong) UITableView *addressTab;
@end

@implementation SettingAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    navView = [[NavView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, 64) titleImage:[UIImage imageNamed:@"Nav"] titleString:nil leftButtonImg:[UIImage imageNamed:@"Backimg"] btnClick:^{
        [self.navigationController popViewControllerAnimated:YES];
    } rightButton:[UIImage imageNamed:@"ProImg"] rightClick:^{
        
    }];
    
    _addressTab = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, kWindowW, kWindowH - 64) style:UITableViewStylePlain];
    _addressTab.delegate = self;
    _addressTab.dataSource = self;
    _addressTab.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_addressTab];
    // Do any additional setup after loading the view.
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 140;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *foot = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, 10)];
    return foot;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"AddressTableViewCell";
    AddressTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[AddressTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    cell.editBlock = ^(){
        NPrintLog(@"点击编辑");
        EditAddressViewController *editVC = [[EditAddressViewController alloc]init];
        [self.navigationController pushViewController:editVC animated:YES];
    };
    cell.deleteBlock = ^(){
        NPrintLog(@"点击删除");
    };
    return cell;
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
