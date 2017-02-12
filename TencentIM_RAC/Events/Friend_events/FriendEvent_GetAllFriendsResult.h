//
//  FriendEvent_GetAllFriendsResult.h
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 10/02/2017.
//  Copyright © 2017 赵海伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FriendEvent_GetAllFriendsResult : NSObject

@property (nonatomic, strong, readonly) NSArray *firendsList;

- (instancetype)initWithFirends:(NSArray*)friends;

@end
