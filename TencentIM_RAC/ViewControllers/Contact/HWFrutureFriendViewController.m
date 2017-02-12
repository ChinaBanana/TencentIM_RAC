//
//  HWFrutureFriendViewController.m
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 09/02/2017.
//  Copyright © 2017 赵海伟. All rights reserved.
//

#import "HWFrutureFriendViewController.h"
#import "HWFrutureFriendViewModel.h"
#import "FriendEvent_GetFrutureFriendResult.h"

@interface HWFrutureFriendViewController ()

@property (nonatomic, strong) HWFrutureFriendViewModel *frutureFriendVM;

@end

@implementation HWFrutureFriendViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        @weakify(self)
        [RACObserve(self.frutureFriendVM, futureFriendList) subscribeNext:^(id x) {
            @strongify(self)
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
        }];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.frutureFriendVM.futureFriendList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    NSObject *obj = self.frutureFriendVM.futureFriendList[indexPath.row];
    DebugLog(@"%@", obj.class);
    return cell;
}

- (HWFrutureFriendViewModel *)frutureFriendVM
{
    if (!_frutureFriendVM) {
        _frutureFriendVM = [HWFrutureFriendViewModel new];
    }
    return _frutureFriendVM;
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
