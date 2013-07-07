//
//  LCBillViewController.h
//  Achilles
//
//  Created by weiyanen on 13-5-19.
//  Copyright (c) 2013年 cop-studio. All rights reserved.
//

#import "LCBizController.h"
#import "LCTableProvider.h"

@interface LCBillViewController : LCBizController

@property (nonatomic, weak) IBOutlet UITableView* billTableView;

@property (nonatomic, strong) LCTableProvider *tableProvider;

@property (weak, nonatomic) IBOutlet UILabel *yearLabel;


@end
