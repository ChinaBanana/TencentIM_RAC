//
//  AccountEvent_VerifyRegisterCode.m
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 07/02/2017.
//  Copyright © 2017 赵海伟. All rights reserved.
//

#import "AccountEvent_VerifyRegisterCode.h"

@implementation AccountEvent_VerifyRegisterCode

- (instancetype)initWithCode:(NSString*)code
{
    self = [super init];
    if (self) {
        _code = code;
    }
    return self;
}

@end
