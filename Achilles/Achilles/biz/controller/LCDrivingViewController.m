//
//  ThirdTopViewController.m
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 1/23/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import "LCDrivingViewController.h"

@implementation LCDrivingViewController

#pragma mark - UIViewController

- (void)awakeFromNib
{
  [[NSNotificationCenter defaultCenter] addObserver:self 
                                           selector:@selector(underLeftWillAppear:)
                                               name:ECSlidingViewUnderLeftWillAppear 
                                             object:self.slidingViewController];
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(topDidAnchorRight:) 
                                               name:ECSlidingViewTopDidAnchorRight 
                                             object:self.slidingViewController];
  
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(underRightWillAppear:) 
                                               name:ECSlidingViewUnderRightWillAppear 
                                             object:self.slidingViewController];
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(topDidAnchorLeft:) 
                                               name:ECSlidingViewTopDidAnchorLeft 
                                             object:self.slidingViewController];
  
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(topDidReset:) 
                                               name:ECSlidingViewTopDidReset 
                                             object:self.slidingViewController];
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	self.slidingViewController.isGestureHandicapped = YES;
}

#pragma mark - SlidingViewController Notification
// slidingViewController notification
- (void)underLeftWillAppear:(NSNotification *)notification
{
  NSLog(@"under left will appear");
}

- (void)topDidAnchorRight:(NSNotification *)notification
{
  NSLog(@"top did anchor right");
}

- (void)underRightWillAppear:(NSNotification *)notification
{
  NSLog(@"under right will appear");
}

- (void)topDidAnchorLeft:(NSNotification *)notification
{
  NSLog(@"top did anchor left");
}

- (void)topDidReset:(NSNotification *)notification
{
  NSLog(@"top did reset");
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
	speedBarPlot.fill = [CPTFill fillWithColor:[CPTColor colorWithComponentRed:0 green:.61 blue:.913 alpha:1]];
	speedBarPlot.barWidth = CPTDecimalFromDouble(CPDBarWidth);
	speedBarPlot.barOffset = CPTDecimalFromDouble(CPDBarInitialX);
	// 3 Add to graph
	CPTGraph *mainGraph = self.MainHostingView.hostedGraph;
	[mainGraph addPlot:speedBarPlot toPlotSpace:mainGraph.defaultPlotSpace];
	mainGraph.plotAreaFrame.borderLineStyle = nil;
	mainGraph.titleDisplacement = CGPointMake(0.0f, 10.0f);
	mainGraph.title = @"节油积分:14503分";
	
/*Time Pie Plot*/
	// 1 Set up
	CPTPieChart *piePlot = [[CPTPieChart alloc] init];
	piePlot.identifier = CPDTickerSymbolTime;
	piePlot.centerAnchor = CGPointMake(0.5, 0.5);
	piePlot.pieRadius = 35.f;
	piePlot.pieInnerRadius = 27.f;
	piePlot.startAngle = M_PI_4;
	piePlot.sliceDirection = CPTPieDirectionClockwise;
	piePlot.dataSource = self.provider;
	//	piePlot.delegate = self.provider;
		
	// 2 Set up linestyle
	CPTMutableTextStyle * pieTextStyle = [CPTMutableTextStyle textStyle];
	pieTextStyle.color = [CPTColor blackColor];
	pieTextStyle.fontName = @"Helvetica-Bold";
	pieTextStyle.fontSize = 16.0f;
	// 3 Add pie chart to graph
	CPTGraph *pieGraph = self.PieHostingView.hostedGraph;
	[pieGraph addPlot:piePlot];
	// 4 Pie chart title
//	NSString *title = @"堵车指数";
	pieGraph.title = nil; // title;
	pieGraph.titleTextStyle = pieTextStyle;
	pieGraph.titlePlotAreaFrameAnchor = CPTRectAnchorTop;
}

@end
