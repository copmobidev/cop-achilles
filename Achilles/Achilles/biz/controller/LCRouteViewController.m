//
//  SecondTopViewController.m
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 1/23/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import "LCRouteViewController.h"
#import "CPDStockPriceStore.h"
#import "CPDConstants.h"

@implementation LCRouteViewController

#pragma mark - UIViewController methods

CGFloat const CPDBarWidth = 0.25f;
CGFloat const CPDBarInitialX = 0.25f;

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
  
  if (![self.slidingViewController.underLeftViewController isKindOfClass:[LCMenuViewController class]]) {
    self.slidingViewController.underLeftViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
  }
  self.slidingViewController.underRightViewController = nil;
  
  [self.view addGestureRecognizer:self.slidingViewController.panGesture];
}

- (IBAction)revealMenu:(id)sender {
  [self.slidingViewController anchorTopViewTo:ECRight];
}

#pragma mark - UIViewController

- (void)viewDidUnload {
    [self setMainHostingView:nil];
    [self setPieHostingView:nil];
    [super viewDidUnload];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	[self initPlot];
}

#pragma mark - CPTPlotDataSource
- (NSUInteger)numberOfRecordsForPlot:(CPTPlot *)plot {
	return [[[CPDStockPriceStore sharedInstance] datesInWeek] count];
}

- (NSNumber *)numberForPlot:(CPTPlot *)plot field:(NSUInteger)fieldEnum recordIndex:(NSUInteger)index {
	if ((fieldEnum == CPTBarPlotFieldBarTip) && (index < [[[CPDStockPriceStore sharedInstance] datesInWeek] count])) {
		if ([plot.identifier isEqual:CPDTickerSymbolSpeed]) {
			return [[[CPDStockPriceStore sharedInstance] weeklyPrices:CPDTickerSymbolSpeed] objectAtIndex:index];
		} else if ([plot.identifier isEqual:CPDTickerSymbolOil]) {
			return [[[CPDStockPriceStore sharedInstance] weeklyPrices:CPDTickerSymbolOil] objectAtIndex:index];
		} else if ([plot.identifier isEqual:CPDTickerSymbolTime]) {
			return [[[CPDStockPriceStore sharedInstance] weeklyPrices:CPDTickerSymbolTime] objectAtIndex:index];
		}
	}
	
	if (fieldEnum == CPTBarPlotFieldBarLocation)
	return [NSDecimalNumber numberWithUnsignedInteger:index];
	
	return [NSDecimalNumber zero];
}

#pragma mark - Chart behavior

- (void)initPlot {
	[self configureHostingView];
	[self configureGraph];
	[self configurePlots];
	[self configureAxes];
}

- (void)configureHostingView {
	self.MainHostingView.allowPinchScaling = NO;
	self.PieHostingView.allowPinchScaling = NO;
}

- (void)configureGraph {
	/*Main graph*/	
	// 1 - Create the graph & add it to hosting view
	CPTGraph *graph = [[CPTXYGraph alloc] initWithFrame:self.MainHostingView.bounds];
	graph.plotAreaFrame.masksToBorder = NO;//**
	self.MainHostingView.hostedGraph = graph;
	// 2 - Configure the graph (theme & padding)
	[graph applyTheme:[CPTTheme themeNamed:kCPTPlainWhiteTheme]];
	graph.paddingBottom = 30.0f;
	graph.paddingLeft = 30.0f;
	graph.paddingTop = -1.0f;
	graph.paddingRight = -0.5f;
	// 3 - Set up the styles
	CPTMutableTextStyle *titleStyle = [CPTMutableTextStyle textStyle];
	titleStyle.color = [CPTColor whiteColor];
	titleStyle.fontName = @"Helvetica-Bold";
	titleStyle.fontSize = 12.0f;
	// 4 - Set up title
	NSString *title = @"行程信息";
	graph.title = title;
	graph.titleTextStyle = titleStyle;
	graph.titlePlotAreaFrameAnchor = CPTRectAnchorTop;
	graph.titleDisplacement = CGPointMake(0.0f, -16.0f);
	// 5 - Set up plot space (with xmin xmax ymin ymax)
	CGFloat xMin = 0.0f;
	CGFloat xMax = [[[CPDStockPriceStore sharedInstance] datesInWeek] count];
	CGFloat yMin = 0.0f;
	CGFloat yMax = 800.0f; // should determine dynamically based on max price
	CPTXYPlotSpace *plotSpace = (CPTXYPlotSpace *) graph.defaultPlotSpace;
	plotSpace.xRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromFloat(xMin) length:CPTDecimalFromFloat(xMax)];
	plotSpace.yRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromFloat(yMin) length:CPTDecimalFromFloat(yMax)];
	plotSpace.allowsUserInteraction = NO;
	
	/*Pie graph*/
	// 1 - add graph
	CPTXYGraph *pieGraph  = [[CPTXYGraph alloc] initWithFrame:self.PieHostingView.bounds];
	self.PieHostingView.hostedGraph = pieGraph;
	CPTTheme *theme = [CPTTheme themeNamed:kCPTPlainWhiteTheme];
	[pieGraph applyTheme:theme];
	//border line style must after theme setting.
	pieGraph.plotAreaFrame.borderLineStyle = nil;
	pieGraph.axisSet = nil;
	pieGraph.fill = [CPTFill fillWithColor:[CPTColor clearColor]];
	pieGraph.plotAreaFrame.fill = [CPTFill fillWithColor:[CPTColor clearColor]];
}

