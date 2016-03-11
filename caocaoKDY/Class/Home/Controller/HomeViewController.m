//
//  HomeViewController.m
//  caocaoKDY
//
//  Created by goofygao on 16/3/11.
//  Copyright © 2016年 goofyy. All rights reserved.
//

#import "HomeViewController.h"
#import "UIBarButtonItem+GFBarButtonItem.h"
#import "LeftHomeViewController.h"
#import "RecentOrdersViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark initView

- (void)initView {
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"home_page_title_view"]];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"home_page_avater_image"] highImage:nil target:self action:@selector(leftBarButtonAction) forControlEvents:UIControlEventTouchDown];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"home_page_right_item_image"] highImage:nil target:self action:@selector(rightBarButtonAction) forControlEvents:UIControlEventTouchDown];
}

#pragma mark action事件响应
/**
 *  跳转个人中心 (action)
 */
- (void)leftBarButtonAction {
    [self.navigationController pushViewController:[LeftHomeViewController new] animated:YES];
}

/**
 *  最近订单 action
 */
- (void)rightBarButtonAction {
    [self.navigationController pushViewController:[RecentOrdersViewController new] animated:YES];
}

@end
