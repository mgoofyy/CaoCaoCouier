//
//  SettingViewController.m
//  caocaoKDY
//
//  Created by goofygao on 16/3/13.
//  Copyright © 2016年 goofyy. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()<UITableViewDataSource,UITableViewDelegate>
/**
 *  设置列表
 */
@property (nonatomic,strong) UITableView *settingTableView;

@property (nonatomic,strong) NSArray *itemsArray;
@end

@implementation SettingViewController

#pragma mark lazy load 
-(UITableView *)settingTableView {
    if (!_settingTableView) {
        _settingTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 10, SCRE_WIDTH, SCRE_HEIGHT)];
        _settingTableView.delegate = self;
        _settingTableView.dataSource = self;
        [_settingTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        
    }
    return _settingTableView;
}

-(NSArray *)itemsArray {
    if (!_itemsArray) {
        _itemsArray = @[
                        @"查看个人资料",
                        @"意见与反馈",
                        @"联系我们",
                        @"关于曹操快递"
                        ];
    }
    return _itemsArray;
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
    self.title = @"设置";
    self.view.backgroundColor = [UIColor colorWithRed:249.0/255.0 green:241.0/255.0 blue:235.0/255.0 alpha:1];
    NSDictionary * dict=[NSDictionary dictionaryWithObject:[UIColor blackColor] forKey:NSForegroundColorAttributeName];
    self.navigationController.navigationBar.titleTextAttributes = dict;
    [self.view addSubview:self.settingTableView];
}

#pragma mark UITableViewDataSource,UITableViewDelegate 
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = self.itemsArray[indexPath.row];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}
@end
