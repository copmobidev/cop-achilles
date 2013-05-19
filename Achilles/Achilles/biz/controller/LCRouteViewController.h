//
//  SecondTopViewController.h
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 1/23/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ECSlidingViewController.h"
#import "LCMenuViewController.h"

@interface LCRouteViewController : UIViewController<CPTPlotDataSource>

/*Data*/
@property (nonatomic, strong) NSMutableArray *pieData;

/*Plot*/
@property (nonatomic, strong) CPTBarPlot *speedBarPlot;
@property (nonatomic, strong) CPTScatterPlot *oilScatterPlot;
@property (nonatomic, strong) CPTPieChart *pieChart;

/*HostingView*/
@property (weak, nonatomic) IBOutlet CPTGraphHostingView *MainHostingView;
@property (weak, nonatomic) IBOutlet CPTGraphHostingView *PieHostingView;

/*Action in Controller*/
- (IBAction)revealMenu:(id)sender;

@end
