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
	[self.registerController finish];
}

- (void)onGetConfigFail {
	FUIAlertView *alertView =   [[FUIAlertView alloc] initWithTitle: @"初始化失败" message: @"请检查Wifi连接或联系工作人员." delegate: nil cancelButtonTitle: @"取消" otherButtonTitles: nil];
	alertView.titleLabel.textColor = [UIColor cloudsColor];
    alertView.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    alertView.messageLabel.textColor = [UIColor cloudsColor];
    alertView.messageLabel.font = [UIFont flatFontOfSize:14];
    alertView.backgroundOverlay.backgroundColor = [[UIColor cloudsColor] colorWithAlphaComponent:0.8];
    alertView.alertContainer.backgroundColor = [UIColor midnightBlueColor];
    alertView.defaultButtonColor = [UIColor cloudsColor];
    alertView.defaultButtonShadowColor = [UIColor asbestosColor];
    alertView.defaultButtonFont = [UIFont boldFlatFontOfSize:16];
    alertView.defaultButtonTitleColor = [UIColor asbestosColor];
	[alertView show];
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
