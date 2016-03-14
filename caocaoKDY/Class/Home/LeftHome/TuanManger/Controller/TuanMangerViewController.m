//
//  TuanMangerViewController.m
//  caocaoKDY
//
//  Created by goofygao on 16/3/13.
//  Copyright © 2016年 goofyy. All rights reserved.
//

#import "TuanMangerViewController.h"
#import "TuanMangerTableViewCell.h"

@interface TuanMangerViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tuanMangerTabView;

@end

@implementation TuanMangerViewController
#define CELL_IDENFITY @"cell"

#pragma mark lazy load

- (UITableView *)tuanMangerTabView {
    if (!_tuanMangerTabView) {
        _tuanMangerTabView = [[UITableView alloc]initWithFrame:CGRectMake(10, 0, SCRE_WIDTH - 20, SCRE_HEIGHT - 64)];
        _tuanMangerTabView.delegate = self;
        _tuanMangerTabView.dataSource = self;
        _tuanMangerTabView.backgroundColor = [UIColor clearColor];
        UINib *nib = [UINib nibWithNibName:NSStringFromClass([TuanMangerTableViewCell class]) bundle:nil];
        [_tuanMangerTabView registerNib:nib forCellReuseIdentifier:CELL_IDENFITY];
    }
    return _tuanMangerTabView;
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
    self.title = @"团购管理";
    self.view.backgroundColor = [UIColor colorWithRed:249.0/255.0 green:241.0/255.0 blue:235.0/255.0 alpha:1];
    NSDictionary * dict=[NSDictionary dictionaryWithObject:[UIColor blackColor] forKey:NSForegroundColorAttributeName];
    self.navigationController.navigationBar.titleTextAttributes = dict;
    [self.view addSubview:self.tuanMangerTabView];
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
        UINib *nib = [UINib nibWithNibName:NSStringFromClass([TuanMangerTableViewCell class]) bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:CELL_IDENFITY];
        nibsRegistered = YES;
    }
    TuanMangerTableViewCell *cell = (TuanMangerTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CELL_IDENFITY];
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [self.navigationController pushViewController:[OrderRunnigViewController new] animated:YES];
    NSLog(@"___________%s",__func__);
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70.0;
}

@end
