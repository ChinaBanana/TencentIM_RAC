//
//  EventAggregator.h
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 16/12/2016.
//  Copyright © 2016 赵海伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EventAggregator : NSObject

@property (nonatomic, strong) RACSignal         *strame;

@property (nonatomic, strong) RACSubject        *subject;

- (RACSignal*)getEvent:(Class)event_class;

- (void)publish:(id)event;

@end
