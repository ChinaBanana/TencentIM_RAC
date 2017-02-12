//
//  UIView+CustomView.m
//  CommonDemo
//
//  Created by 赵海伟 on 19/01/2017.
//  Copyright © 2017 赵海伟. All rights reserved.
//

#import "UIView+CustomView.h"

@implementation UIView (CustomView)

- (void)setLayerCornerRadius:(CGFloat)num
{
    self.layer.cornerRadius = num;
    self.clipsToBounds = YES;
}

@end
