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

@interface LCDiagnoseViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *data;

- (IBAction)revealMenu:(id)sender;

@end
