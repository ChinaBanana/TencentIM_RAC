//
//  UIButton+HeadButton.h
//  CommonDemo
//
//  Created by 赵海伟 on 19/01/2017.
//  Copyright © 2017 赵海伟. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^HeadBtnClicked)(UIButton*headBtn);
typedef void (^NormalBtnClicked)(UIButton*normalBtn);

@interface UIButton (HeadButton)

+ (instancetype)hw_normalBtnWithClicked:(NormalBtnClicked)clicked;
+ (instancetype)hw_headBtnWithImage:(NSString*)headImageStr andClicked:(HeadBtnClicked)clicked;

@end
