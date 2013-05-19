//
//  LCEnvironment.h
//  Achilles
//
//  Created by ChrisLiu  on 5/16/13.
//  Copyright (c) 2013 cop-studio. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 App的运行环境
 提供基本的信息，如deviceId, userAgent等
 
 具体由不同的App来定义。一般在业务层中需要重载以提供自定义的NVEnvironment（使用NVInternal.h NVInternalSetDefaultEnvironment）
 */
@interface LCEnvironment : NSObject

+ (LCEnvironment* )environment;

- (BOOL)debug;

- (NSString* )deviceId;

- (NSString* )userAgent;

/*
 App的版本
 */
- (NSString* )version;

/*
 设备的型号
 iPhone, iPad, iPod, iOS (is unknown)
 */
- (NSString* )deviceModel;

/*
 硬件版本
 */
- (NSString* )platform;

/*
 AppStore中的AppId
 */
- (NSString* )appId;

/*
 Info.plist中定义
 如"com.dianping.dpscope"
 */
- (NSString* )bundleId;

@end
