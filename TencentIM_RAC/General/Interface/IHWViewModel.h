
//
//  IHWViewModel.h
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 05/01/2017.
//  Copyright © 2017 赵海伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RACCompoundDisposable;

@protocol IHWViewModel <NSObject>

@required
- (RACSignal*)getEvent:(id)event;
- (void)publishEvent:(id)event;

@optional

@end

