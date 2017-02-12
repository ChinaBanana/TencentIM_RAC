//
//  AppDelegate.h
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 06/12/2016.
//  Copyright © 2016 赵海伟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HWMainTabBarController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow                  *window;

+ (instancetype)sharedDelegate;

- (void)hw_pushViewController:(UIViewController*)viewCon;
- (void)hw_popViewController;

@end

