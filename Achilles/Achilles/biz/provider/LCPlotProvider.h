//
//  LCPlotProvider.h
//  Achilles
//
//  Created by weiyanen on 13-5-18.
//  Copyright (c) 2013年 cop-studio. All rights reserved.
//

#import "LCProvider.h"

@interface LCPlotProvider : LCProvider <CPTPlotDataSource>

@property (nonatomic, strong) NSMutableArray *data;

@end
