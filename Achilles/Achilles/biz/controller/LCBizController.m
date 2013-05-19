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
	NSString *title = @"标题信息";
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
	
}

- (void)configureAxes {
	
}
@end
