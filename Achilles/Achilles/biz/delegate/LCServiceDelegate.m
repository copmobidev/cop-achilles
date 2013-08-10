//
//  LCServiceDelegate.m
//  Achilles
//
//  Created by weiyanen on 13-6-11.
//  Copyright (c) 2013年 cop-studio. All rights reserved.
//

#import "LCServiceDelegate.h"
#import "LCStore.h"
#import "LCBoundModel.h"
#import "NSObject+Properties.h"

@implementation LCServiceDelegate

LCSINGLETON_IN_M(LCServiceDelegate)

/*
 获取配置
 */
- (void)onGetConfigSuccess:(NSDictionary*) config {
	LCBoundModel *registerInfo = [[LCBoundModel alloc] init];
	
	for (NSString *property in [LCBoundModel propertyNames] ) {
		[registerInfo setValue:[config valueForKey:property] forKey:property];
		NSLog(@"%@:%@\n", property, [config valueForKey:property]);
	}
	
	[[LCStore sharedInstance] setUserDefaultObject:registerInfo forKey:RegisteredInfoKey];
	[self.boundController finish];
}

- (void)onGetConfigFail {
	
}

/*
 同步数据
 */
- (void)onSyncDataSuccess:(NSDictionary*) data {
	NSLog(@"on Sync Data Success: %@", data);
}

- (void)onSyncDataFail {
	
}

/*
 上传数据
 */
- (void)onUploadDataSucess:(NSDictionary*) callback {
	
}

- (void)onUploadDataFail {
	
}

@end
