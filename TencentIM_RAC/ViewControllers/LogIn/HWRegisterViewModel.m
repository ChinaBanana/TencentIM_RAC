//
//  HWRegisterViewModel.m
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 07/02/2017.
//  Copyright © 2017 赵海伟. All rights reserved.
//

#import "HWRegisterViewModel.h"
#import "AccountEvent_AskRegisterVerifyCode.h"
#import "AccountEvent_VerifyRegisterCode.h"
#import "AccountEvent_AskRegisterVerifyCodeResult.h"

@implementation HWRegisterViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        @weakify(self)
        [[self getEvent:[AccountEvent_AskRegisterVerifyCodeResult class]] subscribeNext:^(AccountEvent_AskRegisterVerifyCodeResult *x) {
            @strongify(self)
            [self.askVerifyCodeResultSub sendNext:@(x.isSucceed)];
        }];
    }
    return self;
}

- (void)askRegisterCode:(NSString*)phone
{
    [self publishEvent:[[AccountEvent_AskRegisterVerifyCode alloc]initWithPhoneNum:phone]];
}

- (void)verifyRegisterCode:(NSString*)code
{
    [self publishEvent:[[AccountEvent_VerifyRegisterCode alloc]initWithCode:code]];
}

- (RACSubject *)askVerifyCodeResultSub
{
    if (!_askVerifyCodeResultSub) {
        _askVerifyCodeResultSub = [RACSubject subject];
    }
    return _askVerifyCodeResultSub;
}

@end
