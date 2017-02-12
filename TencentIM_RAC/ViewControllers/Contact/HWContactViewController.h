//
//  HWContactViewController.h
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 06/12/2016.
//  Copyright © 2016 赵海伟. All rights reserved.
//

#import "HWBaseTableVC.h"
#import "HWBaseTVCell.h"

@class HWContactsModel;
@interface HWContactViewController : HWBaseTableVC

@end

@interface HWContactTableViewCell : HWBaseTVCell

- (void)configureCellByModel:(HWContactsModel*)model;

@end
