//
//  LCPlotProvider.m
//  Achilles
//
//  Created by weiyanen on 13-5-18.
//  Copyright (c) 2013年 cop-studio. All rights reserved.
//

#import "LCPlotProvider.h"
#import "CPDConstants.h"

@implementation LCPlotProvider

/*data提供数据量*/
- (NSUInteger)numberOfRecordsForPlot:(CPTPlot *)plot {
	
	return [self.data count];
}

- (NSNumber *)numberForPlot:(CPTPlot *)plot field:(NSUInteger)fieldEnum recordIndex:(NSUInteger)idx {
	/*For Pie*/
	if ([plot isKindOfClass:[CPTPieChart class]]) {
		//slice width
		if (CPTPieChartFieldSliceWidth == fieldEnum) {
			return [self.data objectAtIndex:idx];
		}
	}
	/*For Bar*/
	else if ([plot isKindOfClass:[CPTBarPlot class]]) {
		//tip
		if ((fieldEnum == CPTBarPlotFieldBarTip) && (idx < [self.data count])) {
			//speed
			if ([plot.identifier isEqual:CPDTickerSymbolSpeed]) {
				return [[self.data objectAtIndex:idx] objectForKey:@"bartip"];
			}
		}
		//location
		else if((fieldEnum == CPTBarPlotFieldBarLocation) && (idx < [self.data count])) {
			return [NSDecimalNumber zero];
		}
	}
	/*For Scatter*/
	else if ([plot isKindOfClass:[CPTScatterPlot class]]) {
		//x轴信息
		if ((fieldEnum == CPTScatterPlotFieldX) && (idx < [self.data count])) {
			//oil
			if ([plot.identifier isEqual:CPDTickerSymbolOil]) {
				return [[self.data objectAtIndex:idx] objectForKey:@"scatterx"];
			}
		}
		//y轴信息
		else if ((fieldEnum == CPTScatterPlotFieldY) && (idx < [self.data count])) {
			//oil
			if ([plot.identifier isEqual:CPDTickerSymbolOil]) {
				return [[self.data objectAtIndex:idx] objectForKey:@"scattery"];
			}
		}
	}
	/*任何情况下保证有返回*/
	return [NSDecimalNumber zero];
}


@end
