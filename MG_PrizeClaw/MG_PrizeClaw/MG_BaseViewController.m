//
//  MG_BaseViewController.m
//  MG_PrizeClaw
//
//  Created by 高向楠 on 2017/12/11.
//  Copyright © 2017年 高向楠. All rights reserved.
//

#import "MG_BaseViewController.h"

@interface MG_BaseViewController ()

@end

@implementation MG_BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *bgImV = [[UIImageView alloc]initWithFrame:self.view.bounds];
    bgImV.image = [UIImage imageNamed:@"mg_backG"];
    [self.view addSubview:bgImV];
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
