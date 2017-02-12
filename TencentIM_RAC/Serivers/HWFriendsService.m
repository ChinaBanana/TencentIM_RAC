//
//  HWFriendsService.m
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 09/02/2017.
//  Copyright © 2017 赵海伟. All rights reserved.
//

#import "HWFriendsService.h"
#import "AccountEvent_LogInSucceed.h"
#import "FriendEvent_GetFrutureFriend.h"
#import "FriendEvent_GetFrutureFriendResult.h"
#import "FriendEvent_GetAllFriendsResult.h"

@implementation HWFriendsService

- (void)initService
{
    [super initService];
    @weakify(self)
    [self.disposer addDisposable:[[self getEvent:[FriendEvent_GetFrutureFriend class]] subscribeNext:^(id x) {
        @strongify(self)
        [self p_getFutureFirend];
    }]];
    [self.disposer addDisposable:[[self getEvent:[AccountEvent_LogInSucceed class]] subscribeNext:^(id x) {
        @strongify(self)
        [self p_getAllFriends];
    }]];
}

- (void)p_getFutureFirend
{
    TIMFriendFutureMeta *meta = [[TIMFriendFutureMeta alloc]init];
    meta.reqNum = 30;
    meta.timestamp = 0;
    [[TIMFriendshipManager sharedInstance] GetFutureFriends:TIM_PROFILE_FLAG_NICK | TIM_PROFILE_FLAG_FACE_URL | TIM_PROFILE_FLAG_REMARK | TIM_PROFILE_FLAG_SELFSIGNATURE | TIM_PROFILE_FLAG_LOCATION futureFlag:TIM_FUTURE_FRIEND_PENDENCY_IN_TYPE custom:nil meta:meta succ:^(TIMFriendFutureMeta *meta, NSArray *items) {
        [self publish:[[FriendEvent_GetFrutureFriendResult alloc]initWithSucceed:YES andItems:items]];
    } fail:^(int code, NSString *msg) {
        DebugLog(@"%@",msg);
    }];
}

- (void)p_getAllFriends
{
    [[TIMFriendshipManager sharedInstance] GetFriendList:^(NSArray *friends) {
        [self publish:[[FriendEvent_GetAllFriendsResult alloc]initWithFirends:friends]];
    } fail:^(int code, NSString *msg) {
        
    }];
}

@end
