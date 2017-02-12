//
//  HWIMMessageService.m
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 08/02/2017.
//  Copyright © 2017 赵海伟. All rights reserved.
//

#import "HWIMMessageService.h"
#import "AccountEvent_LogInSucceed.h"
#import "FriendEvent_GetFrutureFriend.h"

@interface HWIMMessageService ()<TIMRefreshListener,TIMMessageListener>

@end

@implementation HWIMMessageService

- (void)initService
{
    [super initService];
    
    [[TIMManager sharedInstance] setRefreshListener:self];
    [[TIMManager sharedInstance] setMessageListener:self];
    
    [self.disposer addDisposable:[[self getEvent:[AccountEvent_LogInSucceed class]] subscribeNext:^(id x) {
        
    }]];
}


#pragma mark refresh listener call back
- (void)onRefreshConversations:(NSArray *)conversations
{
    
}

#pragma mark message listener call back
- (void)onNewMessage:(NSArray *)msgs
{
    for (TIMMessage *message in msgs) {
        for (int i = 0; i < [msgs count]; i++) {
            TIMElem *elem = [message getElem:i];
            
            /* 系统消息  */
            if ([elem isKindOfClass:[TIMSNSSystemElem class]]) {
                TIMSNSSystemElem *systemElem = (TIMSNSSystemElem*)elem;
                switch (systemElem.type) {
                        case TIM_SNS_SYSTEM_ADD_FRIEND: // 添加好友
                        
                        break;
                        case TIM_SNS_SYSTEM_DEL_FRIEND: // 删除好友
                        
                        break;
                        case TIM_SNS_SYSTEM_ADD_FRIEND_REQ: // 添加好友请求
                        [self publish:[FriendEvent_GetFrutureFriend new]];
                        break;
                        
                    default:
                        break;
                }
            }
        }
    }
}

@end
