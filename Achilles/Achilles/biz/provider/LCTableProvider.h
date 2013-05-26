//
//  LCTableProvider.h
//  Achilles
//
//  Created by weiyanen on 13-5-24.
//  Copyright (c) 2013年 cop-studio. All rights reserved.
//

#import "LCProvider.h"

@interface LCTableProvider : LCProvider <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray* bills;
@property (nonatomic, strong) NSIndexPath *selectIndex;
@property (assign) BOOL isOpen;

@property (nonatomic, strong) UITableView *billTableView;
@end
