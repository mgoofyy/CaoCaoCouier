//
//  SignUpViewController.m
//  caocaoKDY
//
//  Created by goofygao on 16/3/15.
//  Copyright © 2016年 goofyy. All rights reserved.
//

#import "SignUpViewController.h"
#import "UIView+Extend.h"

@interface SignUpViewController () <UICollectionViewDataSource,UICollectionViewDelegate>
/**
 *  顶部进度条 个人资料
 */
@property (nonatomic,strong) UIImageView *topLeftImageView;
/**
 *  顶部进度条 收件区域
 */
@property (nonatomic,strong) UIImageView *topMiddleImageView;
/**
 *  完成
 */
@property (nonatomic,strong) UIImageView *topRightImageView;
/**
 *  注册详情页
 */
@property (nonatomic,strong) UICollectionView *signUpCollectionView;
/**
 *  注册第一页
 */
@property (nonatomic,strong) UIScrollView *signFirstScrollView;
/**
 *  用户名输入框
 */
@property (nonatomic,strong) UITextField *userNameTextField;
/**
 *  所属公司
 */
@property (nonatomic,strong) UITextField *expressFactoryTextField;
/**
 *  工作证件号码
 */
@property (nonatomic,strong) UITextField *workIDTextField;
/**
 *  身份证正面imageView
 */
@property (nonatomic,strong) UIImageView *personalIDCardFontImageView;
/**
 *  身份证背面imageView
 */
@property (nonatomic,strong) UIImageView *personalIDCardBackImageView;
/**
 *  工作证正面imageView
 */
@property (nonatomic,strong) UIImageView *workIDCardFontImageView;
/**
 *  工作证背面imageView
 */
@property (nonatomic,strong) UIImageView *workIDCardBackImageView;
@end

@implementation SignUpViewController
#define CELL_IDENFITY @"cell"
-(UICollectionView *)signUpCollectionView {
    if (!_signUpCollectionView) {
        UICollectionViewFlowLayout *cellLayout = [[UICollectionViewFlowLayout alloc]init];
        cellLayout.itemSize = CGSizeMake(SCRE_WIDTH, SCRE_HEIGHT - 114);
        cellLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        cellLayout.minimumLineSpacing = 0;
        _signUpCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 114, SCRE_WIDTH, SCRE_HEIGHT - 114) collectionViewLayout:cellLayout];
        _signUpCollectionView.bounces = YES;
        _signUpCollectionView.bouncesZoom = NO;
        _signUpCollectionView.alwaysBounceHorizontal = YES;
        _signUpCollectionView.pagingEnabled = YES;
        _signUpCollectionView.delegate = self;
        _signUpCollectionView.dataSource = self;
        [_signUpCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:CELL_IDENFITY];
        _signUpCollectionView.showsVerticalScrollIndicator = NO;
//        _signUpCollectionView.

    }
    return _signUpCollectionView;
}

-(UIScrollView *)signFirstScrollView {
    if (!_signFirstScrollView) {
        _signFirstScrollView = [[UIScrollView alloc]initWithFrame: CGRectMake(0, 0, SCRE_WIDTH, SCRE_HEIGHT - 114)];
        _signFirstScrollView.backgroundColor = [UIColor whiteColor];
        _signFirstScrollView.delegate = self;
        _signFirstScrollView.contentSize = CGSizeMake(SCRE_WIDTH, SCRE_HEIGHT * 2);
        [self initScrollView];
    }
    return _signFirstScrollView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    [self initTopProcessView];
    [self.view addSubview:self.signUpCollectionView];
    [self initUpLoadImageView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark initView 
- (void)initView {
    self.title = @"注册中";
    self.view.backgroundColor = [UIColor whiteColor];
}

/**
 *  初始化顶部进度条imageView
 */
- (void)initTopProcessView {
    self.topLeftImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, SCRE_WIDTH/3, 50)];
    _topLeftImageView.image = [UIImage imageNamed:@"sign_up_process_doen"];
    UILabel *personalProfileLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 15, 60, 25)];
    personalProfileLabel.text = @"个人资料";
    personalProfileLabel.font = [UIFont systemFontOfSize:14];
    personalProfileLabel.textColor = [UIColor whiteColor];
    [_topLeftImageView addSubview:personalProfileLabel];
    [self.view addSubview:_topLeftImageView];
    
    self.topMiddleImageView = [[UIImageView alloc]initWithFrame:CGRectMake(SCRE_WIDTH/3, 64, SCRE_WIDTH * 1/3, 50)];
    _topMiddleImageView.image = [UIImage imageNamed:@"sign_up_process_to_do"];
    UILabel *placeLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 15, 60, 25)];
    placeLabel.text = @"收件区域";
    placeLabel.font = [UIFont systemFontOfSize:14];
    placeLabel.textColor = [UIColor whiteColor];
    [_topMiddleImageView addSubview:placeLabel];
    [self.view addSubview:_topMiddleImageView];
    
    self.topRightImageView = [[UIImageView alloc]initWithFrame:CGRectMake(SCRE_WIDTH * 2/3, 64, SCRE_WIDTH/3, 50)];
    _topRightImageView.image = [UIImage imageNamed:@"sign_up_process_to_do"];
    UILabel *doneLabel = [[UILabel alloc]initWithFrame:CGRectMake(35, 15, 60, 25)];
    doneLabel.text = @"完成";
    doneLabel.font = [UIFont systemFontOfSize:14];
    doneLabel.textColor = [UIColor whiteColor];
    [_topRightImageView addSubview:doneLabel];
    [self.view addSubview:_topRightImageView];
}

