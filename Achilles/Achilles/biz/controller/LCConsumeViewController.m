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

	// 3 Add to graph
	CPTGraph *mainGraph = self.MainHostingView.hostedGraph;
	[mainGraph addPlot:averageBarPlot toPlotSpace:mainGraph.defaultPlotSpace];
	
	/*Least Consume Bar Plot*/
	// 1 Set up
	CPTBarPlot *leastBarPlot = [CPTBarPlot tubularBarPlotWithColor:[CPTColor redColor] horizontalBars:NO];
	leastBarPlot.identifier = LCConsumeLeastConsume;
	leastBarPlot.dataSource = self.provider;
//	leastBarPlot.opacity = 0.3;
	
	// 2 Set up line style
	CPTMutableLineStyle *leastLineStyle = [CPTMutableLineStyle lineStyle];
	leastLineStyle.lineColor = [CPTColor lightGrayColor];
	leastLineStyle.lineWidth = 0.5f;
	leastBarPlot.lineStyle = leastLineStyle;
	
	leastBarPlot.barWidth = CPTDecimalFromDouble(CPDBarWidth);
	leastBarPlot.barOffset = CPTDecimalFromDouble(CPDBarInitialX * 2);
	
	// 3 Add plot to graph
	[mainGraph addPlot:leastBarPlot toPlotSpace:mainGraph.defaultPlotSpace];
}

@end
