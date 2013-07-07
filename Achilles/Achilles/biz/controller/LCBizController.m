//
//  LCBizController.m
//  Achilles
//
//  Created by weiyanen on 13-5-18.
//  Copyright (c) 2013年 cop-studio. All rights reserved.
//

#import "LCBizController.h"
#import "CPDStockPriceStore.h"

@interface LCBizController ()

@end

@implementation LCBizController


#pragma mark - IBAction

- (IBAction)revealMenu:(id)sender {
	[self.slidingViewController anchorTopViewTo:ECRight];
}

#pragma mark - UIViewController

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	
	if (![self.slidingViewController.underLeftViewController isKindOfClass:[LCMenuViewController class]]) {
		self.slidingViewController.underLeftViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
	}
	self.slidingViewController.underRightViewController = nil;
	
	[self.view addGestureRecognizer:self.slidingViewController.panGesture];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
	[self initPlot];
}

#pragma mark - BizPlotDelegate

- (void)initPlot {
	[self configureHostingView];
	[self configureGraph];
	[self configurePlots];
	[self configureAxes];
}

- (void)configureHostingView {
	self.MainHostingView.allowPinchScaling = NO;
	self.PieHostingView.allowPinchScaling = NO;
	self.SecondHostingView.allowPinchScaling = NO;
}

- (void)configureGraph {
/*Main graph*/
	// 1 - Create the graph & add it to hosting view
	CPTGraph *mainGraph = [[CPTXYGraph alloc] initWithFrame:self.MainHostingView.bounds];
	mainGraph.plotAreaFrame.masksToBorder = NO;//**
	self.MainHostingView.hostedGraph = mainGraph;
	
	// 2 - Configure the graph (theme & padding)
	[mainGraph applyTheme:[CPTTheme themeNamed:kCPTPlainWhiteTheme]];
	mainGraph.paddingBottom = 0.0f;
	mainGraph.paddingLeft = 0.0f;
	mainGraph.paddingTop = 0.0f;
	mainGraph.paddingRight = 0.0f;
	mainGraph.axisSet = nil;
	mainGraph.fill = [CPTFill fillWithColor:[CPTColor clearColor]];
	mainGraph.plotAreaFrame.fill = [CPTFill fillWithColor:[CPTColor clearColor]];
	
	// 3 - Set up the styles
	CPTMutableTextStyle *titleStyle = [CPTMutableTextStyle textStyle];
	titleStyle.color = [CPTColor whiteColor];
	titleStyle.fontName = @"Helvetica-Bold";
	titleStyle.fontSize = 12.0f;
	// 4 - Set up title
	NSString *title = @"标题信息";
	mainGraph.title = title;
	mainGraph.titleTextStyle = titleStyle;
	mainGraph.titlePlotAreaFrameAnchor = CPTRectAnchorTop;
	mainGraph.titleDisplacement = CGPointMake(0.0f, -16.0f);
	// 5 - Set up plot space (with xmin xmax ymin ymax)
	CGFloat xMin = 0.0f;
	CGFloat xMax = [[[CPDStockPriceStore sharedInstance] datesInWeek] count];
	CGFloat yMin = 0.0f;
	CGFloat yMax = 700.0f; // should determine dynamically based on max price
	CPTXYPlotSpace *plotSpace = (CPTXYPlotSpace *) mainGraph.defaultPlotSpace;
	plotSpace.xRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromFloat(xMin) length:CPTDecimalFromFloat(xMax)];
	plotSpace.yRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromFloat(yMin) length:CPTDecimalFromFloat(yMax)];
	plotSpace.allowsUserInteraction = NO;

