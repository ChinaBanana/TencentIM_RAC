//
//  Macro.h
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 06/12/2016.
//  Copyright © 2016 赵海伟. All rights reserved.
//

#ifndef Macro_h
#define Macro_h


#define SDKAPPID                    1400024409
#define ACCOUNT_TYPE                10399

#define SCREEN_WIDTH                [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT               [UIScreen mainScreen].bounds.size.height
#define VIEW_HEIGH                  SCREEN_HEIGHT - 64

#define DEFAULT_HEAD_IMAGE          IMAGE(@"default_person_image")

#define REDIO                       375/SCREEN_WIDTH

/* ***********************              debug               ********************* */
#ifdef DEBUG

#define DebugLog( s, ... ) NSLog( @"< %@:(%d) > %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )

#else

#define DebugLog( s, ... )

#endif

/* ***********************              color               ********************* */

#define black_color     [UIColor blackColor]
#define blue_color      [UIColor blueColor]
#define brown_color     [UIColor brownColor]
#define clear_color     [UIColor clearColor]
#define darkGray_color  [UIColor darkGrayColor]
#define darkText_color  [UIColor darkTextColor]
#define white_color     [UIColor whiteColor]
#define yellow_color    [UIColor yellowColor]
#define red_color       [UIColor redColor]
#define orange_color    [UIColor orangeColor]
#define purple_color    [UIColor purpleColor]
#define lightText_color [UIColor lightTextColor]
#define lightGray_color [UIColor lightGrayColor]
#define green_color     [UIColor greenColor]
#define gray_color      [UIColor grayColor]
#define magenta_color   [UIColor magentaColor]

// 颜色(RGB)
#define RGBCOLOR(r, g, b)       [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r, g, b, a)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

#define RGB16(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define RGBA16(rgbaValue) [UIColor colorWithRed:((float)((rgbaValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbaValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbaValue & 0xFF))/255.0 alpha:((float)((rgbaValue & 0xFF000000) >> 24))/255.0]

/** 时间间隔 */
#define kHUDDuration            (1.f)

/** 一天的秒数 */
#define SecondsOfDay            (24.f * 60.f * 60.f)

/** 秒数 */
#define Seconds(Days)           (24.f * 60.f * 60.f * (Days))

/** 一天的毫秒数 */
#define MillisecondsOfDay       (24.f * 60.f * 60.f * 1000.f)

/** 毫秒数 */
#define Milliseconds(Days)      (24.f * 60.f * 60.f * 1000.f * (Days))


#define URL(url) [NSURL URLWithString:url]
#define IMAGE(imageName) [UIImage imageNamed:imageName]
#define stringEmpty @""
#define string(str1,str2) [NSString stringWithFormat:@"%@%@",str1,str2]
#define intToString(int) [NSString stringWithFormat:@"%d",int]
#define s_str(str1) [NSString stringWithFormat:@"%@",str1]
#define s_int(str,int) [NSString stringWithFormat:@"%@%d",str,int]
#define s_Num(num1) [NSString stringWithFormat:@"%d",num1]
#define s_float(num1) [NSString stringWithFormat:@"%f",num1]
#define s_Integer(num1) [NSString stringWithFormat:@"%ld",num1]

#endif /* Macro_h */
