//
//  HWSearchFirendViewModel.h
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 09/02/2017.
//  Copyright © 2017 赵海伟. All rights reserved.
//

#import "HWBaseViewModel.h"

@interface HWSearchFirendViewModel : HWBaseViewModel

@property (nonatomic, strong) NSArray       *friendsArr;
@property (nonatomic, strong) RACSubject    *searchFriendSubj;

- (void)searchFriendByPhone:(NSString*)phone;
- (void)addFirend:(TIMUserProfile*)user;

@end
