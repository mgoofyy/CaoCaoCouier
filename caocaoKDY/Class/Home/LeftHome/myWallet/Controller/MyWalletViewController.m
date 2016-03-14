//
//  MyWalletViewController.m
//  caocaoKDY
//
//  Created by goofygao on 16/3/13.
//  Copyright © 2016年 goofyy. All rights reserved.
//

#import "MyWalletViewController.h"
#import "UIView+Extend.h"

@interface MyWalletViewController ()

@end

@implementation MyWalletViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    [self initRemainingView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark initView 
- (void)initView {
    self.title = @"我的钱包";
    self.view.backgroundColor = [UIColor colorWithRed:249.0/255.0 green:241.0/255.0 blue:235.0/255.0 alpha:1];
    NSDictionary * dict=[NSDictionary dictionaryWithObject:[UIColor blackColor] forKey:NSForegroundColorAttributeName];
    self.navigationController.navigationBar.titleTextAttributes = dict;
}

- (void)initRemainingView {
    UIView *topMaskView = [[UIView alloc]initWithFrame:CGRectMake(10, 74, SCRE_WIDTH - 20, 120)];
    topMaskView.backgroundColor = [UIColor whiteColor];
    topMaskView.layer.cornerRadius = 5;
    topMaskView.layer.masksToBounds = YES;
    [self.view addSubview:topMaskView];
    
    UIImageView *moneyImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10,  30, 20, 20)];
    moneyImageView.image = [UIImage imageNamed:@"my_wallet_jiaoyi"];
    [topMaskView addSubview:moneyImageView];
    
    UILabel *remainingTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(moneyImageView.frame) + 10, 25, 50, 30)];
    remainingTitleLabel.text = @"余额:";
    remainingTitleLabel.font = [UIFont systemFontOfSize:20];
//    remainingMoneyLabel.t
    [topMaskView addSubview:remainingTitleLabel];
    
    UILabel *remainingMoneyLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(remainingTitleLabel.frame) + 10, 20, 200, 40)];
    remainingMoneyLabel.text = @"8.0元";
    remainingMoneyLabel.font = [UIFont systemFontOfSize:25];
    remainingMoneyLabel.textColor = [UIColor orangeColor];
    [topMaskView addSubview:remainingMoneyLabel];
    
    UIImageView *moreView = [[UIImageView alloc]initWithFrame:CGRectMake(topMaskView.width - 30, 40, 8, 16)];
    moreView.image = [UIImage imageNamed:@"my_wallet_more"];
//    moreView.backgroundColor = [UIColor redColor];
    [topMaskView addSubview:moreView];
    
    UIButton *withdrawButton = [[UIButton alloc]initWithFrame:CGRectMake(15, 70, topMaskView.width - 30, 40)];
    withdrawButton.backgroundColor = [UIColor orangeColor];
    [withdrawButton setTitle:@"提现" forState:UIControlStateNormal];
    [withdrawButton addTarget:self action:@selector(withDrawAction) forControlEvents:UIControlEventTouchDown];
    withdrawButton.layer.cornerRadius = 5;
    withdrawButton.layer.masksToBounds = YES;
    [topMaskView addSubview:withdrawButton];
}

#pragma mark action事件响应
- (void)Withdraw {
    
}
@end
