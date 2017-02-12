//
//  HWLogInViewController.m
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 05/01/2017.
//  Copyright © 2017 赵海伟. All rights reserved.
//

#import "HWLogInViewController.h"
#import "HWLogInViewModel.h"
#import "AccountModel.h"
#import "HWRegisterViewController.h"

@interface HWLogInViewController ()
{
    UITextField     *_accountTF;
    UITextField     *_passwordTF;
    UIButton        *_logInBtn;
    UIButton        *_sendTestNumBtn;
    UIButton        *_registerBtn;
}

@property (nonatomic, strong) HWLogInViewModel      *logVM;

@end

@implementation HWLogInViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        @weakify(self)
        [self.logVM.askVerifyCodeSub subscribeNext:^(NSNumber *x) {
            @strongify(self)
            if ([x boolValue]) {
                [self p_timeCount];
            }else{
                _sendTestNumBtn.enabled = YES;
            }
        }];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)p_timeCount
{
    _sendTestNumBtn.backgroundColor = lightGray_color;
    [NSTimer scheduledTimerWithTimeInterval:1.0f repeats:YES block:^(NSTimer * _Nonnull timer) {
        static NSInteger time = 10;
        time --;
        [_sendTestNumBtn setTitle:[NSString stringWithFormat:@"%lds resend", time] forState:UIControlStateNormal];
        if (time == 0) {
            _sendTestNumBtn.backgroundColor = orange_color;
            _sendTestNumBtn.enabled = YES;
            [_sendTestNumBtn setTitle:@"resend" forState:UIControlStateNormal];
            [timer invalidate];
            timer = nil;
            time = 10;
        }
    }];
}

- (void)configSubViews
{
    _accountTF = [UITextField hw_textField];
    _accountTF.keyboardType = UIKeyboardTypeNumberPad;
    _accountTF.placeholder = @"Account";
    
    _passwordTF = [UITextField hw_textField];
    _passwordTF.keyboardType = UIKeyboardTypeNumberPad;
    _passwordTF.placeholder = @"Verify Code";
    
    _sendTestNumBtn = [UIButton hw_normalBtnWithClicked:^(UIButton *button) {
        _sendTestNumBtn.enabled = NO;
        [self.logVM askVerifyCode:_accountTF.text];
    }];
    [_sendTestNumBtn setLayerCornerRadius:5];
    [_sendTestNumBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
    [_sendTestNumBtn setTitleColor:black_color forState:UIControlStateNormal];
    
    _logInBtn = [UIButton hw_normalBtnWithClicked:^(UIButton *button) {
        [self.logVM verifyLogInCode:_passwordTF.text];
    }];
    [_logInBtn setTitle:@"登录" forState:UIControlStateNormal];
    [_logInBtn setBackgroundColor:orange_color];
    [_logInBtn setTitleColor:white_color forState:UIControlStateNormal];
    [_logInBtn setLayerCornerRadius:5];
    
    [_accountTF.rac_textSignal subscribeNext:^(NSString *x) {
        if (x.length == 11) {
            _sendTestNumBtn.enabled = YES;
            _sendTestNumBtn.backgroundColor = orange_color;
        }else{
            _sendTestNumBtn.enabled = NO;
            _sendTestNumBtn.backgroundColor = lightGray_color;
        }
    }];
    [_passwordTF.rac_textSignal subscribeNext:^(NSString *x) {
        if (x.length == 4) {
            _logInBtn.enabled = YES;
            _logInBtn.backgroundColor = orange_color;
        }else{
            _logInBtn.enabled = NO;
            _logInBtn.backgroundColor = lightGray_color;
        }
    }];
    
    _registerBtn = [UIButton hw_normalBtnWithClicked:^(UIButton *headBtn) {
        [[AppDelegate sharedDelegate] hw_pushViewController:[HWRegisterViewController new]];
    }];
    [_registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    [_registerBtn setTitleColor:black_color forState:UIControlStateNormal];
    
    [self.view addSubview:_accountTF];
    [self.view addSubview:_passwordTF];
    [self.view addSubview:_logInBtn];
    [self.view addSubview:_sendTestNumBtn];
    [self.view addSubview:_registerBtn];
    [self.view setNeedsUpdateConstraints];
}

- (void)updateViewConstraints
{
    [_accountTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(DEFAULT_MARGIN));
        make.top.equalTo(@150);
        make.right.equalTo(@(-DEFAULT_MARGIN));
        make.height.equalTo(@(DEFAULT_VIEW_HEIGHT));
    }];
    [_passwordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(_accountTF);
        make.top.equalTo(_accountTF.mas_bottom).offset(DEFAULT_TOP_MARGIN);
        make.left.equalTo(_accountTF);
    }];
    [_sendTestNumBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@120);
        make.top.equalTo(_accountTF.mas_top).offset(5);
        make.right.equalTo(_accountTF.mas_right).offset(-5);
        make.bottom.equalTo(_accountTF.mas_bottom).offset(-5);
    }];
    [_logInBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@50);
        make.top.equalTo(_passwordTF.mas_bottom).offset(80);
        make.height.equalTo(_passwordTF);
        make.right.equalTo(@(-50));
    }];
    [_registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_passwordTF.mas_bottom).offset(10);
        make.width.equalTo(_sendTestNumBtn);
        make.right.equalTo(_passwordTF);
        make.height.equalTo(@30);
    }];
    
    [super updateViewConstraints];
}

- (HWLogInViewModel *)logVM
{
    if (!_logVM) {
        _logVM = [HWLogInViewModel new];
    }
    return _logVM;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
