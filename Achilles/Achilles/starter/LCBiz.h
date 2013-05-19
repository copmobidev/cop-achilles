//
//  LCBiz.h
//  Achilles
//
//  Created by weiyanen on 13-5-18.
//  Copyright (c) 2013年 cop-studio. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LCBizPlotDelegate<NSObject>

@optional

- (void)initPlot;

- (void)configureHostingView;

- (void)configureGraph;

- (void)configurePlots;

- (void)configureAxes;

@end
