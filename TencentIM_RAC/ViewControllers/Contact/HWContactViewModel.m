//
//  HWContactViewModel.m
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 03/01/2017.
//  Copyright © 2017 赵海伟. All rights reserved.
//

#import "HWContactViewModel.h"
#import "FriendEvent_GetAllFriendsResult.h"
#import "HWContactsModel.h"

@implementation HWContactViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        @weakify(self)
        [[self getEvent:[FriendEvent_GetAllFriendsResult class]] subscribeNext:^(FriendEvent_GetAllFriendsResult *x) {
            @strongify(self)
            self.contactsList = x.firendsList;
        }];
    }
    return self;
}



#pragma mark Getter and Setter

- (NSArray *)systemList
{
    if (!_systemList) {
        HWContactsModel *newFriend = [[HWContactsModel alloc]initWithHeadImage:@"new_friend" andNickName:@"新朋友"];
        HWContactsModel *group = [[HWContactsModel alloc]initWithHeadImage:@"group_chat" andNickName:@"群组"];
        _systemList = @[newFriend, group];
    }
    return _systemList;
}


@end
