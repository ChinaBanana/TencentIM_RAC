//
//  AccountEvent_AskRegisterVerifyCodeResult.m
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 08/02/2017.
//  Copyright © 2017 赵海伟. All rights reserved.
//

#import "AccountEvent_AskRegisterVerifyCodeResult.h"

@implementation AccountEvent_AskRegisterVerifyCodeResult

- (instancetype)initWithResult:(BOOL)isSucceed
{
    self = [super init];
    if (self) {
        _isSucceed = isSucceed;
    }
    return self;
}

@end