- (void)initScrollView {
    self.userNameTextField = [[UITextField alloc]initWithFrame:CGRectMake(10, 30, SCRE_WIDTH - 20, 40)];
    [_userNameTextField setBackground:[UIImage imageNamed:@"sign_up_username"]];
    _userNameTextField.textAlignment = NSTextAlignmentRight;
    _userNameTextField.textColor = [UIColor orangeColor];
    
    UILabel *nameTitleLeftView = [[UILabel alloc ]initWithFrame:CGRectMake(20, 0, 40, 30)];
    nameTitleLeftView.text = @" 姓名";
    nameTitleLeftView.textColor = [UIColor grayColor];
//    nameTitleLeftView.textAlignment = NSTextAlignmentRight;
    _userNameTextField.leftView = nameTitleLeftView;
    _userNameTextField.leftViewMode = UITextFieldViewModeAlways;
    [_signFirstScrollView addSubview:_userNameTextField];
    
    self.expressFactoryTextField = [[UITextField alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(_userNameTextField.frame) + 10, SCRE_WIDTH - 20, 40)];
    [_expressFactoryTextField setBackground:[UIImage imageNamed:@"sign_up_username"]];
    _expressFactoryTextField.textAlignment = NSTextAlignmentRight;
    _expressFactoryTextField.textColor = [UIColor orangeColor];
    
    UILabel *expressTitleLeftView = [[UILabel alloc ]initWithFrame:CGRectMake(20, 0, 120, 30)];
    expressTitleLeftView.text = @" 所属快递公司";
    expressTitleLeftView.textColor = [UIColor grayColor];
    _expressFactoryTextField.leftView = expressTitleLeftView;
    _expressFactoryTextField.leftViewMode = UITextFieldViewModeAlways;
    [_signFirstScrollView addSubview:_expressFactoryTextField];
    
    self.workIDTextField = [[UITextField alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(_expressFactoryTextField.frame) + 10, SCRE_WIDTH - 20, 40)];
    [_workIDTextField setBackground:[UIImage imageNamed:@"sign_up_username"]];
    _workIDTextField.textAlignment = NSTextAlignmentRight;
    _workIDTextField.textColor = [UIColor orangeColor];
    
    UILabel *workIDTitleLeftView = [[UILabel alloc ]initWithFrame:CGRectMake(20, 0, 120, 30)];
    workIDTitleLeftView.text = @" 工作证件号码";
    workIDTitleLeftView.textColor = [UIColor grayColor];
    _workIDTextField.leftView = workIDTitleLeftView;
    _workIDTextField.leftViewMode = UITextFieldViewModeAlways;
    [_signFirstScrollView addSubview:_workIDTextField];
    
    UILabel *personalIDCardFront = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(_workIDTextField.frame) + 5, 200, 30)];
    personalIDCardFront.text = @"身份证正面";
    personalIDCardFront.font = [UIFont systemFontOfSize:15];
    [_signFirstScrollView addSubview:personalIDCardFront];
    
    self.personalIDCardFontImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(personalIDCardFront.frame) + 5, SCRE_WIDTH - 20, 140)];
    if (self.view.width >320) {
        self.personalIDCardFontImageView.height = 160;
    }
    _personalIDCardFontImageView.image  = [UIImage imageNamed:@"sign_up_upload_image"];
//    _personalIDCardFontImageView addGestureRecognizer:<#(nonnull UIGestureRecognizer *)#>
    [_signFirstScrollView addSubview:_personalIDCardFontImageView];
    
    UILabel *personalIDCardBack = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(_signFirstScrollView.frame) + 5 - 114, 200, 30)];
    personalIDCardBack.text = @"身份证背面";
    personalIDCardBack.font = [UIFont systemFontOfSize:15];
    [_signFirstScrollView addSubview:personalIDCardBack];
    
    self.personalIDCardBackImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(personalIDCardBack.frame) + 5, SCRE_WIDTH - 20, 140)];
    if (self.view.width >320) {
        self.personalIDCardBackImageView.height = 160;
    }
    _personalIDCardBackImageView.image  = [UIImage imageNamed:@"sign_up_upload_image"];
    [_signFirstScrollView addSubview:_personalIDCardBackImageView];
    
    UILabel *workIDCardFont = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(_personalIDCardBackImageView.frame) + 5, 200, 30)];
    workIDCardFont.text = @"工作证正面";
    workIDCardFont.font = [UIFont systemFontOfSize:15];
    [_signFirstScrollView addSubview:workIDCardFont];
    
    self.workIDCardFontImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(workIDCardFont.frame) + 5, SCRE_WIDTH - 20, 140)];
    if (self.view.width >320) {
        self.workIDCardFontImageView.height = 160;
    }
    _workIDCardFontImageView.image  = [UIImage imageNamed:@"sign_up_upload_image"];
    [_signFirstScrollView addSubview:_workIDCardFontImageView];
    
    UILabel *workIDCardBack = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(_workIDCardFontImageView.frame) + 5, 200, 30)];
    workIDCardBack.text = @"工作证背面";
    workIDCardBack.font = [UIFont systemFontOfSize:15];
    [_signFirstScrollView addSubview:workIDCardBack];
    
    self.workIDCardBackImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(workIDCardBack.frame) + 5, SCRE_WIDTH - 20, 140)];
    if (self.view.width >320) {
        self.workIDCardBackImageView.height = 160;
    }
    _workIDCardBackImageView.image  = [UIImage imageNamed:@"sign_up_upload_image"];
    [_signFirstScrollView addSubview:_workIDCardBackImageView];
}

- (void)initUpLoadImageView {
    
}


#pragma mark <UICollectionViewDataSource,UICollectionViewDelegate>

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CELL_IDENFITY forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    if (indexPath.row == 0) {
        [cell.contentView addSubview:self.signFirstScrollView];
    } else if (indexPath.row == 1) {
        
    } else if (indexPath.row == 2) {
        
    }
    return cell;
}

@end
