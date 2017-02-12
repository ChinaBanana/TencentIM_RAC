//
//  AccountEvent_VerifyLogInCode.m
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 07/02/2017.
//  Copyright © 2017 赵海伟. All rights reserved.
//

#import "AccountEvent_VerifyLogInCode.h"

@implementation AccountEvent_VerifyLogInCode

- (instancetype)initWithCode:(NSString*)code
{
    self = [super init];
    if (self) {
        _code = code;
    }
    return self;
}

@end
