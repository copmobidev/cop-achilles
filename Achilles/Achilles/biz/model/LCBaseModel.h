//
//  LCModel.h
//  Achilles
//
//  Created by weiyanen on 13-6-11.
//  Copyright (c) 2013年 cop-studio. All rights reserved.
//

#import <Foundation/Foundation.h>

//任何继承LCModel的对象都实现了NSCoding协议，可以直接序列化
@interface LCBaseModel : NSObject<NSCoding>

@end
