//
//  RecentOrdersViewController.m
//  caocaoKDY
//
//  Created by goofygao on 16/3/11.
//  Copyright © 2016年 goofyy. All rights reserved.
//

#import "RecentOrdersViewController.h"
#import "RecentOrdersTableViewCell.h"
@interface RecentOrdersViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *recentOrdersTabView;

@end

@implementation RecentOrdersViewController
#define CELL_IDENFITY @"cell"

#pragma mark lazy load
-(UITableView *)recentOrdersTabView {
    if (!_recentOrdersTabView) {
        _recentOrdersTabView = [[UITableView alloc]initWithFrame:CGRectMake(10, 0, SCRE_WIDTH - 20, SCRE_HEIGHT)];
        _recentOrdersTabView.delegate = self;
        _recentOrdersTabView.dataSource = self;
        _recentOrdersTabView.backgroundColor = [UIColor clearColor];
        _recentOrdersTabView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _recentOrdersTabView.backgroundColor = [UIColor clearColor];
        UINib *nib = [UINib nibWithNibName:NSStringFromClass([RecentOrdersTableViewCell class]) bundle:nil];
        [_recentOrdersTabView registerNib:nib forCellReuseIdentifier:CELL_IDENFITY];

    }
    return _recentOrdersTabView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
//    _homeHeaderView = [[[NSBundle mainBundle]loadNibNamed:@"HomeHeaderView" owner:self options:nil]objectAtIndex:0];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark initView 
/**
 *  初始化视图
 */
- (void)initView {
    self.title = @"最近订单";
    NSDictionary * dict=[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    self.navigationController.navigationBar.titleTextAttributes = dict;
    [self.view addSubview:self.recentOrdersTabView];

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
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"___________%s",__func__);
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0;
}

@end
