//
//  UIButton+HeadButton.m
//  CommonDemo
//
//  Created by 赵海伟 on 19/01/2017.
//  Copyright © 2017 赵海伟. All rights reserved.
//

#import "UIButton+HeadButton.h"

@implementation UIButton (HeadButton)

+ (instancetype)hw_normalBtnWithClicked:(NormalBtnClicked)clicked
{
    UIButton *button = [[UIButton alloc]init];
    [[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        clicked(button);
    }];
    return button;
}

+ (instancetype)hw_headBtnWithImage:(NSString*)headImageStr andClicked:(HeadBtnClicked)clicked
{
    UIButton *button = [[UIButton alloc]init];
    [button sd_setImageWithURL:URL(headImageStr) forState:UIControlStateNormal placeholderImage:DEFAULT_HEAD_IMAGE];
    [[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        clicked(button);
    }];
    return button;
}

@end
