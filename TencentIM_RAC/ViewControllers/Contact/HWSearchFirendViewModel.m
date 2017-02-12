//
//  HWSearchFirendViewModel.m
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 09/02/2017.
//  Copyright © 2017 赵海伟. All rights reserved.
//

#import "HWSearchFirendViewModel.h"

@implementation HWSearchFirendViewModel

- (void)searchFriendByPhone:(NSString*)phone
{
    [[TIMFriendshipManager sharedInstance] GetUsersProfile:@[[NSString stringWithFormat:@"86-%@",phone]] succ:^(NSArray *friends) {
        self.friendsArr = [friends copy];
    } fail:^(int code, NSString *msg) {
        DebugLog(@"%@", msg);
        ShowErrorStatus(@"你搜的不是我的人呀");
    }];
}

- (void)addFirend:(TIMUserProfile*)user
{
    TIMAddFriendRequest *request = [TIMAddFriendRequest new];
    request.identifier = user.identifier;
    [[TIMFriendshipManager sharedInstance] AddFriend:@[request] succ:^(NSArray *friends) {
        TIMFriendResult *result = friends[0];
        if (result.status == TIM_FRIEND_STATUS_SUCC) {
            ShowSuccessStatus(@"请求发出去了，给我等着");
        }else{
            
        }
    } fail:^(int code, NSString *msg) {
        DebugLog(@"%@",msg);
        ShowErrorStatus(@"添加失败了，笨啊");
    }];
}

- (RACSubject *)searchFriendSubj
{
    if (!_searchFriendSubj) {
        _searchFriendSubj = [RACSubject subject];
    }
    return _searchFriendSubj;
}

@end
