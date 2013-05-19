//
//  LCDataServiceDelegate.h
//  Achilles
//
//  Created by ChrisLiu  on 5/19/13.
//  Copyright (c) 2013 cop-studio. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LCDataServiceDelegate <NSObject>

/*
  获取配置
 */
- (void)onGetConfigSuccess:(void (^)(NSDictionary*)) callback;
- (void)onGetConfigFail:(void(^)()) callback;

/*
 同步数据
 */
- (void)onSyncDataSuccess:(void(^)(NSDictionary*)) callback;
- (void)onSyncDataFail:(void(^)()) callback;

/*
 上传数据
 */
- (void)onUploadDataSucess:(void(^)(NSDictionary*)) callback;
- (void)onUploadDataFail:(void(^)()) callback;

@end
