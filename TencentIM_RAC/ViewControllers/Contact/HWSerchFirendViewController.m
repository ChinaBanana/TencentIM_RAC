//
//  HWSerchFirendViewController.m
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 08/02/2017.
//  Copyright © 2017 赵海伟. All rights reserved.
//

#import "HWSerchFirendViewController.h"
#import "HWSearchFirendViewModel.h"

@interface HWSerchFirendViewController ()<UISearchBarDelegate>
{
    UISearchBar *_friendSearchBar;
}
@property (nonatomic, strong) HWSearchFirendViewModel *searchVM;
@end

@implementation HWSerchFirendViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        @weakify(self)
        [RACObserve(self.searchVM, friendsArr) subscribeNext:^(id x) {
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

- (void)configSubViews
{
    self.navigationItem.title = @"搜个耙耙";
    
    _friendSearchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
    _friendSearchBar.delegate = self;

    /*
    RACSignal *sig = [_friendSearchBar rac_signalForSelector:@selector(searchBarSearchButtonClicked:) fromProtocol:@protocol(UISearchBarDelegate)];
    [sig subscribeNext:^(id x) {
        DebugLog(@"%@",x);
    }];
    
    [[_friendSearchBar rac_signalForSelector:@selector(searchBarSearchButtonClicked:)] subscribeNext:^(id x) {
        
    }];
      */
    
    self.tableView.tableHeaderView = _friendSearchBar;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self.searchVM searchFriendByPhone:searchBar.text];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.searchVM.friendsArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    TIMUserProfile *user = self.searchVM.friendsArr[indexPath.row];
    cell.textLabel.text = user.identifier;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TIMUserProfile *user = self.searchVM.friendsArr[indexPath.row];
    [self.searchVM addFirend:user];
}

- (HWSearchFirendViewModel *)searchVM
{
    if (!_searchVM) {
        _searchVM = [HWSearchFirendViewModel new];
    }
    return _searchVM;
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
