//
//  NSObject+Extension.h
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 20/01/2017.
//  Copyright © 2017 赵海伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Extension)

/**
 * get all property of current class

 @return an Array contian all properties belong to current class 
 */
- (NSArray *)hw_objcProperties;

@end
