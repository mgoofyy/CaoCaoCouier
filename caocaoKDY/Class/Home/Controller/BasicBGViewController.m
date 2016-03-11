//
//  BasicBGViewController.m
//  caocaoKDY
//
//  Created by goofygao on 16/3/11.
//  Copyright © 2016年 goofyy. All rights reserved.
//

#import "BasicBGViewController.h"

@interface BasicBGViewController ()

@end

@implementation BasicBGViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"home_page_bg_image"]];
    //设置navigation全透明
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
