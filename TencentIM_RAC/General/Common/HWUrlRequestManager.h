//
//  HWUrlRequestManager.h
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 07/02/2017.
//  Copyright © 2017 赵海伟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

typedef void (^RequestSucceed)(id responseObj);
typedef enum {
    HWRequestTypePost,
    HWRequestTypeGet
}HWRequestType;

@interface HWUrlRequestManager : NSObject

+ (void)requestUrl:(NSString*)urlStr type:(HWRequestType)type withParames:(NSDictionary*)parames succeed:(RequestSucceed)succeed;

@end
