//
//  LCBizUtil.h
//  Achilles
//
//  Created by weiyanen on 13-5-30.
//  Copyright (c) 2013年 cop-studio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCBizUtil : NSObject

+ (NSUserDefaults *)sharedUserDefaults;

+ (void)setUserDefaultsAt:(NSInteger)idx withFlag:(BOOL)flag;

@end
