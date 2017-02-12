//
//  HWBaseViewModel.m
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 03/01/2017.
//  Copyright © 2017 赵海伟. All rights reserved.
//

#import "HWBaseViewModel.h"

@implementation HWBaseViewModel

- (RACSignal*)getEvent:(id)event
{
    return [[ServiceContainer shareInstance].eventAggregator getEvent:event];
}

- (void)publishEvent:(id)event
{
    [[ServiceContainer shareInstance].eventAggregator publish:event];
}

@end
