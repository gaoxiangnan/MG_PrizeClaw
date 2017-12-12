//
//  MessageViewController.m
//  MG_PrizeClaw
//
//  Created by 高向楠 on 2017/12/11.
//  Copyright © 2017年 高向楠. All rights reserved.
//

#import "MessageViewController.h"
#import "MessageTableViewCell.h"

@interface MessageViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NavView *navView;
}
@property (nonatomic, strong) UITableView *messageTab;
@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    navView = [[NavView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, 64) titleImage:nil titleString:@"消息中心" leftButtonImg:[UIImage imageNamed:@"Backimg"] btnClick:^{
        [self.navigationController popViewControllerAnimated:YES];
    } rightButton:nil rightClick:^{
        
    }];
    navView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:navView];
    
    _messageTab = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, kWindowW, kWindowH - 64) style:UITableViewStylePlain];
    _messageTab.backgroundColor = [UIColor clearColor];
    _messageTab.delegate = self;
    _messageTab.dataSource = self;
    _messageTab.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_messageTab];
    
    // Do any additional setup after loading the view.
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *str = @"欢迎来到趣抓，600金币已赠送到您的账户欢迎来到趣抓";
    CGFloat a = [MessageTableViewCell heightForString:str];
    return a+65;
//    return 140;
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
    static NSString *identify = @"MessageTableViewCell";
    MessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[MessageTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
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
