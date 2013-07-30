//
//  LCBatteryViewController.h
//  Achilles
//
//  Created by weiyanen on 13-7-14.
//  Copyright (c) 2013年 cop-studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCBizController.h"

@interface LCBatteryViewController : LCBizController
@property (weak, nonatomic) IBOutlet UIView *canvasView;

- (IBAction)back:(id)sender;
@end
