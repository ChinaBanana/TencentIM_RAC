//
//  ServiceContainer.h
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 16/12/2016.
//  Copyright © 2016 赵海伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServiceContainer : NSObject

@property (nonatomic, strong) EventAggregator           *eventAggregator;

@property (nonatomic, strong) NSMutableArray            *services;

+ (instancetype)shareInstance;

@end
