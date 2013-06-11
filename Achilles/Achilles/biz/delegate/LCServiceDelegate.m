//
//  LCServiceDelegate.m
//  Achilles
//
//  Created by weiyanen on 13-6-11.
//  Copyright (c) 2013年 cop-studio. All rights reserved.
//

#import "LCServiceDelegate.h"
#import "LCStore.h"
#import "LCRegisterInfo.h"
#import "NSObject+Properties.h"

@implementation LCServiceDelegate

LCSINGLETON_IN_M(LCServiceDelegate)

/*
 获取配置
 */
- (void)onGetConfigSuccess:(NSDictionary*) config {
	LCRegisterInfo *registerInfo = [[LCRegisterInfo alloc] init];
	
	for (NSString *property in [LCRegisterInfo propertyNames] ) {
		[registerInfo setValue:[config valueForKey:property] forKey:property];
		NSLog(@"%@:%@\n", property, [config valueForKey:property]);
	}
	
	[[LCStore sharedInstance] setUserDefaultObject:registerInfo forKey:RegisteredInfoKey];
	[self.registerController dismiss];
}

- (void)onGetConfigFail {
	UIAlertView *alert =   [[UIAlertView alloc] initWithTitle: @"初始化失败" message: @"请检查Wifi连接或联系工作人员." delegate: nil cancelButtonTitle: @"取消" otherButtonTitles: nil];
	[alert show];
}

/*
 同步数据
 */
- (void)onSyncDataSuccess:(NSDictionary*) data {
	
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
