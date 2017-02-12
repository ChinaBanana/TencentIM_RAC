//
//  AccountEvent_AskRegisterVerifyCode.h
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 07/02/2017.
//  Copyright © 2017 赵海伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AccountEvent_AskRegisterVerifyCode : NSObject

@property (nonatomic, copy, readonly) NSString *phoneNum;

- (instancetype)initWithPhoneNum:(NSString*)phoneNum;

@end
