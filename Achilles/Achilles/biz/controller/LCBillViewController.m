//
//  LCBillViewController.m
//  Achilles
//
//  Created by weiyanen on 13-5-19.
//  Copyright (c) 2013年 cop-studio. All rights reserved.
//

#import "LCBillViewController.h"

@interface LCBillViewController ()

@end

@implementation LCBillViewController

#pragma mark - UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self configureTableView];
	[self.billTableView reloadData];
}

- (void)configureTableView {
	self.billTableView.dataSource = self.tableProvider;
	self.billTableView.delegate = self.tableProvider;
	self.billTableView.sectionHeaderHeight = 0;
	self.billTableView.sectionFooterHeight = 0;
	[self.tableProvider initProvider];
	self.tableProvider.billTableView = self.billTableView;
}

- (LCTableProvider *)tableProvider {
	if (!_tableProvider) {
		_tableProvider = [[LCTableProvider alloc] init];
	}
	return _tableProvider;
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
}

@end
