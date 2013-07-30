//
//  LCServiceDelegate.h
//  Achilles
//
//  Created by weiyanen on 13-6-11.
//  Copyright (c) 2013年 cop-studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCDataServiceDelegate.h"
#import "LCMApiServiceDelegate.h"
#import "LCBoundViewController.h"

@interface LCServiceDelegate : NSObject<LCDataServiceDelegate, LCMApiServiceDelegate>

LCSINGLETON_IN_H(LCServiceDelegate)

@property (nonatomic, strong) LCBoundViewController *registerController;
@end
