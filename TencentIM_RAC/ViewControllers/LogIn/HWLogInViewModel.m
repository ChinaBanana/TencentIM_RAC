//
//  HWLogInViewModel.m
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 05/01/2017.
//  Copyright © 2017 赵海伟. All rights reserved.
//

#import "HWLogInViewModel.h"
#import "AccountEvent_AskLogInVerifyCode.h"
#import "AccountEvent_VerifyLogInCode.h"
#import "AccountEvent_AskLogInVerifyCodeResult.h"

@implementation HWLogInViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        @weakify(self)
        [[self getEvent:[AccountEvent_AskLogInVerifyCodeResult class]] subscribeNext:^(AccountEvent_AskLogInVerifyCodeResult *x) {
            @strongify(self)
            [self.askVerifyCodeSub sendNext:@(x.isSucceed)];
        }];
    }
    return self;
}

- (void)askVerifyCode:(NSString*)phoneNum
{
    [self publishEvent:[[AccountEvent_AskLogInVerifyCode alloc]initWithPhoneNum:phoneNum]];
}

- (void)verifyLogInCode:(NSString*)code
{
    [self publishEvent:[[AccountEvent_VerifyLogInCode alloc]initWithCode:code]];
}

- (RACSubject *)askVerifyCodeSub
{
    if (!_askVerifyCodeSub) {
        _askVerifyCodeSub = [RACSubject subject];
    }
    return _askVerifyCodeSub;
}

@end
