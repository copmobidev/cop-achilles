//
//  SecondTopViewController.m
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 1/23/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import "LCRouteViewController.h"

@implementation LCRouteViewController

#pragma mark - UIViewController

- (void)viewDidLoad {
	[super viewDidLoad];
}

#pragma mark - BizPlotDelegate

- (void)configurePlots {
	/*Main Plots*/
	
/*Speed Bar Plot*/
	// 1 Set up
	CPTBarPlot *speedBarPlot = [CPTBarPlot tubularBarPlotWithColor:[CPTColor greenColor] horizontalBars:NO];
	speedBarPlot.identifier = CPDTickerSymbolSpeed;//设定该barplot的id，方便后面使用
	speedBarPlot.dataSource = self.provider;
	//	self.speedBarPlot.delegate = self.provider; //**
	// 2 Set up line style & barWidth &baroffset
	CPTMutableLineStyle *speedBarLineStyle = [CPTMutableLineStyle lineStyle];
	speedBarLineStyle.lineColor = [CPTColor lightGrayColor];
	speedBarLineStyle.lineWidth = 0.5;
	speedBarPlot.lineStyle = speedBarLineStyle;
	speedBarPlot.barWidth = CPTDecimalFromDouble(CPDBarWidth);
	speedBarPlot.barOffset = CPTDecimalFromDouble(CPDBarInitialX);
	// 3 Add to graph
	CPTGraph *mainGraph = self.MainHostingView.hostedGraph;
	[mainGraph addPlot:speedBarPlot toPlotSpace:mainGraph.defaultPlotSpace];
	
/*Oil Scatter Plot*/
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
	
/*Time Pie Plot*/
	// 1 Set up
	CPTPieChart *piePlot = [[CPTPieChart alloc] init];
	piePlot.identifier = CPDTickerSymbolTime;
	piePlot.centerAnchor = CGPointMake(0.5, 0.5);
	piePlot.pieRadius = 40.f;
	piePlot.pieInnerRadius = 25.f;
	piePlot.startAngle = M_PI_4;
	piePlot.sliceDirection = CPTPieDirectionClockwise;
	piePlot.dataSource = self.provider;
	//	piePlot.delegate = self.provider;
	
	//pie data lazy load
	
	// 2 Set up linestyle
	CPTMutableTextStyle * pieTextStyle = [CPTMutableTextStyle textStyle];
	pieTextStyle.color = [CPTColor blackColor];
	pieTextStyle.fontName = @"Helvetica-Bold";
	pieTextStyle.fontSize = 16.0f;
	// 3 Add pie chart to graph
	CPTGraph *pieGraph = self.PieHostingView.hostedGraph;
	[pieGraph addPlot:piePlot];
	// 4 Pie chart title
	NSString *title = @"堵车指数";
	pieGraph.title = title;
	pieGraph.titleTextStyle = pieTextStyle;
	pieGraph.titlePlotAreaFrameAnchor = CPTRectAnchorTop;
}

@end
