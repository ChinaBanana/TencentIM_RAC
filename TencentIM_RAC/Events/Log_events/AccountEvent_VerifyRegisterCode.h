//
//  AccountEvent_VerifyRegisterCode.h
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 07/02/2017.
//  Copyright © 2017 赵海伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AccountEvent_VerifyRegisterCode : NSObject

@property (nonatomic, copy, readonly) NSString *code;

- (instancetype)initWithCode:(NSString*)code;

@end
