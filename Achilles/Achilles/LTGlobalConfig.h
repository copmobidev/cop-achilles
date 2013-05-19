//
//  LTGlobalConfig.h
//  Achilles
//
//  Created by weiyanen on 13-5-12.
//  Copyright (c) 2013年 cop-studio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCGlobalConfig : NSObject
@property (nonatomic, strong) NSDictionary *configDictionary;

+ (LCGlobalConfig *)sharedGlobalConfig;
@end
