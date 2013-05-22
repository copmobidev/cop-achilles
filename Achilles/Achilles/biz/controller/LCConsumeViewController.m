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
	CPTBarPlot *averageConsumeBarPlot = [CPTBarPlot tubularBarPlotWithColor:[CPTColor greenColor] horizontalBars:NO];
	averageConsumeBarPlot.identifier = LCConsumeAverageConsume;//设定该barplot的id，方便后面使用
	averageConsumeBarPlot.dataSource = self.provider;

	// 2 Set up line style & barWidth &baroffset
	CPTMutableLineStyle *speedBarLineStyle = [CPTMutableLineStyle lineStyle];
	speedBarLineStyle.lineColor = [CPTColor lightGrayColor];
	speedBarLineStyle.lineWidth = 0.5;
	averageConsumeBarPlot.lineStyle = speedBarLineStyle;
	averageConsumeBarPlot.barWidth = CPTDecimalFromDouble(CPDBarWidth);
	averageConsumeBarPlot.barOffset = CPTDecimalFromDouble(CPDBarInitialX);
	// 3 Add to graph
	CPTGraph *mainGraph = self.MainHostingView.hostedGraph;
	[mainGraph addPlot:averageConsumeBarPlot toPlotSpace:mainGraph.defaultPlotSpace];
	
	/*Least Consume Bar Plot*/
	// 1 Set up
	CPTScatterPlot *oilScatterPlot = [[CPTScatterPlot alloc] init];
	oilScatterPlot.identifier = CPDTickerSymbolOil;
	oilScatterPlot.dataSource = self.provider;
	//	self.oilScatterPlot.delegate = self.provider;
	// 2 Set up line style
	CPTMutableLineStyle *scatterLineStyle = [CPTMutableLineStyle lineStyle];
	scatterLineStyle.lineWidth = 2.5f;
	scatterLineStyle.lineColor = [CPTColor redColor];
	oilScatterPlot.dataLineStyle = scatterLineStyle;
	
	CPTMutableLineStyle *scatterSymbolLineStyle = [CPTMutableLineStyle lineStyle];
	scatterSymbolLineStyle.lineColor = [CPTColor redColor];
	CPTPlotSymbol *oilSymbol = [CPTPlotSymbol ellipsePlotSymbol];
	oilSymbol.fill = [CPTFill fillWithColor:[CPTColor redColor]];
	oilSymbol.lineStyle = scatterSymbolLineStyle;
	oilSymbol.size = CGSizeMake(6.0f, 6.0f);
	oilScatterPlot.plotSymbol = oilSymbol;
	// 3 Add plot to graph
	[mainGraph addPlot:oilScatterPlot toPlotSpace:mainGraph.defaultPlotSpace];
}

@end
