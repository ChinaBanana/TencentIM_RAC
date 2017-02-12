//
//  ProgressHUDTools.h
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 04/01/2017.
//  Copyright © 2017 赵海伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProgressHUDTools : NSObject

extern void ShowSuccessStatus(NSString *statues);

extern void ShowErrorStatus(NSString *statues);

extern void ShowMaskStatus(NSString *statues);

extern void ShowMessage(NSString *statues);

extern void ShowProgress(CGFloat progress);

extern void DismissHud(void);

@end
