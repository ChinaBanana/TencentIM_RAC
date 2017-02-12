//
//  HWLogInViewModel.h
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 05/01/2017.
//  Copyright © 2017 赵海伟. All rights reserved.
//

#import "HWBaseViewModel.h"

@interface HWLogInViewModel : HWBaseViewModel

@property (nonatomic, strong) RACSubject *askVerifyCodeSub;

- (void)askVerifyCode:(NSString*)phoneNum;
- (void)verifyLogInCode:(NSString*)code;

@end
