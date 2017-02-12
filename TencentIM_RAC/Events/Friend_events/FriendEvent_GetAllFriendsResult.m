//
//  FriendEvent_GetAllFriendsResult.m
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 10/02/2017.
//  Copyright © 2017 赵海伟. All rights reserved.
//

#import "FriendEvent_GetAllFriendsResult.h"

@implementation FriendEvent_GetAllFriendsResult

- (instancetype)initWithFirends:(NSArray*)friends
{
    self = [super init];
    if (self) {
        _firendsList = friends;
    }
    return self;
}
@end
