//
//  UILabel+CustomLabel.m
//  CommonDemo
//
//  Created by 赵海伟 on 19/01/2017.
//  Copyright © 2017 赵海伟. All rights reserved.
//

#import "UILabel+CustomLabel.h"

@implementation UILabel (CustomLabel)

+ (instancetype)hw_normalTextLabel
{
    UILabel *label = [[UILabel alloc]init];
    label.font = [UIFont systemFontOfSize:15];
    return label;
}

+ (instancetype)hw_largeTextLabel
{
    UILabel *label = [[UILabel alloc]init];
    label.font = [UIFont systemFontOfSize:18];
    return label;
}

+ (instancetype)hw_smallTextLabel
{
    UILabel *label = [[UILabel alloc]init];
    label.font = [UIFont systemFontOfSize:12];
    return label;
}

@end
