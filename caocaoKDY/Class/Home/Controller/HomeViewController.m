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
#import "RealTimeOrderTableViewCell.h"
#import "OrderRunnigViewController.h"
#import "HomeHeaderView.h"

@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate>
/**
 *  实时订单
 */
@property (nonatomic,strong) UITableView *realTimeOrderssListTabView;
/**
 *  tableView header
 */
@property (nonatomic,strong) HomeHeaderView *homeHeaderView;

@end

@implementation HomeViewController

#define CELL_IDENFITY @"cell"

#pragma mark lazy load

-(UITableView *)realTimeOrderssListTabView {
    if (!_realTimeOrderssListTabView) {
        _realTimeOrderssListTabView = [[UITableView alloc]initWithFrame:CGRectMake(10, 134, SCRE_WIDTH - 20, SCRE_HEIGHT - 134)];
        _realTimeOrderssListTabView.backgroundColor = [UIColor clearColor];
        _realTimeOrderssListTabView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _realTimeOrderssListTabView.backgroundColor = [UIColor clearColor];
        UINib *nib = [UINib nibWithNibName:NSStringFromClass([RealTimeOrderTableViewCell class]) bundle:nil];
        [_realTimeOrderssListTabView registerNib:nib forCellReuseIdentifier:CELL_IDENFITY];
        _realTimeOrderssListTabView.delegate = self;
        _realTimeOrderssListTabView.dataSource = self;
        
    }
    return _realTimeOrderssListTabView;
}


-(HomeHeaderView *)homeHeaderView {
    if (!_homeHeaderView) {
        _homeHeaderView = [[[NSBundle mainBundle]loadNibNamed:@"HomeHeaderView" owner:self options:nil]objectAtIndex:0];
        _homeHeaderView.frame = CGRectMake(10, 64, SCRE_WIDTH - 20, 134);
        
    }
    return _homeHeaderView;
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

#pragma mark initView

- (void)initView {
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"home_page_title_view"]];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"home_page_avater_image"] highImage:nil target:self action:@selector(leftBarButtonAction) forControlEvents:UIControlEventTouchDown];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"home_page_right_item_image"] highImage:nil target:self action:@selector(rightBarButtonAction) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:self.realTimeOrderssListTabView];
    [self.view addSubview:self.homeHeaderView];
//    self.realTimeOrderssListTabView.tableHeaderView = self.homeHeaderView;
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


#pragma mark UITableViewDataSource,UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
// 设置数据
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BOOL nibsRegistered = NO;
    if (!nibsRegistered) {
        UINib *nib = [UINib nibWithNibName:NSStringFromClass([RealTimeOrderTableViewCell class]) bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:CELL_IDENFITY];
        nibsRegistered = YES;
    }
    RealTimeOrderTableViewCell *cell = (RealTimeOrderTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CELL_IDENFITY];
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.navigationController pushViewController:[OrderRunnigViewController new] animated:YES];
    NSLog(@"___________%s",__func__);
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70.0;
}

//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(10, 0, SCRE_WIDTH - 20, 30)];
//    UIImageView *realImageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 20, 20)];
//    realImageView.image = [UIImage imageNamed:@"home_page_yunxingwancheng"];
//    [headerView addSubview:realImageView];
//    UILabel *realTimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(realImageView.frame) + 10, 5, 100, 20)];
//    realTimeLabel.text = @"实时订单";
//    realTimeLabel.textColor = [UIColor whiteColor];
//    realTimeLabel.font = [UIFont systemFontOfSize:14];
//    [headerView addSubview:realTimeLabel];
//    return headerView;
//}
//
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    return 30;
//}


@end
