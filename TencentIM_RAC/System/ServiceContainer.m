//
//  ServiceContainer.m
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 16/12/2016.
//  Copyright © 2016 赵海伟. All rights reserved.
//

#import "ServiceContainer.h"
#import "HWTIMService.h"
#import "HWIMMessageService.h"
#import "HWFriendsService.h"

static ServiceContainer *serviceContainer = nil;

@implementation ServiceContainer

+ (instancetype)shareInstance
{
    @synchronized (self) {
        if (serviceContainer == nil) {
            serviceContainer = [[ServiceContainer alloc]init];
        }
    }
    return serviceContainer;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self registerServices];
        [self initializeSevices];
    }
    return self;
}

- (void)registerServices
{
    [self.services addObject:[HWTIMService new]];
    [self.services addObject:[HWIMMessageService new]];
    [self.services addObject:[HWFriendsService new]];
}

- (void)initializeSevices
{
    for (HWBaseService *service in self.services) {
        service.eventAggregator = self.eventAggregator;
        [service initService];
    }
}

#pragma mark setter and getter

- (EventAggregator *)eventAggregator
{
    if (!_eventAggregator) {
        _eventAggregator = [EventAggregator new];
    }
    return _eventAggregator;
}
- (NSMutableArray *)services
{
    if (!_services) {
        _services = [NSMutableArray array];
    }
    return _services;
}



@end
