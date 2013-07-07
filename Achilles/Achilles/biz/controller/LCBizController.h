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
#import "LCPlotProvider.h"
#import "CPDConstants.h"

@interface LCBizController : LCBaseViewController<LCBizPlotDelegate>

/*Provider*/
@property (nonatomic, strong) LCPlotProvider *provider;

/*HostingView*/
//Main Hosting View
@property (weak, nonatomic) IBOutlet CPTGraphHostingView *MainHostingView;
//Pie Hosting View
@property (weak, nonatomic) IBOutlet CPTGraphHostingView *PieHostingView;

@property (weak, nonatomic) IBOutlet CPTGraphHostingView *SecondHostingView;

/*Action in Controller*/
- (IBAction)revealMenu:(id)sender;

@end
