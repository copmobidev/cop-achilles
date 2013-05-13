//
//  FirstTopViewController.m
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 1/23/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import "LCHomeViewController.h"
#import "RegisterController.h"
#import "RegisterStatus.h"

@implementation LCHomeViewController

- (void)viewDidLoad {
	//0. add subview of bow view
	self.bowView = [[UIView alloc] initWithFrame:CGRectMake(120, 170, 80, 30)];
	self.bowView.backgroundColor = [UIColor blackColor];
	[self.view addSubview:self.bowView];
	
	//1. add subview of CPTGraphHostingView
	CGRect bounds = [[UIScreen mainScreen] bounds];
	CGFloat availableHeight = bounds.size.height - 44;
	self.hostingView = [[CPTGraphHostingView alloc] initWithFrame:CGRectMake(bounds.origin.x, bounds.origin.y + 44, bounds.size.width, availableHeight * 0.5)];
//	self.hostingView.backgroundColor = [UIColor greenColor];
	[self.view addSubview:self.hostingView];
	
	//span view
	self.spanView.backgroundColor = [UIColor lightGrayColor];
	self.spanView.frame = CGRectMake(bounds.origin.x, bounds.origin.y + 44 + availableHeight * 0.5, bounds.size.width, availableHeight * 0.15);
	//button view
	self.buttonView.frame = CGRectMake(bounds.origin.x, bounds.origin.y + 44 + availableHeight * 0.65, bounds.size.width, availableHeight * 0.35);
	
	//2. add graph
	//setup the graph
	self.graph = [[CPTXYGraph alloc] initWithFrame:self.hostingView.bounds];
	self.hostingView.hostedGraph = self.graph;
	CPTTheme *theme = [CPTTheme themeNamed:kCPTPlainWhiteTheme];
	[self.graph applyTheme:theme];
	//border line style must after theme setting.
	self.graph.plotAreaFrame.borderLineStyle = nil;
	self.graph.axisSet = nil;
	self.graph.fill = [CPTFill fillWithColor:[CPTColor clearColor]];
	self.graph.plotAreaFrame.fill = [CPTFill fillWithColor:[CPTColor clearColor]];
	
	CPTMutableTextStyle *textStyle = [CPTMutableTextStyle textStyle];
	textStyle.color = [CPTColor blackColor];
	textStyle.fontName = @"Helvetica-Bold";
	textStyle.fontSize = 16.0f;
	//setup the Pie Chart
	CPTPieChart* piePlot = [[CPTPieChart alloc] init];
	piePlot.dataSource = self;
	piePlot.centerAnchor = CGPointMake(0.5, 0.5);
	piePlot.pieRadius = 80.0;
	piePlot.pieInnerRadius = 40.0;

	piePlot.identifier =@"PieChart1";
	
	piePlot.startAngle = M_PI_4;
	NSLog(@"%f/%f", piePlot.centerAnchor.x, piePlot.centerAnchor.y);
	piePlot.sliceDirection = CPTPieDirectionCounterClockwise;
	
	//load the data for the Pie Chart,change it to lazy load
	NSLog(@"%f, %f", self.graph.frame.size.width, piePlot.frame.size.width);
	//add the Pie Chart to the graph
	[self.graph addPlot:piePlot];
	
	NSString *title = @"节油等级:10级";
	self.graph.title = title;
	self.graph.titleTextStyle = textStyle;
	self.graph.titlePlotAreaFrameAnchor = CPTRectAnchorTop;
//	self.graph.titleDisplacement = CGPointMake(0.0f, -60.0f);
	
	// 1 - Get graph instance
	CPTGraph *graph = self.graph;
	// 2 - Create legend
	CPTLegend *theLegend = [CPTLegend legendWithGraph:graph];
	// 3 - Configure legend
	theLegend.numberOfColumns = 1;
	theLegend.fill = [CPTFill fillWithColor:[CPTColor whiteColor]];
	theLegend.borderLineStyle = [CPTLineStyle lineStyle];
	theLegend.cornerRadius = 5.0;
}

- (NSMutableArray *)pieData {
	if (!_pieData) {
		_pieData = [NSMutableArray arrayWithObjects:
					[NSNumber numberWithDouble:90.0],
					[NSNumber numberWithDouble:40.0],
					[NSNumber numberWithDouble:60.0], nil];
	}
	return _pieData;
}

- (void)viewDidAppear:(BOOL)animated {
	
	if (![RegisterStatus sharedInstance].isRegisterd) {
		[RegisterStatus sharedInstance].isRegisterd = YES;
		RegisterController *registerController = [[RegisterController alloc] init];
		[self presentModalViewController:registerController animated:NO];
	}	
}

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
  
  // shadowPath, shadowOffset, and rotation is handled by ECSlidingViewController.
  // You just need to set the opacity, radius, and color.
  self.view.layer.shadowOpacity = 0.75f;
  self.view.layer.shadowRadius = 10.0f;
  self.view.layer.shadowColor = [UIColor blackColor].CGColor;

  if (![self.slidingViewController.underLeftViewController isKindOfClass:[LCMenuViewController class]]) {
    self.slidingViewController.underLeftViewController  = [self.storyboard instantiateViewControllerWithIdentifier:@"MenuLeft"];
  }
  
  if (![self.slidingViewController.underRightViewController isKindOfClass:[UnderRightViewController class]]) {
    self.slidingViewController.underRightViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"UnderRight"];
  }
  
  [self.view addGestureRecognizer:self.slidingViewController.panGesture];
	
}

- (IBAction)revealMenu:(id)sender
{
  [self.slidingViewController anchorTopViewTo:ECRight];
}

- (IBAction)revealUnderRight:(id)sender
{
  [self.slidingViewController anchorTopViewTo:ECLeft];
}

- (void)viewDidUnload {
	[self setSpanView:nil];
	[self setButtonView:nil];
	[super viewDidUnload];
}

#pragma CPTPieChartDataSource

- (NSUInteger)numberOfRecordsForPlot:(CPTPlot *)plot {
	return [self.pieData count];
}

- (NSNumber *)numberForPlot:(CPTPlot *)plot field:(NSUInteger)fieldEnum recordIndex:(NSUInteger)idx {
	return [self.pieData objectAtIndex:idx];
}

//- (CPTLayer *)dataLabelForPlot:(CPTPlot *)plot recordIndex:(NSUInteger)idx {
//	float f=((NSNumber*)[self.pieData objectAtIndex:idx]).floatValue;
//	
//	CPTTextLayer *label    = [[CPTTextLayer alloc] initWithText:[NSString stringWithFormat:@"%.1f%%",f]];
//	
//	CPTMutableTextStyle *textStyle =[label.textStyle mutableCopy];
//	
//	textStyle.color = [CPTColor lightGrayColor];
//	
//	label.textStyle = textStyle;
//	
//	
//	return label;
//}

@end