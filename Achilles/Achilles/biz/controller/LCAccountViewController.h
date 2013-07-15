//
//  LCAccountViewController.h
//  Achilles
//
//  Created by weiyanen on 13-5-26.
//  Copyright (c) 2013年 cop-studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ECSlidingViewController.h"
#import "LCBizController.h"

@interface LCAccountViewController : LCBizController

@property (weak, nonatomic) IBOutlet UIView *inputView;

- (IBAction)editProfile:(id)sender;

- (IBAction)resignKeyBoardInView:(UIView *)view;
@end
