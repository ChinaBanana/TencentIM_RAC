//
//  IHWService.h
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 03/01/2017.
//  Copyright © 2017 赵海伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EventAggregator;
@class RACSignal;

@protocol IHWService <NSObject>

@required
@property(nonatomic,strong)EventAggregator *eventAggregator;

- (RACSignal *)getEvent:(Class)type;

- (void)publish:(id)event;

- (void)initService;

- (void)dispose;

@end
