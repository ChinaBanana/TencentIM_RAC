//
//  AppDelegate.m
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 06/12/2016.
//  Copyright © 2016 赵海伟. All rights reserved.
//

#import "AppDelegate.h"
#import "HWLogInViewController.h"
#import "AccountModel.h"
#import "AccountEvent_AutoLogIn.h"
#import "AccountEvent_LogOut.h"
#import "AccountEvent_LogInSucceed.h"

#import <TLSSDK/TLSAccountHelper.h>
#import <TLSSDK/TLSLoginHelper.h>
#import <QALSDK/QalSDKProxy.h>

@interface AppDelegate ()

@property (strong, nonatomic) HWMainTabBarController    *main_tabBarCon;
@property (strong, nonatomic) HWLogInViewController     *logInCon;

@end

@implementation AppDelegate

#pragma mark public methods

+ (instancetype)sharedDelegate
{
    return (AppDelegate*)[UIApplication sharedApplication].delegate;
}

- (void)hw_pushViewController:(UIViewController*)viewCon
{
    UIViewController *rootCon = self.window.rootViewController;
    if ([rootCon isKindOfClass:[HWMainTabBarController class]]) {
        HWMainTabBarController *tabBarCon = (HWMainTabBarController*)rootCon;
        UINavigationController *selectedCon = tabBarCon.selectedViewController;
        viewCon.hidesBottomBarWhenPushed = YES;
        [selectedCon pushViewController:viewCon animated:YES];
    }else if([rootCon isKindOfClass:[UINavigationController class]]){
        UINavigationController *naviCon = (UINavigationController*)rootCon;
        [naviCon pushViewController:viewCon animated:YES];
    }
}

- (void)hw_popViewController
{
    UIViewController *rootCon = self.window.rootViewController;
    if ([rootCon isKindOfClass:[HWMainTabBarController class]]) {
        HWMainTabBarController *tabBarCon = (HWMainTabBarController*)rootCon;
        UINavigationController *selectedCon = tabBarCon.selectedViewController;
        [selectedCon popViewControllerAnimated:YES];
    }else if([rootCon isKindOfClass:[UINavigationController class]]){
        UINavigationController *naviCon = (UINavigationController*)rootCon;
        [naviCon popViewControllerAnimated:YES];
    }
}

- (void)goMian
{
    self.window.rootViewController = self.main_tabBarCon;
    self.logInCon = nil;
    [self.window makeKeyAndVisible];
}

- (void)goLogIn
{
    self.window.rootViewController = [[UINavigationController alloc]initWithRootViewController:self.logInCon];
    self.main_tabBarCon = nil;
    [self.window makeKeyAndVisible];
}

#pragma mark AppDelegate methods

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self configAPP];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark pravite methods

- (void)configAPP
{
    [ServiceContainer shareInstance];
    
    [[UINavigationBar appearance] setTranslucent:NO];
    
    [[TIMManager sharedInstance] disableCrashReport];
    [[TIMManager sharedInstance] initLogSettings:NO logPath:nil];
    
    [[QalSDKProxy sharedInstance] initWithAppid:SDKAPPID andSDKAppid:SDKAPPID andAccType:ACCOUNT_TYPE];
    [[TLSLoginHelper getInstance] init:SDKAPPID andAccountType:ACCOUNT_TYPE andAppVer:@"1.0"];
    [[TLSAccountHelper getInstance] init:SDKAPPID andAccountType:ACCOUNT_TYPE andAppVer:@"1.0"];
    
    @weakify(self)
    [[[ServiceContainer shareInstance].eventAggregator getEvent:[AccountEvent_LogInSucceed class]] subscribeNext:^(id x) {
        @strongify(self)
        [self goMian];
    }];
    [[[ServiceContainer shareInstance].eventAggregator getEvent:[AccountEvent_LogOut class]] subscribeNext:^(id x) {
        @strongify(self)
        [self goLogIn];
    }];
    
    AccountModel *account = [AccountModel getFromLocal];
    if (account.identifier) {
        [[ServiceContainer shareInstance].eventAggregator publish:[AccountEvent_AutoLogIn new]];
        [self goMian];
    }else{
        [self goLogIn];
    }
}



#pragma mark setter and getter

- (HWMainTabBarController *)main_tabBarCon
{
    if (_main_tabBarCon) {
        _main_tabBarCon = nil;
    }
    return [HWMainTabBarController new];
}

- (HWLogInViewController *)logInCon
{
    if (!_logInCon) {
        _logInCon = [HWLogInViewController new];
    }
    return _logInCon;
}


@end
