//
//  AccountEvent_AskRegisterVerifyCode.m
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 07/02/2017.
//  Copyright © 2017 赵海伟. All rights reserved.
//

#import "AccountEvent_AskRegisterVerifyCode.h"

@implementation AccountEvent_AskRegisterVerifyCode

- (instancetype)initWithPhoneNum:(NSString*)phoneNum
{
    self = [super init];
    if (self) {
        _phoneNum = phoneNum;
    }
    return self;
}

@end
