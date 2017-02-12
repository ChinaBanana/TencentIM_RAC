//
//  HWBaseService.h
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 03/01/2017.
//  Copyright © 2017 赵海伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HWBaseService : NSObject<IHWService>

@property (nonatomic, strong) RACCompoundDisposable     *disposer;

- (RACSignal *)getEvent:(Class)type;

- (void)publish:(id)event;

- (void)initService;

- (void)dispose;

@end
