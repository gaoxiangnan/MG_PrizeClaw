//
//  InstructionViewController.m
//  MG_PrizeClaw
//
//  Created by 高向楠 on 2017/12/12.
//  Copyright © 2017年 高向楠. All rights reserved.
//

#import "InstructionViewController.h"

@interface InstructionViewController ()
{
    NavView *navView;
}
@end

@implementation InstructionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    navView = [[NavView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, 64) titleImage:[UIImage imageNamed:@"Nav"] titleString:nil leftButtonImg:nil btnClick:^{
        [self.navigationController popViewControllerAnimated:YES];
    } rightButton:nil rightClick:^{
        
    }];
    navView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:navView];
    // Do any additional setup after loading the view.
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
