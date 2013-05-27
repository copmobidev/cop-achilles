//
//  spanTableControllerViewController.h
//  FPPopoverDemo
//
//  Created by Alvise Susmel on 4/13/12.
//  Copyright (c) 2012 Fifty Pixels Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCBizSpanViewController.h"

@interface LCSpanTableController : UITableViewController
@property(nonatomic,assign) LCBizSpanViewController *delegate;
@end
