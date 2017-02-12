//
//  HWTIMService.m
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 06/02/2017.
//  Copyright © 2017 赵海伟. All rights reserved.
//

#import "HWTIMService.h"

#import <TLSSDK/TLSLoginHelper.h>
#import <TLSSDK/TLSAccountHelper.h>

#import "AccountEvent_AutoLogIn.h"
#import "AccountEvent_LogOut.h"
#import "AccountEvent_AskRegisterVerifyCode.h"
#import "AccountEvent_AskLogInVerifyCode.h"
#import "AccountEvent_VerifyLogInCode.h"
#import "AccountEvent_VerifyRegisterCode.h"
#import "AccountEvent_LogInSucceed.h"
#import "AccountEvent_AskLogInVerifyCodeResult.h"
#import "AccountEvent_AskRegisterVerifyCodeResult.h"

@interface HWTIMService ()<TIMConnListener, TIMUserStatusListener,TLSSmsLoginListener, TLSSmsRegListener, TLSRefreshTicketListener>
{
    NSString *_phoneNum;
}
@end

@implementation HWTIMService


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self p_setListeners];
    }
    return self;
}

- (void)initService
{
    [super initService];
    @weakify(self)
    [self.disposer addDisposable:[[self getEvent:[AccountEvent_AutoLogIn class]] subscribeNext:^(AccountEvent_AutoLogIn *x) {
        @strongify(self)
        [self p_logInWithAccount:x.account];
    }]];
    [self.disposer addDisposable:[[self getEvent:[AccountEvent_LogOut class]] subscribeNext:^(id x) {
        @strongify(self)
        [self p_logOut];
    }]];
    [self.disposer addDisposable:[[self getEvent:[AccountEvent_AskRegisterVerifyCode class]] subscribeNext:^(AccountEvent_AskRegisterVerifyCode* x) {
        @strongify(self)
        [self p_askRegisterVerifyNum:x.phoneNum];
    }]];
    [self.disposer addDisposable:[[self getEvent:[AccountEvent_VerifyRegisterCode class]] subscribeNext:^(AccountEvent_VerifyRegisterCode *x) {
        @strongify(self)
        [self p_verifyRegisterCodeWithCode:x.code];
    }]];
    [self.disposer addDisposable:[[self getEvent:[AccountEvent_AskLogInVerifyCode class]] subscribeNext:^(AccountEvent_AskLogInVerifyCode *x) {
        @strongify(self)
        [self p_askLogIncode:x.phoneNum];
    }]];
    [self.disposer addDisposable:[[self getEvent:[AccountEvent_VerifyLogInCode class]] subscribeNext:^(AccountEvent_VerifyLogInCode *x) {
        @strongify(self)
        [self p_verifyLogInCodeWith:x.code];
    }]];
}

#pragma mark pravite methods
- (void)p_askRegisterVerifyNum:(NSString*)phone
{
    _phoneNum = [NSString stringWithFormat:@"86-%@",phone];
    [[TLSAccountHelper getInstance] TLSSmsRegAskCode:_phoneNum andTLSSmsRegListener:self]; // 注册请求验证码
}
- (void)p_verifyRegisterCodeWithCode:(NSString*)code
{
    [[TLSAccountHelper getInstance] TLSSmsRegVerifyCode:code andTLSSmsRegListener:self];
}

- (void)p_askLogIncode:(NSString*)phone
{
    _phoneNum = [NSString stringWithFormat:@"86-%@",phone];
    [[TLSLoginHelper getInstance] TLSSmsAskCode:_phoneNum andTLSSmsLoginListener:self];
}
- (void)p_verifyLogInCodeWith:(NSString*)code
{
    [[TLSLoginHelper getInstance] TLSSmsVerifyCode:nil andCode:code andTLSSmsLoginListener:self];
}

/// 自动登录
- (void)p_logInWithAccount:(AccountModel*)account
{
    BOOL ret = [[TLSLoginHelper getInstance] needLogin:account.identifier];
    if (ret) {
        [[TLSLoginHelper getInstance] TLSRefreshTicket:account.identifier andTLSRefreshTicketListener:self];
    }
    
    DebugLog(@"%@", account);
    TIMLoginParam *param = [[TIMLoginParam alloc]init];
    param.identifier = account.identifier;
    param.accountType = account.accountType;
    param.userSig = account.userSig;
    param.sdkAppId = account.sdkAppId;
    param.appidAt3rd = account.appidAt3rd;
    
    [[TIMManager sharedInstance] login:param succ:^{
        DebugLog(@"logIn success");
        [[ServiceContainer shareInstance].eventAggregator publish:[AccountEvent_LogInSucceed new]];
    } fail:^(int code, NSString *msg) {
        DebugLog(@"logIn faied:%@", msg);
    }];
}

- (void)p_logOut
{
    [[TIMManager sharedInstance] logout:^{
        DebugLog(@"logOut succeed");
        ShowSuccessStatus(@"退出登录成功");
        [AccountModel deleteModel];
    } fail:^(int code, NSString *msg) {
        
    }];
}

- (void)p_onLogInSuccess
{
    [[TIMManager sharedInstance] setUserStatusListener:self];
}

- (void)p_setListeners
{
    [[TIMManager sharedInstance] setConnListener:self];
    [[TIMManager sharedInstance] initSdk:SDKAPPID];
    [[TIMManager sharedInstance] setLogFunc:TIM_LOG_NONE];
}

