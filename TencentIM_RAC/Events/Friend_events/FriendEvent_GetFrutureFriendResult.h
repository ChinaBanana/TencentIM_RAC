//
//  FriendEvent_GetFrutureFriendResult.h
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 09/02/2017.
//  Copyright © 2017 赵海伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FriendEvent_GetFrutureFriendResult : NSObject

@property (nonatomic, strong, readonly) NSArray *items;
@property (nonatomic, assign, readonly) BOOL    isSucceed;

- (instancetype)initWithSucceed:(BOOL)isSucceed andItems:(NSArray*)items;

@end
