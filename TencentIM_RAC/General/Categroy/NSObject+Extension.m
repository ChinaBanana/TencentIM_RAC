//
//  NSObject+Extension.m
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 20/01/2017.
//  Copyright © 2017 赵海伟. All rights reserved.
//

#import "NSObject+Extension.h"
#import <objc/runtime.h>

const char *kPropertyListKey = "hwPropertyListKey";

@implementation NSObject (Extension)

- (NSArray *)hw_objcProperties
{
    NSArray *properties = objc_getAssociatedObject(self, kPropertyListKey);
    if (properties) {
        return properties;
    }
    
    unsigned int outCount = 0;
    
    objc_property_t *propertyList = class_copyPropertyList([self class], &outCount);
    NSMutableArray *finalArray = [NSMutableArray array];
    for (unsigned int i = 0; i < outCount; i++) {
        objc_property_t property = propertyList[i];
        const char *property_C = property_getName(property);
        NSString *property_OC = [NSString stringWithCString:property_C encoding:NSUTF8StringEncoding];
        [finalArray addObject:property_OC];
    }
    objc_setAssociatedObject(self, kPropertyListKey, finalArray.copy, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    free(propertyList);
    return finalArray.copy;
}

/*

*/
@end
