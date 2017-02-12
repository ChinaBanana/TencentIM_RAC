//
//  UIImageView+CustomImageView.m
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 09/02/2017.
//  Copyright © 2017 赵海伟. All rights reserved.
//

#import "UIImageView+CustomImageView.h"

@implementation UIImageView (CustomImageView)

+ (instancetype)hw_headImageView
{
    UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    imageV.image = DEFAULT_HEAD_IMAGE;
    return imageV;
}

@end
