//
//  LCServiceDelegate.h
//  Achilles
//
//  Created by weiyanen on 13-6-11.
//  Copyright (c) 2013年 cop-studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCBoundViewController.h"
#import "LCDataConfig.h"
#import "LCDataService.h"

@interface LCServiceDelegate : NSObject<LCDataServiceDelegate>

LCSINGLETON_IN_H(LCServiceDelegate)

@property (nonatomic, strong) LCBoundViewController *boundController;
@end
