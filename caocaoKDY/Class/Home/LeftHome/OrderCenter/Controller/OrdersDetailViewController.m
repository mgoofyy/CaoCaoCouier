//
//  OrdersDetailViewController.m
//  caocaoKDY
//
//  Created by goofygao on 16/3/15.
//  Copyright © 2016年 goofyy. All rights reserved.
//

#import "OrdersDetailViewController.h"
#import "RunningOrderInfoView.h"
#import "ExpressNumberTableViewCell.h"
#import "UIView+Extend.h"

@interface OrdersDetailViewController ()<UITableViewDataSource,UITableViewDelegate>
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

@property (nonatomic,strong) UITableView *orderListTableView;


@end

@implementation OrdersDetailViewController
#define CELL_IDENFITY @"cell"

-(RunningOrderInfoView *)runningOrderInfoView {
    if (!_runningOrderInfoView) {
        _runningOrderInfoView = [[[NSBundle mainBundle]loadNibNamed:@"RunningOrderInfoView" owner:self options:nil]objectAtIndex:0];
        _runningOrderInfoView.frame = CGRectMake(10, 154, SCRE_WIDTH - 20, 55);
        _runningOrderInfoView.layer.cornerRadius = 5;
        _runningOrderInfoView.layer.masksToBounds = YES;
    }
    return _runningOrderInfoView;
}

-(UITableView *)orderListTableView {
    if (!_orderListTableView) {
        _orderListTableView = [[UITableView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(self.runningOrderInfoView.frame) + 10, SCRE_WIDTH - 20, SCRE_HEIGHT - CGRectGetMaxY(self.runningOrderInfoView.frame) - 110)];
        UINib *nib = [UINib nibWithNibName:NSStringFromClass([ExpressNumberTableViewCell class]) bundle:nil];
        [_orderListTableView registerNib:nib forCellReuseIdentifier:CELL_IDENFITY];
        _orderListTableView.layer.cornerRadius = 5;
        _orderListTableView.layer.masksToBounds = YES;
        _orderListTableView.delegate = self;
        _orderListTableView.dataSource = self;
        
    }
    return _orderListTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    [self.view addSubview:self.orderListTableView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma  mark initView

- (void)initView {
    self.title = @"订单详情";
    
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
    
    UIButton *scanExpressNumber = [[UIButton alloc]initWithFrame:CGRectMake(60, CGRectGetMaxY(self.orderListTableView.frame) + 10, SCRE_WIDTH - 120, 30)];
//    [scanExpressNumber setImage:[UIImage imageNamed:@"running_scan_button"] forState:UIControlStateNormal];
    [scanExpressNumber setTitle:@"用户已支付运费" forState:UIControlStateNormal];
    [scanExpressNumber setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    scanExpressNumber.titleLabel.font = [UIFont systemFontOfSize:15];
    [scanExpressNumber addTarget:self action:@selector(scanExpressAction) forControlEvents:UIControlEventTouchDown];
    scanExpressNumber.layer.borderColor = [UIColor orangeColor].CGColor;
    scanExpressNumber.layer.borderWidth = 1;
    scanExpressNumber.layer.cornerRadius= 5;
    scanExpressNumber.layer.masksToBounds = YES;
    [self.view addSubview:scanExpressNumber];
    
    UIView *submitButtonMaskView = [[UIView alloc]initWithFrame:CGRectMake(0, SCRE_HEIGHT - 40, SCRE_WIDTH, 40)];
    submitButtonMaskView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:submitButtonMaskView];
    UILabel *moneyTitle = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, 40, 30)];
    moneyTitle.text = @"面单数";
    moneyTitle.textColor = [UIColor blackColor];
    moneyTitle.font = [UIFont systemFontOfSize:13];
    [submitButtonMaskView addSubview:moneyTitle];
    
    self.totalMoneyLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(moneyTitle.frame), 5, 35, 30)];
    _totalMoneyLabel.textColor = [UIColor orangeColor];
    _totalMoneyLabel.text = @"000";
    _totalMoneyLabel.font = [UIFont systemFontOfSize:18];
    [submitButtonMaskView addSubview:_totalMoneyLabel];
    
    UILabel *labelTmp = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_totalMoneyLabel.frame), 5, 20, 30)];
    labelTmp.text = @"张";
    labelTmp.textColor = [UIColor blackColor];
    labelTmp.font = [UIFont systemFontOfSize:12];
    [submitButtonMaskView addSubview:labelTmp];
    
    UILabel *totalMoneyLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCRE_WIDTH - 110, 5, 50, 30)];
    totalMoneyLabel.text = @"总金额:";
    totalMoneyLabel.font = [UIFont systemFontOfSize:13];
    totalMoneyLabel.textColor = [UIColor blackColor];
    [submitButtonMaskView addSubview:totalMoneyLabel];
    
    UILabel *totalMoneyNumber = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(totalMoneyLabel.frame), 5, 35, 30)];
    totalMoneyNumber.textColor = [UIColor orangeColor];
    totalMoneyNumber.text = @"000";
    totalMoneyNumber.font = [UIFont systemFontOfSize:18];
    [submitButtonMaskView addSubview:totalMoneyNumber];
    
    UILabel *yuanLabelTmp = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(totalMoneyNumber.frame), 5, 20, 30)];
    yuanLabelTmp.text = @"元";
    yuanLabelTmp.textColor = [UIColor blackColor];
    yuanLabelTmp.font = [UIFont systemFontOfSize:12];
    [submitButtonMaskView addSubview:yuanLabelTmp];
}


#pragma mark action

- (void)callUserAction {
    
}


- (void)submitAction {
    
}

- (void)scanExpressAction {
   
}

#pragma mark - custom function


#pragma mark UITableViewDataSource,UITableViewDelegate

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BOOL nibsRegistered = NO;
    if (!nibsRegistered) {
        UINib *nib = [UINib nibWithNibName:NSStringFromClass([ExpressNumberTableViewCell class]) bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:CELL_IDENFITY];
        nibsRegistered = YES;
    }
    ExpressNumberTableViewCell *cell = (ExpressNumberTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CELL_IDENFITY];
//    cell.expressNumberString = @"3122345";
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 30.0;
}

@end