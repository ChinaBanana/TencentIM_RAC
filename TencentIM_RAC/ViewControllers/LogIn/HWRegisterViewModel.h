//
//  HWRegisterViewModel.h
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 07/02/2017.
//  Copyright © 2017 赵海伟. All rights reserved.
//

#import "HWBaseViewModel.h"

@interface HWRegisterViewModel : HWBaseViewModel

@property (nonatomic, strong) RACSubject *askVerifyCodeResultSub;

- (void)askRegisterCode:(NSString*)phone;
- (void)verifyRegisterCode:(NSString*)code;

@end
