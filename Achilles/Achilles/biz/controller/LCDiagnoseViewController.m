//
//  LCDiagnoseViewController.m
//  Achilles
//
//  Created by weiyanen on 13-5-19.
//  Copyright (c) 2013年 cop-studio. All rights reserved.
//

#import "LCDiagnoseViewController.h"
#import "LCDiagnoseDetailViewController.h"
#import "LCHelpViewController.h"


@interface LCDiagnoseViewController ()

@end

@implementation LCDiagnoseViewController

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

- (IBAction)revealMenu:(id)sender
{
	[self.slidingViewController anchorTopViewTo:ECRight];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
//    UIImage *image = [UIImage imageNamed:@"bg_texture.png"];
//    self.view.layer.contents = (id)image.CGImage;
    self.diagnoseTableView.sectionFooterHeight = 0;
    self.diagnoseTableView.sectionHeaderHeight = 0;
    [self.diagnoseTableView setDataSource:self];
    [self.diagnoseTableView setDelegate:self];
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"diagnose" ofType:@"plist"];
    _diagnoseItems = [[NSMutableArray alloc] initWithContentsOfFile:path];
}


#pragma mark - UITableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_diagnoseItems count];
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"LCDiagnoseCell";
    LCDiagnoseCell *cell = (LCDiagnoseCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:CellIdentifier
                                              owner:self
                                            options:nil] objectAtIndex:0];
    }
    
    NSDictionary* dict = [_diagnoseItems objectAtIndex:indexPath.row];
	//    UIImage* greenBody = [UIImage imageNamed:@"green_body.png"];
	//    UIImage* bgImg =[greenBody stretchableImageWithLeftCapWidth:0 topCapHeight:0];
	//    cell.layer.contents = (id)bgImg.CGImage;
    [cell.icon setImage:[UIImage imageNamed:[dict objectForKey:@"icon"]]];
    [cell.title setText:[dict objectForKey:@"title"]];
	cell.statusView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png", [dict objectForKey:@"status"]]];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	
    return cell;
}

#pragma mark - Table view delegate

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // Navigation logic may go here. Create and push another view controller.
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//	UIViewController *diagnoseDetailViewController = [[UIViewController alloc] init];
//	[self presentModalViewController:diagnoseDetailViewController animated:YES];
//}


- (IBAction)diagnose:(id)sender
{
    
}

#pragma mark - Table view delegate

- (void)viewDidUnload {
	[self setPieHostingView:nil];
	[super viewDidUnload];
}

#pragma mark - plot

- (void)configurePlots {
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
	
	// 2 Set up linestyle
	CPTMutableTextStyle * pieTextStyle = [CPTMutableTextStyle textStyle];
	pieTextStyle.color = [CPTColor blackColor];
	pieTextStyle.fontName = @"Helvetica-Bold";
	pieTextStyle.fontSize = 16.0f;
	// 3 Add pie chart to graph
	CPTGraph *pieGraph = self.PieHostingView.hostedGraph;
	[pieGraph addPlot:piePlot];
	// 4 Pie chart title
	NSString *title = nil;
	pieGraph.title = title;
	pieGraph.titleTextStyle = pieTextStyle;
	pieGraph.titlePlotAreaFrameAnchor = CPTRectAnchorTop;
}
@end
