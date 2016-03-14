//
//  LeftHomeViewController.m
//  caocaoKDY
//
//  Created by goofygao on 16/3/11.
//  Copyright © 2016年 goofyy. All rights reserved.
//

#import "LeftHomeViewController.h"
#import "GlobalNavigationController.h"
#import "PersonalnfoTabViewController.h"
#import "MyWalletViewController.h"
#import "OrderCenterViewController.h"
#import "RecommendViewController.h"
#import "SettingViewController.h"
#import "TuanMangerViewController.h"
#import "UIView+Extend.h"


@interface LeftHomeViewController () <UITableViewDataSource,UITableViewDelegate>
/**
 *  菜单列表
 */
@property (nonatomic,strong) UITableView *menuListTableView;

@property (nonatomic,strong) NSArray *controllArr;
/**
 *  头像View
 */
@property (nonatomic,strong) UIView *headView;
/**
 *  用户头像imageview
 */
@property (nonatomic,strong) UIImageView *avaterImageView;
/**
 *  用户昵称
 */
@property (nonatomic,strong) UILabel *userNameLabel;
/**
 *  用户星级view
 */
@property (nonatomic,strong) UIView *starLevelView;
/**
 *  用户星级数字label
 */
@property (nonatomic,strong) UILabel *starLevelNumber;
/**
 *  完成单量
 */
@property (nonatomic,strong) UILabel *finishedOrdersLabel;
@end

@implementation LeftHomeViewController

#pragma mark lazy load

-(UITableView *)menuListTableView {
    if (!_menuListTableView) {
        _menuListTableView = [[UITableView alloc]initWithFrame:CGRectMake(10, 10, SCRE_WIDTH - 20, SCRE_HEIGHT - 64)];
        _menuListTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _menuListTableView.backgroundColor = [UIColor clearColor];
        _menuListTableView.dataSource = self;
        _menuListTableView.delegate = self;
        _menuListTableView.scrollEnabled = NO;
    }
    return _menuListTableView;
}

- (NSArray *)controllArr
{
    if (!_controllArr) {
        _controllArr  = @[
                          [[MyWalletViewController alloc]init],
                          [[OrderCenterViewController alloc]init],
                          [[TuanMangerViewController alloc]init],
                          [[RecommendViewController alloc]init],
                          [[SettingViewController alloc]init],
                          ];
    }
    return _controllArr;
}

-(UIView *)headView {
    if (!_headView) {
        _headView = [[UIView alloc]initWithFrame:CGRectMake(10, 0, SCRE_WIDTH - 20, 80)];
        _headView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.05];
        _headView.layer.cornerRadius = 5;
        _headView.layer.masksToBounds = YES;
        UITapGestureRecognizer *headTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headTapClick)];
        [_headView addGestureRecognizer:headTap];

        /**
         头像
         */
        self.avaterImageView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 10, 60, 60)];
        _avaterImageView.image = [UIImage imageNamed:@"test_headImage"];
        _avaterImageView.layer.cornerRadius = _avaterImageView.width/2;
        _avaterImageView.layer.masksToBounds = YES;
        _avaterImageView.layer.borderColor = [UIColor colorWithWhite:1 alpha:0.1].CGColor;
        _avaterImageView.layer.borderWidth = 1.0f;
        [_headView addSubview:_avaterImageView];
        
        /**
         *  昵称
         */
        self.userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_avaterImageView.frame) + 10, CGRectGetMinY(_avaterImageView.frame) + 10, 60, 20)];
        _userNameLabel.text = @"诸葛孔明";
        _userNameLabel.textColor = [UIColor whiteColor];
        _userNameLabel.font = [UIFont systemFontOfSize:14];
        _userNameLabel.textAlignment = NSTextAlignmentLeft;
        [_headView addSubview:_userNameLabel];
        
        self.starLevelView = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_userNameLabel.frame), CGRectGetMinY(_avaterImageView.frame) + 10, 80, 20)];
        _starLevelView.backgroundColor = [UIColor redColor];
        [_headView addSubview:_starLevelView];
        
        self.starLevelNumber = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_starLevelView.frame) + 2, CGRectGetMinY(_avaterImageView.frame) + 5, 40, 30)];
        
        _starLevelNumber.textColor = [UIColor whiteColor];
        _starLevelNumber.font = [UIFont systemFontOfSize:15];
        _starLevelNumber.text = @"4.7";
        [_headView addSubview:_starLevelNumber];
        
        self.finishedOrdersLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(_userNameLabel.frame), CGRectGetMaxY(_userNameLabel.frame) + 2, SCRE_WIDTH/2, 30)];
        _finishedOrdersLabel.textColor = [UIColor whiteColor];
        _finishedOrdersLabel.text = @"已完成  224单";
        _finishedOrdersLabel.font = [UIFont systemFontOfSize:12];
        [_headView addSubview:_finishedOrdersLabel];
        
        UIImageView *moreImageView = [[UIImageView alloc]initWithFrame:CGRectMake(SCRE_WIDTH - 40, 30, 7, 14)];
        moreImageView.image = [UIImage imageNamed:@"home_page_more"];
        [_headView addSubview:moreImageView];
    }
    return _headView;
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
    self.title = @"个人中心";
    //设置title颜色
    NSDictionary * dict=[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    self.navigationController.navigationBar.titleTextAttributes = dict;
    [self.view addSubview:self.menuListTableView];
    self.menuListTableView.tableHeaderView = self.headView;
    
    
}

#pragma mark 事件响应

-(void)headTapClick {
    PersonalnfoTabViewController *persinalInfo = [[PersonalnfoTabViewController alloc]init];

    [self.navigationController pushViewController:persinalInfo animated:YES];
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
    UITableViewCell *Leftcell = [tableView dequeueReusableCellWithIdentifier:@"Leftcell"];
    if (!Leftcell) {
        Leftcell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Leftcell"];
        }
    Leftcell.contentView.backgroundColor = [UIColor clearColor];
    Leftcell.backgroundColor = [UIColor clearColor];
    Leftcell.textLabel.textColor = [UIColor whiteColor];
        if (indexPath.row == 0) {
            Leftcell.textLabel.text = @"我的钱包";
            Leftcell.imageView.image = [UIImage imageNamed:@"left_home_wallet"];
            
        }else if (indexPath.row == 1)
        {
            Leftcell.textLabel.text = @"订单中心";
            Leftcell.imageView.image = [UIImage imageNamed:@"left_home_orders"];
        } else if (indexPath.row == 2)
        {
            Leftcell.textLabel.text = @"团购管理";
            Leftcell.imageView.image = [UIImage imageNamed:@"left_home_tuan_buy"];
        }
    
        else if (indexPath.row == 3)
        {
            Leftcell.textLabel.text = @"推荐有奖";
            Leftcell.imageView.image = [UIImage imageNamed:@"left_home_recommend"];
        }else if (indexPath.row == 4)
        {
            Leftcell.textLabel.text = @"设置";
            Leftcell.imageView.image = [UIImage imageNamed:@"left_home_setting"];
        }
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 6, SCRE_WIDTH - 22, 43)];
    view.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.05f];
    view.layer.cornerRadius = 5;
    view.layer.masksToBounds = YES;
    [Leftcell addSubview:view];
    Leftcell.contentView.height = 30;
    Leftcell.accessoryView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"home_page_more"]];
    Leftcell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return Leftcell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.navigationController pushViewController:(UIViewController *)self.controllArr[indexPath.row] animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.0;
}

@end
