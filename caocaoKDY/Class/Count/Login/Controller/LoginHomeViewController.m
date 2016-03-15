//
//  LoginHomeViewController.m
//  caocaoKDY
//
//  Created by goofygao on 16/3/15.
//  Copyright © 2016年 goofyy. All rights reserved.
//

#import "LoginHomeViewController.h"
#import "SignUpViewController.h"
#import "UIView+Extend.h"

@interface LoginHomeViewController ()<UITextFieldDelegate>
/**
 *  手机号码
 */
@property (nonatomic,strong) UITextField *phoneNumberTextField;
/**
 *  验证码
 */
@property (nonatomic,strong) UITextField *securityCodeTextfield;
/**
 *  验证按钮
 */
@property (nonatomic,strong) UIButton *securityBtn;
/**
 *  登陆btn
 */
@property (nonatomic,strong) UIButton *loginBtn;
/**
 *  注册btn
 */
@property (nonatomic,strong) UIButton *signUpBtn;

@end

@implementation LoginHomeViewController

-(UITextField *)phoneNumberTextField {
    if (!_phoneNumberTextField) {
        _phoneNumberTextField = [[UITextField alloc]initWithFrame:CGRectMake(20, 164, SCRE_WIDTH - 100, 40)];
        _phoneNumberTextField.tag = 10;
        _phoneNumberTextField.placeholder = @"手机号";
        _phoneNumberTextField.layer.cornerRadius = 5;
        _phoneNumberTextField.layer.masksToBounds = YES;
        [[UITextField appearance] setTintColor:[UIColor orangeColor]];
        _phoneNumberTextField.backgroundColor = [UIColor whiteColor];
        UIView *leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 15, 30)];
        leftView.backgroundColor = [UIColor clearColor];
        _phoneNumberTextField.leftView = leftView;
        _phoneNumberTextField.leftViewMode = UITextFieldViewModeAlways;
        _phoneNumberTextField.delegate = self;
        _phoneNumberTextField.keyboardType = UIKeyboardTypeNumberPad;
    }
    return _phoneNumberTextField;
}

-(UITextField *)securityCodeTextfield {
    if (!_securityCodeTextfield) {
        _securityCodeTextfield = [[UITextField alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(self.phoneNumberTextField.frame) + 10, SCRE_WIDTH - 40, 40)];
        _securityCodeTextfield.tag = 20;
        _securityCodeTextfield.placeholder = @"验证码";
        _securityCodeTextfield.layer.cornerRadius = 5;
        _securityCodeTextfield.layer.masksToBounds = YES;
        [[UITextField appearance] setTintColor:[UIColor orangeColor]];
        _securityCodeTextfield.backgroundColor = [UIColor whiteColor];
        UIView *leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 15, 30)];
        leftView.backgroundColor = [UIColor clearColor];
        _securityCodeTextfield.leftView = leftView;
        _securityCodeTextfield.leftViewMode = UITextFieldViewModeAlways;
        _securityCodeTextfield.delegate = self;
        _securityCodeTextfield.keyboardType = UIKeyboardTypeNumberPad;
    }
    return _securityCodeTextfield;
}

- (UIButton *)securityBtn {
    if (!_securityBtn) {
        _securityBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.phoneNumberTextField.frame) + 5, CGRectGetMinY(self.phoneNumberTextField.frame), SCRE_WIDTH - 45 - self.phoneNumberTextField.width, 40)];
        _securityBtn.backgroundColor = [UIColor grayColor];
        [_securityBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_securityBtn setTitle:@"验证" forState:UIControlStateNormal];
        [_securityBtn addTarget:self action:@selector(getSecurityCodeAction:) forControlEvents:UIControlEventTouchDown];
        _securityBtn.layer.cornerRadius = 5;
        _securityBtn.layer.masksToBounds = YES;
        
    }
    return _securityBtn;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
    [self.view addSubview:self.phoneNumberTextField];
    [self.view addSubview:self.securityCodeTextfield];
    [self.view addSubview:self.securityBtn];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initView {
    self.title = @"快递员登陆注册页";
    UIImageView *bgUpImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCRE_WIDTH, SCRE_HEIGHT )];
    bgUpImageView.image = [UIImage imageNamed:@"login_home_bg"];
    [self.view addSubview:bgUpImageView];
    
    
    UIImageView *titleView = [[UIImageView alloc]initWithFrame:CGRectMake(60, 94, 100, 25)];
    titleView.image = [UIImage imageNamed:@"login_home_title"];
    titleView.center = CGPointMake(SCRE_WIDTH/2, 104);
    [self.view addSubview:titleView];
    
    UILabel *subtitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(titleView.frame) + 5, SCRE_WIDTH, 15)];
    subtitleLabel.text = @"一家致力于快递团购的APP";
    subtitleLabel.font = [UIFont systemFontOfSize:12];
    subtitleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:subtitleLabel];
    
    self.loginBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(self.securityCodeTextfield.frame) + 10, SCRE_WIDTH - 40, 35)];
    [_loginBtn setBackgroundColor:[UIColor orangeColor]];
    [_loginBtn setTitle:@"登陆" forState:UIControlStateNormal];
    _loginBtn.layer.cornerRadius = 5;
    _loginBtn.layer.masksToBounds = YES;
    [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_loginBtn addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:_loginBtn];
    
    self.signUpBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, SCRE_HEIGHT - 120, SCRE_WIDTH - 200, 35)];
    [_signUpBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [_signUpBtn setTitle:@"注册" forState:UIControlStateNormal];
    _signUpBtn.layer.cornerRadius = 5;
    _signUpBtn.layer.masksToBounds = YES;
    _signUpBtn.layer.borderColor = [UIColor orangeColor].CGColor;
    _signUpBtn.layer.borderWidth = 2.0f;
    [_signUpBtn addTarget:self action:@selector(signUpAction) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:_signUpBtn];
}


#pragma mark 事件响应getSecurityCodeAction 
- (void)getSecurityCodeAction:(UIButton *)sender {
    
}

- (void)loginAction {
    
}

- (void)signUpAction {
    [self.navigationController pushViewController:[SignUpViewController new] animated:YES];
}
@end
