//
//  HWBaseService.m
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 03/01/2017.
//  Copyright © 2017 赵海伟. All rights reserved.
//

#import "HWBaseService.h"

@implementation HWBaseService

@synthesize eventAggregator;

- (RACSignal *)getEvent:(Class)type
{
    return [self.eventAggregator getEvent:type];
}

- (void)initService
{
    if (self.disposer.isDisposed) {
        self.disposer = [RACCompoundDisposable compoundDisposable];
    }
}

- (void)publish:(id)event
{
    [self.eventAggregator publish:event];
}

- (void)dispose
{
    [self.disposer dispose];
}

- (void)dealloc
{
    [self dispose];
}


#pragma mark setter and getter

- (RACCompoundDisposable *)disposer
{
    if (!_disposer) {
        _disposer = [RACCompoundDisposable compoundDisposable];
    }
    return _disposer;
}

@end
