//
//  LCBatteryViewController.m
//  Achilles
//
//  Created by weiyanen on 13-7-14.
//  Copyright (c) 2013年 cop-studio. All rights reserved.
//

#import "LCBatteryViewController.h"

@interface LCBatteryViewController ()

@end

@implementation LCBatteryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
//    [super viewDidLoad];// avoid gesture
	[self initPlot];
}

- (void)viewWillAppear:(BOOL)animated {
	if (!IS_HEIGHT_GTE_568) {
		CGRect frame = self.canvasView.frame;
		frame.origin = CGPointMake(0, -100);
		self.canvasView.frame = frame;
	}
	self.view.transform = CGAffineTransformMakeRotation(M_PI_2);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back:(id)sender {
	[self dismissViewControllerAnimated:YES completion:Nil];
}

#pragma mark - BizPlotDelegate

- (void)configurePlots {
/*Main Plots*/
	CPTGraph *mainGraph = self.MainHostingView.hostedGraph;
	
/*Battery Scatter Plot*/
	// 1 Set up
	CPTScatterPlot *batteryScatterPlot = [[CPTScatterPlot alloc] init];
	batteryScatterPlot.identifier = CPDTickerSymbolOil;
	batteryScatterPlot.dataSource = self.provider;
	// 2 Set up line style
	CPTMutableLineStyle *scatterLineStyle = [CPTMutableLineStyle lineStyle];
	scatterLineStyle.lineWidth = 2.5f;
	scatterLineStyle.lineColor = [CPTColor greenColor];
	batteryScatterPlot.dataLineStyle = scatterLineStyle;
	
	CPTMutableLineStyle *scatterSymbolLineStyle = [CPTMutableLineStyle lineStyle];
	scatterSymbolLineStyle.lineColor = [CPTColor greenColor];
	CPTPlotSymbol *batterySymbol = [CPTPlotSymbol ellipsePlotSymbol];
	batterySymbol.fill = [CPTFill fillWithColor:[CPTColor greenColor]];
	batterySymbol.lineStyle = scatterSymbolLineStyle;
	batterySymbol.size = CGSizeMake(1.0f, 1.0f);
	batteryScatterPlot.plotSymbol = batterySymbol;
	// 3 Add plot to graph
	[mainGraph addPlot:batteryScatterPlot toPlotSpace:mainGraph.defaultPlotSpace];
	mainGraph.plotAreaFrame.borderLineStyle = nil;
	mainGraph.title = nil;
}

- (void)viewDidUnload {
	[self setCanvasView:nil];
	[super viewDidUnload];
}
@end
