//
//  AccountEvent_AutoLogIn.m
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 06/02/2017.
//  Copyright © 2017 赵海伟. All rights reserved.
//

#import "AccountEvent_AutoLogIn.h"

@implementation AccountEvent_AutoLogIn

- (instancetype)init
{
    self = [super init];
    if (self) {
        _account = [AccountModel getFromLocal];
    }
    return self;
}

@end
