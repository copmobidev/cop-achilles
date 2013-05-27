//
//  LCBizSpanViewController.h
//  Achilles
//
//  Created by weiyanen on 13-5-27.
//  Copyright (c) 2013年 cop-studio. All rights reserved.
//

#import "LCBizController.h"
#import "FPPopoverController.h"

@interface LCBizSpanViewController : LCBizController<FPPopoverControllerDelegate>

@property (nonatomic, strong) FPPopoverController *popover;

- (void)selectedTableRow:(NSUInteger)row;

-(IBAction)popover:(id)sender;

@end
