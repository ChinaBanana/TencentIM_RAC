//
//  HWContactViewController.m
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 06/12/2016.
//  Copyright © 2016 赵海伟. All rights reserved.
//

#import "HWContactViewController.h"
#import "HWContactViewModel.h"
#import "HWSerchFirendViewController.h"
#import "HWContactsModel.h"
#import "HWFrutureFriendViewController.h"

@interface HWContactViewController ()
@property (nonatomic, strong) HWContactViewModel *contactVM;

@end

@implementation HWContactViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        @weakify(self)
        [RACObserve(self.contactVM, contactsList) subscribeNext:^(id x) {
            @strongify(self);
            DebugLog(@"%@",x);
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationNone];
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
    self.navigationItem.title = @"狐朋狗友";
    UIBarButtonItem *addBtn = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(p_addBtnClicked)];
    self.navigationItem.rightBarButtonItem = addBtn;
}

- (void)p_addBtnClicked
{
    [[AppDelegate sharedDelegate] hw_pushViewController:[HWSerchFirendViewController new]];
}

#pragma mark call back
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return section == 0 ? self.contactVM.systemList.count : self.contactVM.contactsList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifer = @"contactCellId";
    HWContactTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    if (!cell) {
        cell = [[HWContactTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifer];
    }
    HWContactsModel *model;
    switch (indexPath.section) {
        case 0:
            model = self.contactVM.systemList[indexPath.row];
            [cell configureCellByModel:model];
            break;
        case 1:
            
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[AppDelegate sharedDelegate] hw_pushViewController:[HWFrutureFriendViewController new]];
}

- (HWContactViewModel *)contactVM
{
    if (!_contactVM) {
        _contactVM = [HWContactViewModel new];
    }
    return _contactVM;
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

@interface HWContactTableViewCell ()
{
    UIImageView *_headImage;
    UILabel     *_nameLabel;
}
@end

@implementation HWContactTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self p_configuViews];
    }
    return self;
}

- (void)p_configuViews
{
    _headImage = [UIImageView hw_headImageView];
    _nameLabel = [UILabel hw_normalTextLabel];
    [self.contentView addSubview:_headImage];
    [self.contentView addSubview:_nameLabel];
    [self.contentView setNeedsUpdateConstraints];
}

- (void)updateConstraints
{
    [_headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@20);
        make.centerY.equalTo(_headImage.superview);
    }];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_headImage.mas_right).offset(20);
        make.width.equalTo(@200);
        make.height.equalTo(@30);
        make.centerY.equalTo(_headImage);
    }];
    [super updateConstraints];
}

- (void)configureCellByModel:(HWContactsModel*)model
{
    _headImage.image = IMAGE(model.headImage);
    _nameLabel.text = model.nickName;
}


@end
