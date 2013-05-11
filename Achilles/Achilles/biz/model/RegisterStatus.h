//
//  RegisterStatus.h
//  Achilles
//
//  Created by weiyanen on 13-5-11.
//  Copyright (c) 2013年 weiyanen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegisterStatus : NSObject

@property (nonatomic, assign) BOOL isRegisterd;

+ (RegisterStatus *)sharedInstance;

@end
