//
//  LTGlobalConfig.m
//  Achilles
//
//  Created by weiyanen on 13-5-12.
//  Copyright (c) 2013年 cop-studio. All rights reserved.
//

#import "LTGlobalConfig.h"

@implementation LTGlobalConfig
static LTGlobalConfig *sharedGlobalConfig = nil;

+ (LTGlobalConfig *)sharedGlobalConfig {
	@synchronized(self) {
		if (sharedGlobalConfig == nil) {
			sharedGlobalConfig = [[LTGlobalConfig alloc] init];
		}
	}
	return sharedGlobalConfig;
}
@end
