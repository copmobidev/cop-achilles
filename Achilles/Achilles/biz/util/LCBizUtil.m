//
//  LCBizUtil.m
//  Achilles
//
//  Created by weiyanen on 13-5-30.
//  Copyright (c) 2013年 cop-studio. All rights reserved.
//

#import "LCBizUtil.h"

@implementation LCBizUtil


+ (NSString *)getUserDefautKey:(NSUInteger)idx {
	NSArray *keys = @[@"gprs", @"cache"];
	return keys[idx];
}

+ (NSUserDefaults *)sharedUserDefaults {
	return [NSUserDefaults standardUserDefaults];
}

+ (void)setUserDefaultsAt:(NSInteger)idx withFlag:(BOOL)flag {
	[[self sharedUserDefaults] setBool:flag forKey:[self getUserDefautKey:idx]];
}

+ (BOOL)UserDefaultsAt:(NSInteger)idx withFlag:(BOOL)flag {
	return [[self sharedUserDefaults] boolForKey:[self getUserDefautKey:idx]];
}
@end
