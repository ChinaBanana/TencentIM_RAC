//
//  HWBaseModel.h
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 20/01/2017.
//  Copyright © 2017 赵海伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HWBaseModel : NSObject<NSCoding>

/**
 * save model, one class can only save one model
 */
- (void)save;

/**
 * get model by Class name which was saved before

 @return a model
 */
+ (id)getFromLocal;

/**
 * deleteModel of current class
 */
+ (BOOL)deleteModel;

@end
