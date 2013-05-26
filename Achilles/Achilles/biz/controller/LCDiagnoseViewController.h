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

@interface LCDiagnoseViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *diagnoseItems;

@property (weak, nonatomic) IBOutlet UITableView *diagnoseTableView;

- (IBAction)revealMenu:(id)sender;

@end
