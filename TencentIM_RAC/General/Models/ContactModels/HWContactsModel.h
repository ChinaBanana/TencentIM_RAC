//
//  HWContactsModel.h
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 09/02/2017.
//  Copyright © 2017 赵海伟. All rights reserved.
//

#import "HWBaseModel.h"

@interface HWContactsModel : HWBaseModel

@property (nonatomic, copy, readonly) NSString *headImage;
@property (nonatomic, copy, readonly) NSString *nickName;

- (instancetype)initWithHeadImage:(NSString*)imageName andNickName:(NSString*)nickName;

@end
