//
//  AccountEvent_AskLogInVerifyCodeResult.h
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 08/02/2017.
//  Copyright © 2017 赵海伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AccountEvent_AskLogInVerifyCodeResult : NSObject

@property (nonatomic, assign) BOOL isSucceed;

- (instancetype)initWithResult:(BOOL)isSucceed;

@end
