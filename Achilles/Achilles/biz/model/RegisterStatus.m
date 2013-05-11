//
//  RegisterStatus.m
//  Achilles
//
//  Created by weiyanen on 13-5-11.
//  Copyright (c) 2013年 weiyanen. All rights reserved.
//

#import "RegisterStatus.h"

@implementation RegisterStatus

static RegisterStatus *sharedRegisterStatus = nil;

+ (RegisterStatus *)sharedInstance {
	@synchronized (self) {
		if (sharedRegisterStatus == nil) {
			sharedRegisterStatus = [[self alloc] init];
			sharedRegisterStatus.isRegisterd = NO;
		}
	}
	return sharedRegisterStatus;
}

@end