- (void)configurePlots {
	/*Main Plots*/
	// 1 Set up the three plots
	self.speedBarPlot = [CPTBarPlot tubularBarPlotWithColor:[CPTColor greenColor] horizontalBars:NO];
	self.speedBarPlot.identifier = CPDTickerSymbolSpeed;
	self.speedBarPlot.dataSource = self;
	self.speedBarPlot.delegate = self;

	self.oilScatterPlot = [[CPTScatterPlot alloc] init];
	self.oilScatterPlot.identifier  = CPDTickerSymbolOil;
	self.oilScatterPlot.dataSource = self;
	self.oilScatterPlot.delegate = self;

	// 2 Set up line style
	CPTMutableLineStyle *barLineStyle = [[CPTMutableLineStyle alloc] init];
	barLineStyle.lineColor = [CPTColor lightGrayColor];
	barLineStyle.lineWidth = 0.5;
	
	
	CPTMutableLineStyle *scatterLineStyle = [self.oilScatterPlot.dataLineStyle mutableCopy];
	scatterLineStyle.lineWidth = 2.5f;
	scatterLineStyle.lineColor = [CPTColor redColor];
	self.oilScatterPlot.dataLineStyle = scatterLineStyle;
	CPTMutableLineStyle *scatterSymbolLineStyle = [CPTMutableLineStyle lineStyle];
	scatterSymbolLineStyle.lineColor = [CPTColor redColor];
	CPTPlotSymbol *oilSymbol = [CPTPlotSymbol ellipsePlotSymbol];
	oilSymbol.fill = [CPTFill fillWithColor:[CPTColor redColor]];
	oilSymbol.lineStyle = scatterSymbolLineStyle;
	oilSymbol.size = CGSizeMake(6.0f, 6.0f);
	self.oilScatterPlot.plotSymbol = oilSymbol;
	
	// 3 - Add plots to graph
	CPTGraph *graph = self.MainHostingView.hostedGraph;
	
	self.speedBarPlot.barWidth = CPTDecimalFromDouble(CPDBarWidth);
	self.speedBarPlot.barOffset = CPTDecimalFromDouble(CPDBarInitialX);
	self.speedBarPlot.lineStyle = barLineStyle;
	[graph addPlot:self.speedBarPlot toPlotSpace:graph.defaultPlotSpace];
	
	[graph addPlot:self.oilScatterPlot toPlotSpace:graph.defaultPlotSpace];
	
	/*Pie Plots*/
	CPTMutableTextStyle *textStyle = [CPTMutableTextStyle textStyle];
	textStyle.color = [CPTColor blackColor];
	textStyle.fontName = @"Helvetica-Bold";
	textStyle.fontSize = 16.0f;
	//setup the pie chart
	CPTPieChart *piePlot = [[CPTPieChart alloc] init];
	piePlot.dataSource = self;
	piePlot.centerAnchor = CGPointMake(0.5, 0.5);
	piePlot.pieRadius = 40.0f;
	
	piePlot.identifier = @"PieChart";
	piePlot.startAngle = M_PI_4;
	piePlot.sliceDirection = CPTPieDirectionClockwise;
	
	//load data for pie chart ,lazy load
	
	CPTGraph *pieGraph = self.PieHostingView.hostedGraph;
	[pieGraph addPlot:piePlot];
	
	NSString *title = @"堵车指数";
	pieGraph.title = title;
	pieGraph.titleTextStyle = textStyle;
	pieGraph.titlePlotAreaFrameAnchor = CPTRectAnchorTop;	
}

- (void)configureAxes {
	/*Main axes*/
	// 1 - Configure styles
	CPTMutableTextStyle *axisTitleStyle = [CPTMutableTextStyle textStyle];
	axisTitleStyle.color = [CPTColor whiteColor];
	axisTitleStyle.fontName = @"Helvetica-Bold";
	axisTitleStyle.fontSize = 12.0f;
	CPTMutableLineStyle *axisLineStyle = [CPTMutableLineStyle lineStyle];
	axisLineStyle.lineWidth = 2.0f;
	axisLineStyle.lineColor = [[CPTColor whiteColor] colorWithAlphaComponent:1];
	// 2 - Get the graph's axis set
	CPTXYAxisSet *axisSet = (CPTXYAxisSet *) self.MainHostingView.hostedGraph.axisSet;
	// 3 - Configure the x-axis
	axisSet.xAxis.labelingPolicy = CPTAxisLabelingPolicyNone;
	axisSet.xAxis.title = @"Days of Week (Mon - Fri)";
	axisSet.xAxis.titleTextStyle = axisTitleStyle;
	axisSet.xAxis.titleOffset = 10.0f;
	axisSet.xAxis.axisLineStyle = axisLineStyle;
	// 4 - Configure the y-axis
	axisSet.yAxis.labelingPolicy = CPTAxisLabelingPolicyNone;
	axisSet.yAxis.title = @"Price";
	axisSet.yAxis.titleTextStyle = axisTitleStyle;
	axisSet.yAxis.titleOffset = 5.0f;
	axisSet.yAxis.axisLineStyle = axisLineStyle;
	
	/*Pie axes*/
	
}

#pragma mark - CPTPieChartDataSource



@end
