//
//  OrderRunnigViewController.m
//  caocaoKDY
//
//  Created by goofygao on 16/3/14.
//  Copyright © 2016年 goofyy. All rights reserved.
//

#import "OrderRunnigViewController.h"
#import "RunningOrderInfoView.h"
#import "UIView+Extend.h"

@interface OrderRunnigViewController ()
/**
 *  用户头像
 */
@property (nonatomic,strong) UIImageView *userImageView;
/**
 *  用户电话
 */
@property (nonatomic,strong) UILabel *userPhoneNumber;
/**
 *  关于快递单的信息
 */
@property (nonatomic,strong)  RunningOrderInfoView *runningOrderInfoView;

@property (nonatomic,strong) NSArray *remark;

@property (nonatomic,strong) UILabel *totalMoneyLabel;


@end

@implementation OrderRunnigViewController

-(RunningOrderInfoView *)runningOrderInfoView {
    if (!_runningOrderInfoView) {
        _runningOrderInfoView = [[[NSBundle mainBundle]loadNibNamed:@"RunningOrderInfoView" owner:self options:nil]objectAtIndex:0];
        _runningOrderInfoView.frame = CGRectMake(10, 154, SCRE_WIDTH - 20, 55);
        _runningOrderInfoView.layer.cornerRadius = 5;
        _runningOrderInfoView.layer.masksToBounds = YES;
    }
    return _runningOrderInfoView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma  mark initView

- (void)initView {
    self.title = @"进行中";
    
    self.view.backgroundColor = [UIColor colorWithRed:249.0/255.0 green:241.0/255.0 blue:235.0/255.0 alpha:1];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    [self initTopView];
    [self initBottomView];
    
}

- (void)initTopView {
    UIView *firstView = [[UIView alloc]initWithFrame:CGRectMake(10, 74, SCRE_WIDTH - 20, 70)];
    firstView.backgroundColor = [UIColor whiteColor];
    firstView.layer.cornerRadius = 5;
    firstView.layer.masksToBounds = YES;
    [self.view addSubview:firstView];
    /**
     *  初始化用户头像
     */
    self.userImageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 10, 50, 50)];
    _userImageView.layer.cornerRadius = _userImageView.width/2;
    _userImageView.layer.masksToBounds = YES;
    _userImageView.image = [UIImage imageNamed:@"test_headImage"];
    [firstView addSubview:_userImageView];
    
    UILabel *userNameTitle = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_userImageView.frame) + 10, 25, 30, 20)];
    userNameTitle.text = @"用户";
    userNameTitle.font = [UIFont systemFontOfSize:13];
    userNameTitle.textColor = [UIColor orangeColor];
    [firstView addSubview:userNameTitle];
    /**
     *  初始化用户电话
     */
    self.userPhoneNumber = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(userNameTitle.frame), 25, 80, 20)];
    _userPhoneNumber.textColor = [UIColor grayColor];
    _userPhoneNumber.text = @"188****4180";
    _userPhoneNumber.font = [UIFont systemFontOfSize:13];
    [firstView addSubview:_userPhoneNumber];
    
    UIButton *callUserPhoneButton = [[UIButton alloc]initWithFrame:CGRectMake(firstView.width - 50, 15, 40, 40)];
    [callUserPhoneButton setImage:[UIImage imageNamed:@"running_call_user"] forState:UIControlStateNormal];
    [callUserPhoneButton setBackgroundColor:[UIColor orangeColor]];
    callUserPhoneButton.layer.cornerRadius = callUserPhoneButton.width/2;
    callUserPhoneButton.layer.masksToBounds = YES;
    [callUserPhoneButton addTarget:self action:@selector(callUserAction) forControlEvents:UIControlEventTouchDown];
    [firstView addSubview:callUserPhoneButton];
    [self.view addSubview:self.runningOrderInfoView];
}

- (void)initBottomView {
    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(_runningOrderInfoView.frame) + 10, SCRE_WIDTH - 20, 50)];
    bottomView.layer.cornerRadius = 5;
    bottomView.layer.masksToBounds = YES;
    bottomView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottomView];
    
    UIButton *scanExpressNumber = [[UIButton alloc]initWithFrame:CGRectMake(60, CGRectGetMaxY(bottomView.frame) + 10, SCRE_WIDTH - 120, 40)];
    [scanExpressNumber setImage:[UIImage imageNamed:@"running_scan_button"] forState:UIControlStateNormal];
    scanExpressNumber.layer.borderColor = [UIColor orangeColor].CGColor;
    scanExpressNumber.layer.borderWidth = 1;
    scanExpressNumber.layer.cornerRadius= 5;
    scanExpressNumber.layer.masksToBounds = YES;
    [self.view addSubview:scanExpressNumber];
    
    UIView *submitButtonMaskView = [[UIView alloc]initWithFrame:CGRectMake(0, SCRE_HEIGHT - 40, SCRE_WIDTH, 40)];
    submitButtonMaskView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:submitButtonMaskView];
    UILabel *moneyTitle = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, 60, 30)];
    moneyTitle.text = @"总金额";
    moneyTitle.textColor = [UIColor blackColor];
    moneyTitle.font = [UIFont systemFontOfSize:15];
    [submitButtonMaskView addSubview:moneyTitle];
    
    self.totalMoneyLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(moneyTitle.frame), 5, 60, 30)];
    _totalMoneyLabel.textColor = [UIColor orangeColor];
    _totalMoneyLabel.text = @"0";
    _totalMoneyLabel.font = [UIFont systemFontOfSize:18];
    [submitButtonMaskView addSubview:_totalMoneyLabel];
    
    UIButton *submitButton = [[UIButton alloc]initWithFrame:CGRectMake(SCRE_WIDTH - 70, 5, 60, 30)];
    [submitButton setBackgroundColor:[UIColor orangeColor]];
    submitButton.titleLabel.font = [UIFont systemFontOfSize:12];
    submitButton.layer.cornerRadius = 5;
    submitButton.layer.masksToBounds = YES;
    [submitButton addTarget:self action:@selector(submitAction) forControlEvents:UIControlEventTouchDown];
    [submitButton setTitle:@"确认提交" forState:UIControlStateNormal];
    [submitButtonMaskView addSubview:submitButton];
    
    
}


#pragma mark action

- (void)callUserAction {
    
}


- (void)submitAction {
    
}
@end
