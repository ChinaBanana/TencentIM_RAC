//
//  UIAlertController+CustomAlertCon.h
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 07/02/2017.
//  Copyright © 2017 赵海伟. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^EVENT_ONE)();
typedef void (^EVENT_TWO)();

@interface UIAlertController (CustomAlertCon)

+ (void)showAlertControllerWithTitle:(NSString *)title message:(NSString *)message titleOne:(NSString*)title1 titleTwo:(NSString*)title2 tagOne:(EVENT_ONE)eventOne tagTow:(EVENT_TWO)eventTwo;

@end
