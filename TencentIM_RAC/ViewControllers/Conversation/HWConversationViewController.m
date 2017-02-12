//
//  HWConversationViewController.m
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 06/12/2016.
//  Copyright © 2016 赵海伟. All rights reserved.
//

#import "HWConversationViewController.h"

@interface HWConversationViewController ()

@end

@implementation HWConversationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //[SVProgressHUD showInfoWithStatus:@"come on"];
    //[SVProgressHUD show];
    //[SVProgressHUD showProgress:5];
    //[SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeClear];
    //[SVProgressHUD showWithStatus:@"Hello world"];
}

- (void)configSubViews
{
    self.navigationItem.title = @"来聊聊人生";
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
}
*/

@end
