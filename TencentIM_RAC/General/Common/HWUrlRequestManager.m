//
//  HWUrlRequestManager.m
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 07/02/2017.
//  Copyright © 2017 赵海伟. All rights reserved.
//

#import "HWUrlRequestManager.h"

@implementation HWUrlRequestManager

+ (void)requestUrl:(NSString*)urlStr type:(HWRequestType)type withParames:(NSDictionary*)parames succeed:(RequestSucceed)succeed
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    switch (type) {
        case HWRequestTypeGet:{
            [manager GET:urlStr parameters:parames progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                succeed(responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                DebugLog(@"%@", error.description);
            }];
        }break;
        case HWRequestTypePost:{
            [manager POST:urlStr parameters:parames progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                succeed(responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                DebugLog(@"%@", error.description);
            }];
        }break;
    }
}

@end
