//
//  LCStore.h
//  Achilles
//
//  Created by weiyanen on 13-6-5.
//  Copyright (c) 2013年 cop-studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCDefine.h"

#define LCUserDefaults [NSUserDefaults standardUserDefaults]    //for short code
#define LCDocumentPath     NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, \
NSUserDomainMask, \
YES \
)[0]
#define LCLibaryPath     NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, \
NSUserDomainMask, \
YES \
)[0]
#define LCCachePath     NSSearchPathForDirectoriesInDomains(NSCachesDirectory, \
NSUserDomainMask, \
YES \
)[0]

typedef enum {
    kStorePathDocument,
    kStorePathCache,
    kStorePathTmp
} StorePath;

@interface LCStore : NSObject

LCSINGLETON_IN_H(LCStore)

// plist store, 读写属性一致， 不建议 写 object 读 array.
- (BOOL)setPlistArray:(NSArray*)array forKey:(NSString*)key;
- (NSArray *)plistArrayForKey:(NSString *)key;

- (BOOL)setPlistObject:(id)obj forKey:(NSString*)key;
- (id)plistObjectForKey:(NSString *)key;

- (BOOL)setPlistArray:(NSArray*)array forKey:(NSString*)key inPath:(StorePath)storePath;
- (NSArray *)plistArrayForKey:(NSString *)key inPath:(StorePath)storePath;

- (id)plistObjectForKey:(NSString *)key inPath:(StorePath)storePath;
- (BOOL)setPlistObject:(id)obj forKey:(NSString*)key inPath:(StorePath)storePath;

// user deafult 封装 object 存储
- (void)setUserDefaultObject:(id<NSCoding>)obj forKey:(NSString*)key;
- (id)userDefaultObjectForKey:(NSString*)key;


@end
