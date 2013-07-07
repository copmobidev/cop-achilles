//
//  LCConsumeViewController.m
//  Achilles
//
//  Created by weiyanen on 13-5-19.
//  Copyright (c) 2013年 cop-studio. All rights reserved.
//

#import "LCConsumeViewController.h"

@interface LCConsumeViewController ()

@end

@implementation LCConsumeViewController

#pragma mark - UIViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

#pragma mark - BizPlotDelegate

- (void)configurePlots {
/*Main Plots*/

	CPTGraph *mainGraph = self.MainHostingView.hostedGraph;
	mainGraph.plotAreaFrame.borderLineStyle = nil;
	mainGraph.title = @"平均油耗";
	mainGraph.titleDisplacement = CGPointMake(-120.f, -10.f);
/*Average Consume Bar Plot*/
	// 1 Set up
	CPTBarPlot *averageBarPlot = [CPTBarPlot tubularBarPlotWithColor:[CPTColor greenColor] horizontalBars:NO];
	averageBarPlot.identifier = LCConsumeAverageConsume;//
	averageBarPlot.dataSource = self.provider;

	// 2 Set up line style & barWidth &baroffset
	CPTMutableLineStyle *averageBarLineStyle = [CPTMutableLineStyle lineStyle];
	averageBarLineStyle.lineColor = [CPTColor lightGrayColor];
	averageBarLineStyle.lineWidth = 0.5;
	averageBarPlot.lineStyle = averageBarLineStyle;
	
	averageBarPlot.barWidth = CPTDecimalFromDouble(CPDBarWidth);
	averageBarPlot.barOffset = CPTDecimalFromDouble(CPDBarInitialX);
	averageBarPlot.barBasesVary = YES;
	averageBarPlot.fill = [CPTFill fillWithColor:[CPTColor colorWithComponentRed:.2 green:.584 blue:.83 alpha:1]];

	// 3 Add to graph
	[mainGraph addPlot:averageBarPlot toPlotSpace:mainGraph.defaultPlotSpace];
	
	
/*Main Plots*/
	
	CPTGraph *secondGraph = self.SecondHostingView.hostedGraph;
	secondGraph.plotAreaFrame.borderLineStyle = nil;
	secondGraph.title = @"最佳油耗";
	secondGraph.titleDisplacement = CGPointMake(-120.f, -20.f);

//	self.secondHostingView.backgroundColor = [UIColor greenColor];
/*Least Consume Bar Plot*/
	// 1 Set up
	CPTBarPlot *leastBarPlot = [CPTBarPlot tubularBarPlotWithColor:[CPTColor redColor] horizontalBars:NO];
	leastBarPlot.identifier = LCConsumeLeastConsume;
	leastBarPlot.dataSource = self.provider;
	
	// 2 Set up line style
	CPTMutableLineStyle *leastLineStyle = [CPTMutableLineStyle lineStyle];
	leastLineStyle.lineColor = [CPTColor lightGrayColor];
	leastLineStyle.lineWidth = 0.5f;
	leastBarPlot.lineStyle = leastLineStyle;
	
	leastBarPlot.barWidth = CPTDecimalFromDouble(CPDBarWidth);
	leastBarPlot.barOffset = CPTDecimalFromDouble(CPDBarInitialX);
	leastBarPlot.fill = [CPTFill fillWithColor:[CPTColor colorWithComponentRed:1 green:.3 blue:.153 alpha:1]];

	// 3 Add plot to graph
	[secondGraph addPlot:leastBarPlot toPlotSpace:secondGraph.defaultPlotSpace];
}

@end
