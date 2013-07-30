//
//  LCModel.m
//  Achilles
//
//  Created by weiyanen on 13-6-11.
//  Copyright (c) 2013年 cop-studio. All rights reserved.
//

#import "LCBaseModel.h"
#import "NSObject+Properties.h"

@implementation LCBaseModel

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
    NSArray *properties = [self propertyNames];
    NSObject *obj = nil;
    for (NSString* propertyName in properties) {
        obj = [self valueForKey:propertyName];
        [aCoder encodeObject:obj forKey:propertyName];
    }
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if((self = [self init])){
		NSArray *properties = [self propertyNames];
		NSObject *obj = nil;
		for (NSString* propertyName in properties) {
			// 取值前确认相应的键值是否存在
			if ([aDecoder containsValueForKey:propertyName]) {
				obj = [aDecoder decodeObjectForKey:propertyName];
				[self setValue:obj forKey:propertyName];
			}
		}
	}
	
    return self;
}

@end
