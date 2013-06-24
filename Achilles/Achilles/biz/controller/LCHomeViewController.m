//
//  FirstTopViewController.m
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 1/23/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import "LCHomeViewController.h"
#import "LCRegisterController.h"
#import "LCStore.h"
#import "LCEnvironment.h"
#import "LCNotificationCell.h"

@implementation LCHomeViewController

- (void)configScrollView {
	
	self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.backgroundView.frame.size.height + self.barView.frame.size.height + self.tableView.frame.size.height);
	self.scrollView.bounces = NO;
	if (IS_HEIGHT_GTE_568) {
		CGRect frame = self.scrollView.frame;
		frame.size.height = self.view.frame.size.height;
		self.scrollView.frame = frame;
	}
	NSLog(@"%f==", self.scrollView.frame.size.height);
}

- (void)resizeTableViewFrameHeight
{
    // Table view does not scroll, so its frame height should be equal to its contentSize height
    CGRect frame = self.tableView.frame;
	frame.size.height = self.tableView.contentSize.height;
	self.tableView.frame = frame;
}


- (void)configTableView {
	self.tableView.dataSource = self;
	self.tableView.delegate = self;
	[self.tableView reloadData];
	[self resizeTableViewFrameHeight];
}

- (void)viewDidLoad {
	[self configTableView];
	[self configScrollView];
	
	//0. add subview of bow view
	self.bowView = [[UIView alloc] initWithFrame:CGRectMake(120, 170 - 44, 80, 50)];
	self.bowView.backgroundColor = [UIColor blackColor];
	[self.scrollView insertSubview:self.bowView aboveSubview:self.backgroundView];
	
	//1. add subview of CPTGraphHostingView
	CGRect bounds = [[UIScreen mainScreen] bounds];
	CGFloat availableHeight = bounds.size.height - 44;
	self.hostingView = [[CPTGraphHostingView alloc] initWithFrame:CGRectMake(bounds.origin.x, bounds.origin.y, bounds.size.width, availableHeight * 0.5)];
//	self.hostingView.backgroundColor = [UIColor greenColor];
	[self.scrollView insertSubview:self.hostingView aboveSubview:self.bowView];
//	[self.scrollView addSubview:self.hostingView];
	
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
	textStyle.color = [CPTColor whiteColor];
	textStyle.fontName = @"Helvetica-Bold";
	textStyle.fontSize = 18.0f;
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
	
	NSString *title = @"2013/04";
	self.graph.title = title;
	self.graph.titleTextStyle = textStyle;
	self.graph.titlePlotAreaFrameAnchor = CPTRectAnchorTop;
//	self.graph.titleDisplacement = CGPointMake(0.0f, -60.0f);
	
	// 1 - Get graph instance
//	CPTGraph *graph = self.graph;
//	// 2 - Create legend
//	CPTLegend *theLegend = [CPTLegend legendWithGraph:graph];
//	// 3 - Configure legend
//	theLegend.numberOfColumns = 1;
//	theLegend.fill = [CPTFill fillWithColor:[CPTColor whiteColor]];
//	theLegend.borderLineStyle = [CPTLineStyle lineStyle];
//	theLegend.cornerRadius = 5.0;
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
//	NSLog(@"deviceid:%@\nuseragent:%@\ntoken:%@\nappversion:%@\ndevicemode:%@\nplatform:%@\nappId:%@\nbundleId:%@",[[LCEnvironment sharedEnvironment] deviceId], [[LCEnvironment sharedEnvironment] userAgent], [[LCEnvironment sharedEnvironment] token], [[LCEnvironment sharedEnvironment] version], [[LCEnvironment sharedEnvironment] deviceModel], [[LCEnvironment sharedEnvironment] platform], [[LCEnvironment sharedEnvironment] appId], [[LCEnvironment sharedEnvironment] bundleId]);
//	return;
	if (![[LCStore sharedInstance] userDefaultObjectForKey:RegisteredInfoKey]) {
		LCRegisterController *registerController = [[LCRegisterController alloc] init];
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

- (IBAction)arrowLeft:(id)sender {
}

- (IBAction)arrowRight:(id)sender {
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
	[self setScrollView:nil];
	[self setBackgroundView:nil];
	[self setTableView:nil];
	[self setBarView:nil];
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

#pragma mark - TableView
const int dataNum = 5;
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return dataNum;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	NSString *cellIdentifier = @"LCNotificationCell";
	LCNotificationCell *cell = (LCNotificationCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	if (cell == nil) {
		cell = [[[NSBundle mainBundle] loadNibNamed:cellIdentifier
											  owner:self
											options:nil] objectAtIndex:0];
	}
	
	if (dataNum == 1) {
		cell.upLine.image = cell.downLine.image = nil;
	} else {
		if (indexPath.row == 0) {
			cell.upLine.image = nil;
			cell.notificationBackgroundView.image = [UIImage imageNamed:@"notification_new_bg.png"];
		} else if (indexPath.row == dataNum - 1) {
			cell.downLine.image = nil;
		}
	}
	
	return cell;
}

@end