/*Second graph*/
	// 1 - Create the graph & add it to hosting view
	CPTGraph *secondGraph = [[CPTXYGraph alloc] initWithFrame:self.SecondHostingView.bounds];
	secondGraph.plotAreaFrame.masksToBorder = NO;//**
	self.SecondHostingView.hostedGraph = secondGraph;
	
	// 2 - Configure the graph (theme & padding)
	[secondGraph applyTheme:[CPTTheme themeNamed:kCPTPlainWhiteTheme]];
	secondGraph.paddingBottom = 0.0f;
	secondGraph.paddingLeft = 0.0f;
	secondGraph.paddingTop = 0.0f;
	secondGraph.paddingRight = 0.0f;
	secondGraph.axisSet = nil;
	secondGraph.fill = [CPTFill fillWithColor:[CPTColor clearColor]];
	secondGraph.plotAreaFrame.fill = [CPTFill fillWithColor:[CPTColor clearColor]];
	
	// 3 - Set up the styles
	
	// 4 - Set up title
	NSString *title2 = @"标题信息";
	secondGraph.title = title2;
	secondGraph.titleTextStyle = titleStyle;
	secondGraph.titlePlotAreaFrameAnchor = CPTRectAnchorTop;
	secondGraph.titleDisplacement = CGPointMake(0.0f, -16.0f);
	
	// 5 - Set up plot space (with xmin xmax ymin ymax)
		CPTXYPlotSpace *plotSpace2 = (CPTXYPlotSpace *) secondGraph.defaultPlotSpace;
	plotSpace2.xRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromFloat(xMin) length:CPTDecimalFromFloat(xMax)];
	plotSpace2.yRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromFloat(yMin) length:CPTDecimalFromFloat(yMax)];
	plotSpace2.allowsUserInteraction = NO;

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
	
}

- (void)configureAxes {
/*Main axes*/
	// 1 - Configure styles
	CPTMutableTextStyle *axisTitleStyle = [CPTMutableTextStyle textStyle];
	axisTitleStyle.color = [CPTColor blackColor];
	axisTitleStyle.fontName = @"Helvetica";
	axisTitleStyle.fontSize = 14.0f;
	
	CPTMutableLineStyle *axisLineStyle = [CPTMutableLineStyle lineStyle];
	axisLineStyle.lineWidth = 1.0f;
	axisLineStyle.lineColor = [[CPTColor whiteColor] colorWithAlphaComponent:1];
	
	// 2 - Get the graph's axis set
	CPTXYAxisSet *axisSet = (CPTXYAxisSet *) self.MainHostingView.hostedGraph.axisSet;
	
	// 3 - Configure the x-axis
	axisSet.xAxis.labelingPolicy = CPTAxisLabelingPolicyEqualDivisions;
	axisSet.xAxis.title = @"Days of Week (Mon - Fri)";
	axisSet.xAxis.titleTextStyle = axisTitleStyle;
	axisSet.xAxis.titleOffset = 1.0f;
	axisSet.xAxis.axisLineStyle = axisLineStyle;
	
	// 4 - Configure the y-axis
	axisSet.yAxis.labelingPolicy = CPTAxisLabelingPolicyEqualDivisions;
	axisSet.yAxis.title = @"Price";
	axisSet.yAxis.titleTextStyle = axisTitleStyle;
	axisSet.yAxis.titleOffset = 1.0f;
	axisSet.yAxis.axisLineStyle = axisLineStyle;

/*Second axes*/
	// 1 - Configure styles
	
	// 2 - Get the graph's axis set
	CPTXYAxisSet *axisSet2 = (CPTXYAxisSet *) self.SecondHostingView.hostedGraph.axisSet;

	// 3 - Configure the x-axis
	axisSet2.xAxis.labelingPolicy = CPTAxisLabelingPolicyEqualDivisions;
	axisSet2.xAxis.title = @"Days of Week (Mon - Fri)";
	axisSet2.xAxis.titleTextStyle = axisTitleStyle;
	axisSet2.xAxis.titleOffset = 1.0f;
	axisSet2.xAxis.axisLineStyle = axisLineStyle;
	
	// 4 - Configure the y-axis
	axisSet2.yAxis.labelingPolicy = CPTAxisLabelingPolicyEqualDivisions;
	axisSet2.yAxis.title = @"Price";
	axisSet2.yAxis.titleTextStyle = axisTitleStyle;
	axisSet2.yAxis.titleOffset = 1.0f;
	axisSet2.yAxis.axisLineStyle = axisLineStyle;

/*Pie axes*/
}

#pragma mark - Provider for Plot DataSource

- (LCPlotProvider *)provider {
	if (!_provider) {
		_provider = [[LCPlotProvider alloc] init];
	}
	return _provider;
}
					 
@end