#pragma mark call back methods
/// 网络连接回调
- (void)onConnSucc
{
    
}

- (void)onConnFailed:(int)code err:(NSString *)err
{
    
}

- (void)onDisconnect:(int)code err:(NSString *)err
{
    
}

/// 用户状态回调
- (void)onForceOffline
{
    /// 被踢下线
}

- (void)onUserSigExpired
{
    /// 用户票据过期
    NSString *userAccount = [[TLSLoginHelper getInstance] getLastUserInfo].identifier;
    if (![[TLSLoginHelper getInstance] needLogin:userAccount]) {
        [[TLSLoginHelper getInstance] TLSRefreshTicket:userAccount andTLSRefreshTicketListener:self];
    }
}


/// 手机号登录请求验证码成功
- (void)OnSmsLoginAskCodeSuccess:(int)reaskDuration andExpireDuration:(int)expireDuration
{
    [self publish:[[AccountEvent_AskLogInVerifyCodeResult alloc]initWithResult:YES]];
}

#pragma mark register call back
/// 注册验证码请求成功
- (void)OnSmsRegAskCodeSuccess:(int)reaskDuration andExpireDuration:(int)expireDu
{
    [self publish:[[AccountEvent_AskRegisterVerifyCodeResult alloc]initWithResult:YES]];
}

- (void)OnSmsRegReaskCodeSuccess:(int)reaskDuration andExpireDuration:(int)expireDuration
{
    // 重新请求验证码成功
}

- (void)OnSmsRegVerifyCodeSuccess
{
    // 注册短信验证成功
    [[TLSAccountHelper getInstance] TLSSmsRegCommit:nil];
}

- (void)OnSmsRegCommitSuccess:(TLSUserInfo *)userInfo
{
    // 注册成功
    ShowSuccessStatus(@"注册成功");
    [[AppDelegate sharedDelegate] hw_popViewController];
}

- (void)OnSmsRegFail:(TLSErrInfo *)errInfo
{
    // 注册失败
    [self publish:[[AccountEvent_AskRegisterVerifyCodeResult alloc]initWithResult:NO]];
    ShowErrorStatus(errInfo.sErrorMsg);
}

- (void)OnSmsRegTimeout:(TLSErrInfo *)errInfo
{
    // 注册请求超时
    [UIAlertController showAlertControllerWithTitle:nil message:@"请求超时" titleOne:@"重新发送" titleTwo:@"取消" tagOne:^{
        [[TLSAccountHelper getInstance] TLSSmsRegReaskCode:nil];
    } tagTow:^{
        return ;
    }];
}

#pragma mark login call back
- (void)OnSmsLoginVerifyCodeSuccess
{
    [[TLSLoginHelper getInstance] TLSSmsLogin:_phoneNum andTLSSmsLoginListener:self];
}

- (void)OnSmsLoginFail:(TLSErrInfo *)errInfo
{
    [self publish:[[AccountEvent_AskLogInVerifyCodeResult alloc]initWithResult:NO]];
    ShowErrorStatus(errInfo.sErrorMsg);
}

- (void)OnSmsLoginTimeout:(TLSErrInfo *)errInfo
{
    ShowErrorStatus(errInfo.sErrorMsg);
}

- (void)OnSmsLoginSuccess:(TLSUserInfo *)userInfo
{
    DebugLog(@"\n 登录成功:%@", userInfo.identifier);
    /// 获取用户票据
    NSString *userSig = [[TLSLoginHelper getInstance] getTLSUserSig:userInfo.identifier];
    AccountModel *account = [AccountModel new];
    account.identifier = userInfo.identifier;
    account.userSig = [[TLSLoginHelper getInstance] getTLSUserSig:userInfo.identifier];
    account.accountType = [NSString stringWithFormat:@"%d",ACCOUNT_TYPE];
    account.sdkAppId = SDKAPPID;
    account.appidAt3rd = [NSString stringWithFormat:@"%d", SDKAPPID];
    [account save];
    
    [self p_logInWithAccount:account];
}

- (void)OnSmsLoginReaskCodeSuccess:(int)reaskDuration andExpireDuration:(int)expireDuration
{
    
}

#pragma mark refresh call back
- (void)OnRefreshTicketSuccess:(TLSUserInfo *)userInfo
{
    DebugLog(@"刷新票据成功：%@", userInfo);
    AccountModel *account = [AccountModel new];
    account.identifier = userInfo.identifier;
    account.userSig = [[TLSLoginHelper getInstance] getTLSUserSig:userInfo.identifier];
    account.accountType = [NSString stringWithFormat:@"%d",ACCOUNT_TYPE];
    account.sdkAppId = SDKAPPID;
    account.appidAt3rd = [NSString stringWithFormat:@"%d", SDKAPPID];
    [account save];
}

- (void)OnRefreshTicketFail:(TLSErrInfo *)errInfo
{
    DebugLog(@"刷新票据失败：%@", errInfo.sErrorMsg);
    switch (errInfo.dwErrorCode) {
        case TLS_LOGIN_WRONG_PWD:
            ShowErrorStatus(@"密码错误，请重试");
            break;
        case TLS_LOGIN_NO_ACCOUNT:
            ShowErrorStatus(@"账号不存在");
            break;
        default:
            break;
    }
}

- (void)OnRefreshTicketTimeout:(TLSErrInfo *)errInfo
{
    DebugLog(@"请求超时：%@", errInfo.sErrorMsg);
}


@end
