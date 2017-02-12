//
//  HWMineViewController.m
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 06/12/2016.
//  Copyright © 2016 赵海伟. All rights reserved.
//

#import "HWMineViewController.h"
#import "HWMineViewModel.h"

@interface HWMineViewController ()
{
    UIView      *_footerView;
    UIButton    *_logOutBtn;
}
@property (nonatomic, strong) HWMineViewModel *mineVM;

@end

@implementation HWMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)configSubViews
{
    self.navigationItem.title = @"我she";
}

- (void)configHeaderView
{
    
}

- (void)configFooterView
{
    _footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH , 100)];
    
    @weakify(self)
    _logOutBtn = [UIButton hw_normalBtnWithClicked:^(UIButton *headBtn) {
        @strongify(self)
        [self.mineVM logOut];
    }];
    _logOutBtn.backgroundColor = orange_color;
    [_logOutBtn setLayerCornerRadius:5];
    [_logOutBtn setTitle:@"退出登录" forState:UIControlStateNormal];
    [_logOutBtn setTitleColor:white_color forState:UIControlStateNormal];
    [_footerView addSubview:_logOutBtn];
    
    self.tableView.tableFooterView = _footerView;
    [self.view setNeedsUpdateConstraints];
}

- (void)updateViewConstraints
{
    [_logOutBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@50);
        make.top.equalTo(@20);
        make.right.equalTo(@-50);
        make.height.equalTo(@50);
    }];
    [super updateViewConstraints];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 70;
    }
    return 50;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    return 3;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (HWMineViewModel *)mineVM
{
    if (!_mineVM) {
        _mineVM = [HWMineViewModel new];
    }
    return _mineVM;
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
