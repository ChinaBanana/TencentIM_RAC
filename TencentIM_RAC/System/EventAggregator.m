//
//  EventAggregator.m
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 16/12/2016.
//  Copyright © 2016 赵海伟. All rights reserved.
//

#import "EventAggregator.h"

@implementation EventAggregator

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.subject = [RACSubject subject];
        
        /// to do list:  check
        RACMulticastConnection *connection = [self.subject publish];
        self.strame = connection.signal;
        [connection connect];
    }
    return self;
}

- (RACSignal*)getEvent:(Class)event_class
{
    return [self.strame filter:^BOOL(id value) {
        return [value isMemberOfClass:event_class];
    }];
}

- (void)publish:(id)event
{
    [self.subject sendNext:event];
}



@end
