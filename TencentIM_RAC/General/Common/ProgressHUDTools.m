//
//  ProgressHUDTools.m
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 04/01/2017.
//  Copyright © 2017 赵海伟. All rights reserved.
//

#import "ProgressHUDTools.h"

@implementation ProgressHUDTools

+ (void)load
{
    [SVProgressHUD setBackgroundColor:RGBACOLOR(0, 0, 0, 0.8)];
    [SVProgressHUD setForegroundColor:white_color];
    [SVProgressHUD setInfoImage:nil];
}

void ShowMaskStatus(NSString *statues)
{
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [SVProgressHUD showWithStatus:statues maskType:SVProgressHUDMaskTypeGradient];
        });
    }else{
        [SVProgressHUD showWithStatus:statues maskType:SVProgressHUDMaskTypeGradient];
    }
}

void ShowMessage(NSString *status)
{
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [SVProgressHUD showInfoWithStatus:status];
        });
    }else{
        [SVProgressHUD showInfoWithStatus:status];
    }
}

void ShowProgress(CGFloat progress)
{
    if (![NSThread isMainThread])
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            [SVProgressHUD showProgress:progress maskType:SVProgressHUDMaskTypeGradient];
        });
    }
    else
    {
        [SVProgressHUD showProgress:progress maskType:SVProgressHUDMaskTypeGradient];
    }
}

void ShowSuccessStatus(NSString *statues)
{
    if (![NSThread isMainThread])
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            [SVProgressHUD showSuccessWithStatus:statues];
        });
    }
    else
    {
        [SVProgressHUD showSuccessWithStatus:statues];
    }
}

void ShowErrorStatus(NSString *statues)
{
    if (![NSThread isMainThread])
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            [SVProgressHUD showErrorWithStatus:statues];
            [SVProgressHUD showProgress:0.5 status:@"上传" maskType:SVProgressHUDMaskTypeGradient];
        });
    }
    else
    {
        [SVProgressHUD showErrorWithStatus:statues];
    }
}

void DismissHud(void)
{
    if (![NSThread isMainThread])
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
    }
    else
    {
        [SVProgressHUD dismiss];
    }
}


@end
