//
//  UITextField+CustomTextField.m
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 20/01/2017.
//  Copyright © 2017 赵海伟. All rights reserved.
//

#import "UITextField+CustomTextField.h"

@implementation UITextField (CustomTextField)

+ (instancetype)hw_textField
{
    UITextField *textField = [[UITextField alloc]init];
    [textField setLayerCornerRadius:5];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    return textField;
}

@end
