//
//  HWMainTabBarController.m
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 06/12/2016.
//  Copyright © 2016 赵海伟. All rights reserved.
//

#import "HWMainTabBarController.h"
#import "HWContactViewController.h"
#import "HWConversationViewController.h"
#import "HWMineViewController.h"

@interface HWMainTabBarController ()

@end

@implementation HWMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self customViewControllers];
}

- (void)customViewControllers
{
    UINavigationController *conversationNavi = [[UINavigationController alloc]initWithRootViewController:[HWConversationViewController new]];
    UINavigationController *contactNavi = [[UINavigationController alloc]initWithRootViewController:[HWContactViewController new]];
    UINavigationController *mineNavi = [[UINavigationController alloc]initWithRootViewController:[HWMineViewController new]];
    
    conversationNavi.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"聊天" image:[[UIImage imageNamed:@"tabBar_conversation"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tabBar_converastion_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    contactNavi.tabBarItem =  [[UITabBarItem alloc]initWithTitle:@"通讯录" image:[[UIImage imageNamed:@"tabBar_contact"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tabBar_contact_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    mineNavi.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"设置" image:[[UIImage imageNamed:@"tabBar_mine"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tabBar_mine_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    self.viewControllers = @[conversationNavi, contactNavi, mineNavi];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    // EASY PM
}
*/

@end
