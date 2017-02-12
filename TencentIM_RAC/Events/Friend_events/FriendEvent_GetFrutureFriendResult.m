//
//  FriendEvent_GetFrutureFriendResult.m
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 09/02/2017.
//  Copyright © 2017 赵海伟. All rights reserved.
//

#import "FriendEvent_GetFrutureFriendResult.h"

@implementation FriendEvent_GetFrutureFriendResult

- (instancetype)initWithSucceed:(BOOL)isSucceed andItems:(NSArray*)items
{
    self = [super init];
    if (self) {
        _items = items;
        _isSucceed = isSucceed;
    }
    return self;
}

@end
