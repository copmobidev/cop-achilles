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
    return 85;
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
	UIImage *iconImage = [UIImage imageNamed:[dict objectForKey:@"icon"]];
	
	[cell.icon setImage:iconImage];
	CGRect oldIconFrame = cell.icon.frame;
	cell.icon.frame = CGRectMake(oldIconFrame.origin.x, oldIconFrame.origin.y, iconImage.size.width / 1.5, iconImage.size.height / 1.5);
	
	[cell.title setText:[dict objectForKey:@"title"]];
	
	cell.statusView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png", [dict objectForKey:@"status"]]];
	CGRect oldStatusFrame = cell.statusView.frame;
	cell.statusView.frame = CGRectMake(oldStatusFrame.origin.x, oldStatusFrame.origin.y, oldStatusFrame.size.width / 1.5, oldStatusFrame.size.height / 1.5);
	
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	
    return cell;
}

#pragma mark - Table view delegate

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
	piePlot.pieInnerRadius = 20.f;
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
