//
//  FirstTopViewController.h
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 1/23/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "ECSlidingViewController.h"
#import "LCMenuViewController.h"
#import "UnderRightViewController.h"

@interface LCHomeViewController : UIViewController<CPTPieChartDataSource>

@property (nonatomic, strong) NSMutableArray *pieData;

@property (nonatomic, strong) CPTXYGraph *graph;

@property (nonatomic, strong) CPTGraphHostingView *hostingView;

@property (nonatomic, strong) UIView *bowView;

@property (weak, nonatomic) IBOutlet UIView *spanView;

@property (weak, nonatomic) IBOutlet UIView *buttonView;
- (IBAction)revealMenu:(id)sender;

- (IBAction)revealUnderRight:(id)sender;

@end
