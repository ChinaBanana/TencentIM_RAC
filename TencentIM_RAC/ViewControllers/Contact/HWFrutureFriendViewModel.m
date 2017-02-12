//
//  HWFrutureFriendViewModel.m
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 09/02/2017.
//  Copyright © 2017 赵海伟. All rights reserved.
//

#import "HWFrutureFriendViewModel.h"
#import "FriendEvent_GetFrutureFriendResult.h"

@implementation HWFrutureFriendViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        @weakify(self)
        [[self getEvent:[FriendEvent_GetFrutureFriendResult class]]subscribeNext:^(FriendEvent_GetFrutureFriendResult *x) {
            @strongify(self)
            if (x.isSucceed) {
                self.futureFriendList = x.items;
            }
        }];
    }
    return self;
}

@end
