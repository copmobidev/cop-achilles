//
//  LTGlobalConfig.m
//  Achilles
//
//  Created by weiyanen on 13-5-12.
//  Copyright (c) 2013年 cop-studio. All rights reserved.
//

#import "LTGlobalConfig.h"

@implementation LCGlobalConfig
static LCGlobalConfig *sharedGlobalConfig = nil;

+ (LCGlobalConfig *)sharedGlobalConfig {
	@synchronized(self) {
		if (sharedGlobalConfig == nil) {
			sharedGlobalConfig = [[LCGlobalConfig alloc] init];
		}
	}
	return sharedGlobalConfig;
}
@end
