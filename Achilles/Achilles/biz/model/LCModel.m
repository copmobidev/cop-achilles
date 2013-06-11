//
//  LCModel.m
//  Achilles
//
//  Created by weiyanen on 13-6-11.
//  Copyright (c) 2013年 cop-studio. All rights reserved.
//

#import "LCModel.h"
#import "NSObject+Properties.h"

@implementation LCModel

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
    NSArray *properties = [self propertyNames];
    NSObject *obj = nil;
    for (NSString* property in properties) {
        obj = [self valueForKey:property];
        [aCoder encodeObject:obj forKey:property];
    }
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [self init];
    NSArray *properties = [self propertyNames];
    NSObject *obj = nil;
    for (NSString* propertyStr in properties) {
        obj = [aDecoder decodeObjectForKey:propertyStr];
        [self setValue:obj forKey:propertyStr];
    }
    return self;
}

@end
