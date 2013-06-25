//
//  LCDiagnoseViewController.h
//  Achilles
//
//  Created by weiyanen on 13-5-19.
//  Copyright (c) 2013年 cop-studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ECSlidingViewController.h"
#import "LCMenuViewController.h"
#import "LCDiagnoseCell.h"
#import "LCBizController.h"

@interface LCDiagnoseViewController : LCBizController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *diagnoseItems;

@property (weak, nonatomic) IBOutlet UITableView *diagnoseTableView;

@property (weak, nonatomic) IBOutlet CPTGraphHostingView *PieHostingView;

- (IBAction)revealMenu:(id)sender;

@end
