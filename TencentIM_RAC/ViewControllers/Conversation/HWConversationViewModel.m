//
//  HWConversationViewModel.m
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 03/01/2017.
//  Copyright © 2017 赵海伟. All rights reserved.
//

#import "HWConversationViewModel.h"
#import "AccountEvent_LogInSucceed.h"

@implementation HWConversationViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        @weakify(self)
        [[self getEvent:[AccountEvent_LogInSucceed class]] subscribeNext:^(id x) {
            @strongify(self)
            [self p_getConversationList];
        }];
        
    }
    return self;
}

- (void)p_getConversationList
{
    NSArray *conversations = [[TIMManager sharedInstance] getConversationList];
    
}

@end
