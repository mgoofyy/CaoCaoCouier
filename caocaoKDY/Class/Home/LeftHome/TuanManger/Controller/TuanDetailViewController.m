//
//  TuanDetailViewController.m
//  caocaoKDY
//
//  Created by goofygao on 16/3/15.
//  Copyright © 2016年 goofyy. All rights reserved.
//

#import "TuanDetailViewController.h"
#import "UIView+Extend.h"
#import "TuanDetail.h"

@interface TuanDetailViewController ()
/**
 *  团购信息view
 */
@property (nonatomic,strong) TuanDetail *tuanDetailView;
/**
 *  删除团购
 */
@property (nonatomic,strong) UIButton *deleteTuanGouBtn;

@end

@implementation TuanDetailViewController

#pragma mark lazy load 
-(TuanDetail *)tuanDetailView {
    if (!_tuanDetailView) {
        _tuanDetailView = [[[NSBundle mainBundle]loadNibNamed:@"TuanDetail" owner:self options:nil]objectAtIndex:0];
        _tuanDetailView.frame = CGRectMake(10, 74, SCRE_WIDTH - 20, 230);
        _tuanDetailView.layer.cornerRadius = 5;
        UIImageView *righeUPImageView = [[UIImageView alloc]initWithFrame:CGRectMake(_tuanDetailView.width - 20, -5, 25, 25)];
        righeUPImageView.image = [UIImage imageNamed:@"home_page_tuan"];
        [_tuanDetailView addSubview:righeUPImageView];
        
    }
    return _tuanDetailView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    [self initBottomView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark initView 
- (void)initView {
    self.title = @"团购详情";
    self.view.backgroundColor = [UIColor colorWithRed:249.0/255.0 green:241.0/255.0 blue:235.0/255.0 alpha:1];
    NSDictionary * dict=[NSDictionary dictionaryWithObject:[UIColor blackColor] forKey:NSForegroundColorAttributeName];
    self.navigationController.navigationBar.titleTextAttributes = dict;
    [self.view addSubview:self.tuanDetailView];

    
}


- (void)initBottomView {
    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(10,CGRectGetMaxY(_tuanDetailView.frame)+ 10, SCRE_WIDTH - 20, 60)];
    bottomView.backgroundColor = [UIColor whiteColor];
    bottomView.layer.cornerRadius = 5;
    bottomView.layer.masksToBounds = YES;
    [self.view addSubview:bottomView];
    
    UILabel *remainTuanDayTitle = [[UILabel alloc]initWithFrame:CGRectMake(30, 15, 140, 30)];
    remainTuanDayTitle.text = @"离团购结束还有";
    remainTuanDayTitle.textColor = [UIColor blackColor];
    [bottomView addSubview:remainTuanDayTitle];
    
    UILabel *remainTuanDayNumber = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(remainTuanDayTitle.frame), 10, 20, 35)];
    remainTuanDayNumber.textColor = [UIColor orangeColor];
    remainTuanDayNumber.font = [UIFont systemFontOfSize:20];
    remainTuanDayNumber.text = @"9";
    [bottomView addSubview:remainTuanDayNumber];
    
    UILabel *dayLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(remainTuanDayNumber.frame) + 20, 15, 20, 30)];
    dayLabel.text = @"天";
    dayLabel.textColor = [UIColor blackColor];
    [bottomView addSubview:dayLabel];
    
    self.deleteTuanGouBtn = [[UIButton alloc]initWithFrame:CGRectMake(40, SCRE_HEIGHT - 50, SCRE_WIDTH - 80, 40)];
    [_deleteTuanGouBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [_deleteTuanGouBtn addTarget:self action:@selector(deleteTuanAction) forControlEvents:UIControlEventTouchDown];
    [_deleteTuanGouBtn setTitle:@"删除团购" forState:UIControlStateNormal];
    _deleteTuanGouBtn.layer.cornerRadius = 5;
    _deleteTuanGouBtn.layer.masksToBounds = YES;
    _deleteTuanGouBtn.layer.borderColor = [UIColor orangeColor].CGColor;
    _deleteTuanGouBtn.layer.borderWidth = 1;
    [self.view addSubview:_deleteTuanGouBtn];
    
    
}


#pragma mark action

- (void)deleteTuanAction {
    
}

@end
