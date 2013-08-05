//
//  RegisterInfo.h
//  Achilles
//
//  Created by weiyanen on 13-5-10.
//  Copyright (c) 2013年 weiyanen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCBaseModel.h"

@interface LCBoundModel : LCBaseModel

@property (nonatomic, strong) NSString *obd;

@property (nonatomic, strong) NSString *manufacturer;

@property (nonatomic, strong) NSString *brand;

@property (nonatomic, strong) NSString *model;

@property (nonatomic, assign) int engine;

@property (nonatomic, strong) NSString *color;

@property (nonatomic, assign) int configParam;

@property (nonatomic, assign) int sex;

@property (nonatomic, assign) int birth;

@property (nonatomic, assign) int score;

@property (nonatomic, assign) int level;

@property (nonatomic, assign) int registerTime;

@end
