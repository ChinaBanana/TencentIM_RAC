//
//  UIAlertController+CustomAlertCon.m
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 07/02/2017.
//  Copyright © 2017 赵海伟. All rights reserved.
//

#import "UIAlertController+CustomAlertCon.h"

@implementation UIAlertController (CustomAlertCon)

+ (void)showAlertControllerWithTitle:(NSString *)title message:(NSString *)message titleOne:(NSString*)title1 titleTwo:(NSString*)title2 tagOne:(EVENT_ONE)eventOne tagTow:(EVENT_TWO)eventTwo
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:title1 style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        eventOne();
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:title2 style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        eventTwo();
    }]];
    [[[UIApplication sharedApplication].delegate window].rootViewController presentViewController:alert animated:YES completion:^{
        return ;
    }];
}

@end
