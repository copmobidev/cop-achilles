//
//  LCBizController.h
//  Achilles
//
//  Created by weiyanen on 13-5-18.
//  Copyright (c) 2013年 cop-studio. All rights reserved.
//

#import "LCBaseViewController.h"
#import "LCBiz.h"
#import "ECSlidingViewController.h"
#import "LCMenuViewController.h"

@interface LCBizController : LCBaseViewController<LCBizPlotDelegate>

/*HostingView*/
@property (weak, nonatomic) IBOutlet CPTGraphHostingView *MainHostingView;
@property (weak, nonatomic) IBOutlet CPTGraphHostingView *PieHostingView;

/*Action in Controller*/
- (IBAction)revealMenu:(id)sender;

@end
