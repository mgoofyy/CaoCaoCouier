//
//  OrderCenterViewController.m
//  caocaoKDY
//
//  Created by goofygao on 16/3/13.
//  Copyright © 2016年 goofyy. All rights reserved.
//

#import "OrderCenterViewController.h"
#import "RecentOrdersTableViewCell.h"
#import "OrdersDetailViewController.h"

@interface OrderCenterViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *orderCenterTabView;

@end

@implementation OrderCenterViewController

#define CELL_IDENFITY @"cell"

#pragma mark lazy load
-(UITableView *)orderCenterTabView {
    if (!_orderCenterTabView) {
        _orderCenterTabView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCRE_WIDTH, SCRE_HEIGHT)];
        _orderCenterTabView.delegate = self;
        _orderCenterTabView.dataSource = self;
        _orderCenterTabView.backgroundColor = [UIColor clearColor];
        _orderCenterTabView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _orderCenterTabView.backgroundColor = [UIColor clearColor];
        UINib *nib = [UINib nibWithNibName:NSStringFromClass([RecentOrdersTableViewCell class]) bundle:nil];
        [_orderCenterTabView registerNib:nib forCellReuseIdentifier:CELL_IDENFITY];
        
    }
    return _orderCenterTabView;
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
    self.title = @"订单中心";
    self.view.backgroundColor = [UIColor colorWithRed:249.0/255.0 green:241.0/255.0 blue:235.0/255.0 alpha:1];
    NSDictionary * dict=[NSDictionary dictionaryWithObject:[UIColor blackColor] forKey:NSForegroundColorAttributeName];
    self.navigationController.navigationBar.titleTextAttributes = dict;
    [self.view addSubview:self.orderCenterTabView];
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
        UINib *nib = [UINib nibWithNibName:NSStringFromClass([RecentOrdersTableViewCell class]) bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:CELL_IDENFITY];
        nibsRegistered = YES;
    }
    RecentOrdersTableViewCell *cell = (RecentOrdersTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CELL_IDENFITY];
    cell.backgroundColor = [UIColor whiteColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.navigationController pushViewController:[OrdersDetailViewController new] animated:YES];
    NSLog(@"___________%s",__func__);
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0;
}


@end
