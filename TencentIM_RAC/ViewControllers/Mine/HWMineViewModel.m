//
//  HWMineViewModel.m
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 03/01/2017.
//  Copyright © 2017 赵海伟. All rights reserved.
//

#import "HWMineViewModel.h"
#import "AccountEvent_LogOut.h"

@implementation HWMineViewModel

- (void)logOut
{
    [self publishEvent:[AccountEvent_LogOut new]];
}

@end
