//
//  HWBaseModel.m
//  ReactiveCocoa_tencentIM
//
//  Created by 赵海伟 on 20/01/2017.
//  Copyright © 2017 赵海伟. All rights reserved.
//

#import "HWBaseModel.h"

@implementation HWBaseModel

- (void)save
{
    NSString *path = [NSString stringWithFormat:@"%@/%@", NSHomeDirectory(), NSStringFromClass(self.class)];
    NSMutableData *data = [NSMutableData new];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    [archiver encodeObject:self forKey:NSStringFromClass(self.class)];
    [archiver finishEncoding];
    BOOL result = [data writeToFile:path atomically:YES];
    if (result) {
        NSLog(@"Archive success");
    }else{
        NSLog(@"Archive failed");
    }
}

+ (BOOL)deleteModel
{
    NSString *path = [NSString stringWithFormat:@"%@/%@", NSHomeDirectory(), NSStringFromClass(self.class)];
    NSFileManager *fm = [NSFileManager defaultManager];
    NSError *error;
    [fm removeItemAtPath:path error:&error];
    if (error) {
        return NO;
    }
    return YES;
}

+ (id)getFromLocal
{
    NSString *path = [NSString stringWithFormat:@"%@/%@", NSHomeDirectory(), NSStringFromClass(self.class)];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc]initForReadingWithData:data];
    id model = [unarchiver decodeObjectForKey:NSStringFromClass(self.class)];
    [unarchiver finishDecoding];
    return model;
}


- (void)encodeWithCoder:(NSCoder *)coder
{
    NSArray *properties = [self hw_objcProperties];
    for (id property in properties) {
        [coder encodeObject:[self valueForKey:property] forKey:property];
    }
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        NSArray *properties = [self hw_objcProperties];
        for (id property in properties) {
            [self setValue:[coder decodeObjectForKey:property] forKey:property];
        }
    }
    return self;
}

- (NSString *)description
{
    NSArray *properties = [self hw_objcProperties];
    NSMutableString *describeStr = [NSMutableString stringWithString:@"\n{"];
    [describeStr appendFormat:@"\n       ClassName:%@", [self class]];
    for (id property in properties) {
        [describeStr appendFormat:@"\n       %@:%@", property, [self valueForKey:property]];
    }
    [describeStr appendString:@"\n}"];
    return describeStr;
}


@end
