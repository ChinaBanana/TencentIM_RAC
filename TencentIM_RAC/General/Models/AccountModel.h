//
//  AccountModel.h
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 20/01/2017.
//  Copyright © 2017 赵海伟. All rights reserved.
//

#import "HWBaseModel.h"

@interface AccountModel : HWBaseModel

@property (nonatomic, copy) NSString *accountType;
@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, copy) NSString *userSig;
@property (nonatomic, copy) NSString *appidAt3rd;
@property (nonatomic, assign) int sdkAppId;

@end
