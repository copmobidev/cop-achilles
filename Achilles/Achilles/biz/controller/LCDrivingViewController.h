//
//  ThirdTopViewController.h
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 1/23/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ECSlidingViewController.h"
#import "LCMenuViewController.h"
#import "UnderRightViewController.h"

@interface LCDrivingViewController : UIViewController

/*Data*/
@property (nonatomic, strong) NSMutableArray *pieData;

/*Plot*/
@property (nonatomic, strong) CPTBarPlot *scoreBarPlot;
@property (nonatomic, strong) CPTPieChart *pieChart;

/*Action in Controller*/
- (IBAction)revealMenu:(id)sender;
@end
